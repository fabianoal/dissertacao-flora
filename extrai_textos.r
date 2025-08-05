library(pdftools)
library(tidyverse)

library(tm)
library(parallel)

rm(list = ls())
source("util.r")

pasta_downloads <- "/mnt/c/Users/fabia/Repos/dissertacao-flora/Downloads"
pasta_processados <- "/mnt/c/Users/fabia/Repos/dissertacao-flora/Relatórios Processados"


converte_pdf_dataframe <- function(nome_do_arquivo) {
  # nome_do_arquivo <- str_glue("{pasta_base_dados}/Relatório Consolidado(7).pdf")
  print(str_glue("Convertendo arquivo {nome_do_arquivo}"))

  texto_pdf <- pdf_text(nome_do_arquivo)

  # unlist(str_split(texto_pdf[[2]], "\\n"))
  total_paginas <- length(texto_pdf)

  df <- tibble(
      nome_arquivo = basename(nome_do_arquivo),
      numero_pagina_fisica = 1:total_paginas,
      pagina_original = texto_pdf
    ) |>
    mutate(linhas = map(pagina_original, \(pagina) unlist(str_split(pagina, "\\n")))) |>
    unnest_longer(linhas) |>
    mutate(linha = str_trim(linhas), .keep = "unused") |>
    select(-pagina_original) |>
    mutate(numero_linha = row_number(), .by = "numero_pagina_fisica") |>
    mutate(numero_linha_geral = row_number()) |>
    mutate(`Qtd Páginas` = total_paginas) |>
    filter(linha != "" & numero_pagina_fisica != 2) |> # sumário
    mutate(linha_final_pagina = max(numero_linha), .by=numero_pagina_fisica) |>
    mutate(`No. Auditoria` = str_extract(linha, "^Auditoria n. (\\d{3,10})$", 1)) |>
    mutate(`Unidade` = str_extract(linha, "^Unidade\\: (.*)$", 1)) |>
    mutate(`Seção` = str_trim(str_extract(linha, str_glue("[IVX]{{1,4}} \\- {LETRAS_}{{5,50}}")))) |>
    fill(!linha, .direction = "downup") |>
    filter(numero_linha >= 5 & numero_linha <= (linha_final_pagina - 4)) |>
    mutate(
      Dado = str_extract(linha, str_glue("^([A-Z].{{3,30}})\\:"), 1) |> str_trim(),
      Dado = if_else(linha == "Destinatários da Recomendação", "Destinatários da Recomendação", Dado),
      `No. Constatação` = str_extract(linha, "^Grupo\\:.*?Constata..o.*?(\\d{2,10})$", 1)) |>
    group_by(`Seção`) |>
    fill(!linha) |>
    ungroup() |>
    mutate(
      Dado = if_else(
        `Seção` == "I - DADOS BÁSICOS" | `Seção` == "IV - CONSTATAÇÕES",
        Dado,
        "S/I")
    ) |>
    summarise(
      `Conteúdo` = str_flatten(str_trim(linha), collapse = " "),
      `Linha Inicial` = min(numero_linha_geral),
      `Linha Final` = max(numero_linha_geral),
      `Página Inicial` = min(numero_pagina_fisica),
      `Página Final` = max(numero_pagina_fisica),
      .by=c(
        nome_arquivo,
        `No. Auditoria`,
        `Unidade`, 
        `Qtd Páginas`,
        `Seção`,
        `No. Constatação`,
        `Dado`
      ),
    ) 

  num_auditoria <- unique(df$`No. Auditoria`)
  write_rds(df, str_glue("{num_auditoria}.rds"))
}



lista_arquivos_pdf <- list.files(
    pasta_downloads,
    pattern = "\\.pdf$",
    full.names = TRUE
  ) |>
  unlist()


walk(lista_arquivos_pdf, converte_pdf_dataframe)
