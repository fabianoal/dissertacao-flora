library(tidyverse)
library(colorDF)
library(extrafont)
library(ggplot2)
library(ggthemes)
library(kableExtra)
library(formattable)

options(scipen=999,
    vsc.dev.args = list(width = 1920, height = 1080),
    max.print = 300, 
    tibble.print_max = 300, 
    tibble.print_min = 20, 
    width = 220, 
    digits = 2, 
    knitr.kable.NA = "",
    colorDF_theme = "dark")

pt_BR_locale_para_readr <- locale(date_names = "pt", decimal_mark = ",", grouping_mark = ".", encoding = "UTF-8")

pasta_base_dados <- "/mnt/c/Users/fabia/Repos/dissertacao-flora/Downloads"

letras <- "[a-záàâãçéêíóôõú]"
letras_ <- str_replace(letras, fixed("]"), " ]")
LETRAS_ <- str_to_upper(letras_)


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
letRAS_parenteses <- str_replace(letRAS, fixed("]"), " \\(\\)]")
nao_letRAS <- str_replace(letRAS, fixed("["), "[^")
nao_letRAS_ <- str_replace(letRAS_, fixed("["), "[^")

loadfonts(device = "all", quiet = TRUE)

retira_caracteres_especiais <- function(texto){
    texto |>
    iconv(to='ASCII//TRANSLIT')
}

converte_numero <- function(texto_numero)
    parse_number(texto_numero, locale = pt_BR_locale_para_readr) 


funcao_log <- function(prefixo){
    arquivo_log <- now() |> as.character() |> str_replace_all("(:|\\.)", "-")
    arquivo_log <- str_glue("./logs/{prefixo}_{arquivo_log}.txt")
    function(mensagem){
        data_hora <- now() |> as.character()
        print(str_glue("{data_hora}; {mensagem}"))
        write_lines(str_glue("{data_hora}; {mensagem}"), arquivo_log, append = TRUE)
    }
}

formata_tabela <- function(df, notas_rodape, digitos = 0, numeros = c()){
    df |>
    # gt::gt()
    kbl(
        digits = digitos, 
        format.args = list(big.mark = ".", decimal.mark = ",", scientific = FALSE)) |>
    kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) |>
    kableExtra::footnote(
        general_title = "",
        general = notas_rodape, 
        number = numeros, 
        footnote_as_chunk = T)
}

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

