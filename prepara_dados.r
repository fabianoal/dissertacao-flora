library(tidyverse)

rm(list = ls())
source("util.r")

pasta_processados <- "/mnt/c/Users/fabia/Repos/dissertacao-flora/Relatórios Processados"


lista_arquivos_rds <- list.files(
    "./Processados",
    pattern = "\\.rds$",
    full.names = TRUE
  )

relatorios <- map(lista_arquivos_rds, read_rds) |>
    bind_rows()

auditorias <- relatorios |>
    mutate(`Conteúdo` = str_remove(`Conteúdo`, str_glue("^{Dado}[\\: ]")) |> str_trim()) |>
    filter(`Seção` == "I - DADOS BÁSICOS" & !is.na(Dado)) |>
    select(nome_arquivo,  `No. Auditoria`, Unidade, `Qtd Páginas`, Dado, `Conteúdo`) |>
    pivot_wider(
        id_cols = c(nome_arquivo,  `No. Auditoria`, Unidade, `Qtd Páginas`),
        names_from = `Dado`, values_from = `Conteúdo`) 

constatacoes <- relatorios |>
    mutate(`Conteúdo` = str_remove(`Conteúdo`, str_glue("^{Dado}[\\: ]")) |> str_trim()) |>
    filter(`Seção` == "IV - CONSTATAÇÕES" & !is.na(Dado) & !is.na(`No. Constatação`)) |>
    select(`No. Auditoria`, `No. Constatação`, Dado, `Conteúdo`) |>
    pivot_wider(
        id_cols = c(`No. Auditoria`, `No. Constatação`),
        names_from = `Dado`, values_from = `Conteúdo`)


relatorios |>
# mutate(`Conteúdo` = str_remove(`Conteúdo`, "^[A-Z].{3,30}\\: ") |> str_trim()) |>
filter(`Seção` == "I - DADOS BÁSICOS" & !is.na(Dado)) |>
select(Dado) |>
distinct()



pivot_wider(
    id_cols = c(`No. Auditoria`, `No. Constatação`),
    names_from = `Dado`, values_from = `Conteúdo`) |>
View() 

