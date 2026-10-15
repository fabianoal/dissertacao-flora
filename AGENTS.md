# Repository Guidelines

## Project Structure & Module Organization

This repository supports a DENASUS audit-recommendation study. Keep analytical code in `R/`: `funcoes_setup.r` installs missing packages, `util.r` contains shared helpers, and classifier scripts belong alongside them. Write prompt templates in `Prompts/` as UTF-8 `.txt` files. Keep automation flow definitions in `RPA/`, citation styles and reference material in `Quarto/`, and analysis narratives, appendices, and tables as root-level `.qmd` documents.

Large, reproducibility-only inputs and generated model results live locally in `Downloads/`, `Dados Gerados/`, and `deepseek-chat/`. They are intentionally ignored; download them from the dataset linked in `README.md` and do not add them to commits.

## Build, Test, and Development Commands

Run commands from the repository root so document-relative paths resolve correctly.

```bash
quarto render "Análise Resultados.qmd"   # render the analysis to DOCX
quarto render "obtencao_preparacao_dados.qmd"  # render an appendix
Rscript R/classificador_local.r           # run the local Ollama classifier
```

Quarto setup chunks install required R packages when absent. `classificador_local.r` additionally requires a working local Ollama installation and the configured model. Rendering needs the ignored RDS inputs under `Dados Gerados/`.

## Dissertation PDF Workflow

The dissertation PDF has a dedicated build path in `Dissertação Flora.qmd` and `Quarto/pdf_body.lua`. The DOCX format uses its own reference document and is not affected by the PDF-specific options below.

Render from the repository root:

```bash
quarto render "Dissertação Flora.qmd" --to pdf
xelatex -interaction=nonstopmode -halt-on-error "Dissertação-Flora.tex"
```

The first command knits the R chunks, runs the Lua filter, and invokes XeLaTeX. The second XeLaTeX pass updates the table of contents and page references. `keep-tex: true` and `latex-clean: false` are PDF options in the dissertation YAML; they retain the generated `.tex`, `.aux`, `.toc`, and related files needed for that pass. The PDF output and these build intermediates are local generated artifacts and should not be committed.

The dissertation table `tbl-padroes-discordancia-efeitos` reads its prepared summary from `Dados Gerados/resumo_padroes_discordancia_efeitos.rds`. The summary is written by the classification summary chunk in `categorizacao_divergencias_efeitos_duradouros.qmd`. After changing that appendix or its final classification JSON files, render the appendix first and then render the dissertation. The dissertation checks source hashes and stops if the RDS is stale. The RDS lives in the ignored `Dados Gerados/` directory and is not committed.

## Citation Review and Editing

- Keep citations connected to the bibliography. In Quarto prose, cite sources with Pandoc citation syntax and the key from `Quarto/referencias.bibtex` (for example, `@silva2023` for a narrative citation and `[@silva2023]` for a parenthetical citation). Do not replace a keyed citation with a manually typed author, year, or other unlinked citation text.
- Choose the syntax according to the sentence. A narrative citation makes the author part of the sentence (`@silva2023 argumenta...`, rendered as Silva (2023)); a parenthetical citation places the citation at the relevant claim (`... [@silva2023]`, using the project’s configured CSL for punctuation and formatting). Do not join narrative author-year citations with a semicolon as if they were one parenthetical citation; integrate each author into the sentence or recast the sentence so a parenthetical citation is appropriate.
- When reviewing or applying a requested textual change that contains a citation without a BibTeX key—including citations copied from an author’s adjustment notes—always search `Quarto/referencias.bibtex` and the dissertation’s existing citations for the matching source. Verify the match using author or institutional author, year, and title or publication details, then replace the plain citation with the correct Pandoc citation key. Never leave a citation orphaned merely because the requested wording supplied it without a key, and never guess a key or source based only on a similar author or year.
- Reuse an existing matching key. If no matching bibliography entry exists, investigate the cited source and add or correct its BibTeX entry with a stable key before citing it. If the source cannot be identified reliably, flag the unresolved citation for review instead of inventing bibliographic details or leaving it as ordinary text.
- Preserve locators and citation intent when moving or rewriting citations. Put page or other locator information in Pandoc’s citation syntax (for example, `[@silva2023, p. 42]`) so the CSL formats it consistently. Use semicolons between multiple works within one parenthetical citation; for narrative citations, keep authors integrated into the sentence and let the citation processor format each keyed citation.
- After citation edits, inspect the source around each changed passage and render the affected document when practical. Check that the citation is narrative or parenthetical as intended, the key resolves to the expected bibliography item, locators appear correctly, and no raw `@key` or unlinked author-year text leaks into the output.

