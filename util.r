library(tidyverse)
library(xml2)
library(httr)
library(jsonlite)

# Options -----------------------------------------------
options(scipen=999,
    vsc.dev.args = list(width = 1080, height = 1080),
    max.print = 15, 
    width = 180, 
    digits = 2, 
    knitr.kable.NA = "",
    colorDF_theme = "dark")

# Coisas Microsoft Graph  -------------------------------------

base_url <- 'https://graph.microsoft.com/'

# Utilidades de processamento de texto

letras <- "[a-záàâãçéêíóôõú]"
letras_especiais <- str_replace(letras, fixed("[a-z"), "[")
letras_ <- str_replace(letras, fixed("]"), " ]")
nao_letras <- str_replace(letras, fixed("["), "[^")
nao_letras_ <- str_replace(letras_, fixed("["), "[^")
LETRAS <- str_to_upper(letras)
LETRAS_e_numeros <- str_replace(LETRAS, fixed("]"), "0-9]")
nao_LETRAS <- str_to_upper(nao_letras)
nao_LETRAS_ <- str_to_upper(nao_letras_)
LETRAS_ <- str_to_upper(letras_)
letRAS <- str_replace(str_glue("{letras}{LETRAS}"), fixed("]["), "")
letRAS_e_numeros <- str_replace(letRAS, fixed("]"), "0-9]")
letRAS_ <- str_replace(letRAS, fixed("]"), " ]")
nao_letRAS <- str_replace(letRAS, fixed("["), "[^")
nao_letRAS_ <- str_replace(letRAS_, fixed("["), "[^")

retira_caracteres_especiais <- function(texto){
    texto |>
    iconv(to='ASCII//TRANSLIT')
}

canoniza_texto <- function(texto){
    texto |>
    retira_caracteres_especiais() |>
    str_to_lower() |>
    str_replace_all("[^a-z]", " ") |>
    str_trim() |>
    str_replace_all("( e)? [a-z]{1,3} ", " ")  |>
    str_replace_all(" {2,}", " ") 
}

quebra_linha_meio <- function(coluna_origem){
    regex_para_quebra <- "(?<=.{#in,#out}?) (?!([aàeo] |ao |d[eao]s? ))"

    cria_regex <- function(str_regex, inicio, fim){
        regex_para_quebra |>
        str_replace("#in", as.character(inicio)) |>
        str_replace("#out", as.character(fim)) 
    }
    
    posicao_metade = ceiling(mean(str_length(coluna_origem))  * .5)
    posicao_fim = ceiling(posicao_metade * 1.2)
    regex = cria_regex(regex_para_quebra, posicao_metade, posicao_fim)
    str_replace(coluna_origem, regex(regex, ignore_case = TRUE), "\n")
}

quebra_linha_espacos <- function(coluna_origem){
    regex_para_quebra <- regex(" (?!([aàeo] |ao |d[eao]s? ))", ignore_case = TRUE)
    str_replace_all(coluna_origem, regex_para_quebra, "\n")
}

duas_primeiras_palavras <- function(coluna){
    regex_para_quebra <- regex(" ([aàeo] |ao |d[eao]s? )", ignore_case = TRUE)
    regex_extracao <- regex("(.*?\\n.*?)[ \\n]", ignore_case = TRUE)
    coluna |>
    str_replace_all(regex_para_quebra, "\n") |>
    str_extract(regex_extracao, 1)
}

# Utilidades de gráficos ----------------------------------

loadfonts(device = "all", quiet = TRUE)

meu_tema <- theme(
    text = element_text(family = "Noto Sans", color = "#002042"),
    legend.title = element_blank(),
    legend.text = element_text(size = 12, color = "#002042"),
    plot.title = element_text(size = 16, color = "#002042"),
    plot.subtitle = element_text(size = 12, color = "#002042"),
    plot.caption = element_text(size = 12, color = "#002042", hjust = 0),
    plot.caption.position = "plot",
    plot.background = element_rect(colour = "white", fill = "white") ,
    plot.margin = unit(c(5, 5, 5, 5), "mm"),
    panel.background = element_rect(colour = "white", fill = "white") ,
    panel.grid.major.y = element_line(colour="grey", linewidth = 0.2, linetype = "solid"),
    panel.grid.major.x = element_blank(),
    axis.title = element_text(size = 14, color = "#002042"),
    axis.text = element_text(size = 12, color = "#002042"),
    axis.ticks = element_line(colour="grey", linewidth = 0.2, linetype = "solid"),
    axis.ticks.y = element_line(colour="grey", linewidth = 0.2, linetype = "solid"),
    axis.ticks.x = element_blank()
) 

# Utilidades para leitura de arquivos ----------------------------------
pt_BR_locale_para_readr <- locale(date_names = "pt", decimal_mark = ",", grouping_mark = ".", encoding = "UTF-8")

converte_numero <- function(texto_numero)
    parse_number(texto_numero, locale = pt_BR_locale_para_readr) 

