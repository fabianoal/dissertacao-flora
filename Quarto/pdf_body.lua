-- Render only the dissertation body for the PDF assembled after the
-- separately rendered preliminary pages.
local function wrap_prompt_line(line, width)
  local indent = line:match("^%s*") or ""
  local words = {}
  for word in line:gmatch("%S+") do
    words[#words + 1] = word
  end

  local wrapped = {}
  local current = indent
  for _, word in ipairs(words) do
    if #current > #indent and #current + #word + 1 > width then
      wrapped[#wrapped + 1] = current
      current = indent .. word
    elseif #current == #indent then
      current = current .. word
    else
      current = current .. " " .. word
    end
  end
  wrapped[#wrapped + 1] = current
  return wrapped
end

local function wrap_r_line(line, width)
  local result = {}
  local current = line

  while #current > width do
    local quote, escaped, depth = nil, false, 0
    local candidate = nil
    local indent = current:match("^%s*") or ""

    for i = 1, math.min(width, #current) do
      local char = current:sub(i, i)
      local next_char = current:sub(i + 1, i + 1)

      if quote then
        if escaped then
          escaped = false
        elseif char == "\\" then
          escaped = true
        elseif char == quote then
          quote = nil
        end
      elseif char == '"' or char == "'" or char == "`" then
        quote = char
      elseif char == "#" then
        break
      else
        if char == "(" or char == "[" or char == "{" then
          depth = depth + 1
        elseif char == ")" or char == "]" or char == "}" then
          depth = math.max(0, depth - 1)
        elseif char == "," and depth > 0 then
          candidate = i
        elseif char == "|" and next_char == ">" then
          candidate = i + 1
        elseif char:match("%s") and depth > 0 then
          candidate = i
        end
      end
    end

    if not candidate or candidate <= #indent then
      break
    end

    result[#result + 1] = current:sub(1, candidate)
    current = indent .. "    " .. current:sub(candidate + 1):gsub("^%s+", "")
  end

  result[#result + 1] = current
  return result
end

function Pandoc(doc)
  local intro_index = nil
  local first_appendix_index = nil

  for i, block in ipairs(doc.blocks) do
    if block.t == "Header" and block.level == 1 and
        pandoc.utils.stringify(block):match("^Introdução$") then
      intro_index = i
      break
    end
  end

  for i, block in ipairs(doc.blocks) do
    if block.t == "Header" and
        pandoc.utils.stringify(block):match("^Apêndice [A-Z]") then
      first_appendix_index = i
      break
    end
  end

  if not intro_index then
    error("Cabeçalho de nível 1 'Introdução' não encontrado.")
  end

  doc.meta.title = nil
  doc.meta.author = nil
  doc.meta.date = nil

  local prelude = pandoc.RawBlock("latex", [[
\includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{_paginas_iniciais.docx.pdf}
% A capa não entra na contagem; a contagem começa na folha de rosto.
\addtocounter{page}{-1}
\renewcommand{\listtablename}{Lista de Tabelas}
\renewcommand{\listfigurename}{Lista de Figuras}
\renewcommand{\contentsname}{Sumário}
\pagestyle{empty}
\setcounter{tocdepth}{2}
\hypersetup{colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,bookmarksdepth=5}
\makeatletter
\let\codexSavedPlain\ps@plain
\let\ps@plain\ps@empty
\makeatother
\listoftables
\clearpage
\listoffigures
\clearpage
\tableofcontents
\setcounter{tocdepth}{5}
\clearpage
\makeatletter
\let\ps@plain\codexSavedPlain
\makeatother
\pagestyle{scrheadings}
\clearpage
\KOMAoptions{parskip=false}
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}
\onehalfspacing
]])

  local blocks = pandoc.List({prelude})
  local prompt_level = nil
  for i = intro_index, #doc.blocks do
    local block = doc.blocks[i]

    if block.t == "CodeBlock" and
        (block.text:match("%s<%-%s") or block.text:match("|>") or
         block.text:match("function%s*%(") or
         block.text:match("^%s*library%s*%(")) and
        not block.classes:includes("r") then
      block.classes:insert("r")
    end

    if block.t == "Header" then
      local title = pandoc.utils.stringify(block)
      if title:match("^Prompt") then
        prompt_level = block.level
      elseif prompt_level and block.level <= prompt_level then
        prompt_level = nil
      end
    elseif block.t == "CodeBlock" and
        (block.classes:includes("txt") or prompt_level or
         block.text:match("O usuário é um pesquisador") or
         block.text:match("Finalidade da auditoria:")) then
      block.classes:insert("txt")
      block.text = block.text:gsub("^[ \t]+", "", 1)
      local wrapped = {}
      for line in (block.text .. "\n"):gmatch("(.-)\n") do
        for _, wrapped_line in ipairs(wrap_prompt_line(line, 65)) do
          wrapped[#wrapped + 1] = wrapped_line
        end
      end
      block.text = table.concat(wrapped, "\n")
    elseif block.t == "CodeBlock" and block.classes:includes("r") then
      local wrapped = {}
      for line in (block.text .. "\n"):gmatch("(.-)\n") do
        for _, wrapped_line in ipairs(wrap_r_line(line, 60)) do
          wrapped[#wrapped + 1] = wrapped_line
        end
      end
      block.text = table.concat(wrapped, "\n")
    end

    if i == first_appendix_index then
      blocks:insert(pandoc.RawBlock("latex", [[
\captionsetup[table]{list=false}
]]))
    end
    blocks:insert(block)
  end

  doc.blocks = blocks
  return doc
end