The source and assembly rules are:

- `Quarto/pdf_body.lua` removes the title and preliminary material from the Markdown body at the level-one `Introdução` heading, then inserts the separately prepared `_paginas_iniciais.docx.pdf` with `pdfpages`. Keep that eight-page A4 PDF beside the source document. Its pages are included with an empty page style so no page numbers are overprinted.
- The filter creates the lists in this order: Lista de Tabelas, Lista de Figuras, Sumário. Keep a `\clearpage` after each list so every section begins on a new page. The automatic Quarto PDF lists are disabled in YAML to avoid duplicate lists.
- The preliminary pages and lists are counted but have no visible page numbers. Arabic page numbering continues at the first textual page. `scrlayer-scrpage` places the number at the upper right; the page number uses a 10-point roman font. This follows the pagination guidance in `referencias/Manual de Normalização UFT 2022.txt` (section 2.10, printed page 21).
- The printed Sumário uses depth 2. `bookmarksdepth=5` retains deeper headings in PDF navigation. KOMA-Script section entry fonts are set explicitly so level-one Sumário entries and their page numbers use the main Cambria roman family. Internal links are black.
- Body prose uses 1.5 line spacing and a 1.25 cm first-line paragraph indent, including the first paragraph after a heading (`indentfirst`). Block quotations use single spacing, 4 cm left indent, and 10-point text; the references environment uses single spacing. These settings follow sections 2.3 and 2.6 of the UFT manual.
- The list of tables stops receiving entries at the first Apêndice heading, using `\captionsetup[table]{list=false}`. This suppresses only list entries; table captions, numbering, and tables remain in the appendices. The list of figures is not filtered.
- Long prompt blocks are wrapped by words at 65 characters in the Lua filter. R code blocks are identified by common R syntax and wrapped at safe commas, pipes, or spaces within open expressions at 60 characters. Keep these transformations in the Lua filter; ordinary `listings` wrapping does not control Pandoc's `Highlighting` environment.

PDF typography and line layout are configured under `format: pdf`: XeLaTeX, Cambria, A4 paper, 2.5 cm top and bottom margins, 3 cm left and right margins, Tango syntax colors, and KOMA-Script heading fonts. `xurl` permits breaks in long URLs, while `\emergencystretch` helps TeX fit prose. The Lua filter also sets black link colors and the custom list titles. Required LaTeX packages declared in `header-includes` include `pdfpages`, `fontspec`, `xcolor`, `listings`, `caption`, `xurl`, and `scrlayer-scrpage`.

For PDF changes, verify the final rendered pages visually: confirm the eight preliminary pages have no visible page numbers, the three lists start on separate pages, numbering begins at the first textual page at upper right, prompt and R code lines fit their blocks, hyperlinks are black, and appendix tables do not appear in the list of tables. Inspect the refreshed `.toc` after the second XeLaTeX pass when checking page references. A missing Portuguese hyphenation-pattern warning may appear if the TeX system cannot install `hyphen-portuguese`; XeLaTeX can still finish, but Portuguese hyphenation may be less refined.

## Coding Style & Naming Conventions

Follow the existing R style: four-space indentation, `<-` for assignment, `snake_case` for objects and functions, and native pipes (`|>`) for data transformations. Prefer explicit package namespaces in reusable helpers (for example, `readr::read_rds()`) and add roxygen-style comments for new shared functions. Preserve Portuguese field names, accents, and established filenames; use descriptive UTF-8 names such as `Análise Resultados.qmd` or `cls_cod_2.txt`.

## Testing and Validation

There is no automated test framework or coverage target. Validate code by rendering every affected `.qmd` document and inspecting generated tables, figures, and citations. For classifier changes, first run a small, representative input and check the expected JSON/RDS output path before processing the full dataset. Never treat ignored local data as a test artifact to commit.

## Commit & Pull Request Guidelines

Recent history uses short, imperative Portuguese summaries, e.g. `Corrige titulo e acentos do README` and `Refatoração dos prompts`. Keep commits focused and describe the affected document, script, or prompt. Pull requests should explain the analytical impact, identify any required dataset or model configuration, link related issues when available, and include screenshots or generated DOCX/PDF excerpts when layout or tables change. Do not commit credentials, `.env` files, source PDFs, or generated data.
