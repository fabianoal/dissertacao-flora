options(scipen=999,
    vsc.dev.args = list(width = 1920, height = 1080),
    max.print = 300, 
    tibble.print_max = 300, 
    tibble.print_min = 20, 
    width = 220, 
    digits = 2, 
    knitr.kable.NA = "",
    colorDF_theme = "dark")

dotenv::load_dot_env()

extrafont::loadfonts(device = "all", quiet = TRUE)

pt_BR_locale_para_readr <- readr::locale(date_names = "pt", decimal_mark = ",", grouping_mark = ".", encoding = "UTF-8")

exp_uteis <- local(
    {
        letras <- "[a-záàâãçéêíóôõú]"
        letras_ <- stringr::str_replace(letras, stringr::fixed("]"), " ]")
        LETRAS_ <- stringr::str_to_upper(letras_)
        letras <- "[a-záàâãçéêíóôõú]"
        letras_especiais <- stringr::str_replace(letras, stringr::fixed("[a-z"), "[")
        letras_ <- stringr::str_replace(letras, stringr::fixed("]"), " ]")
        nao_letras <- stringr::str_replace(letras, stringr::fixed("["), "[^")
        nao_letras_ <- stringr::str_replace(letras_, stringr::fixed("["), "[^")
        LETRAS <- stringr::str_to_upper(letras)
        LETRAS_e_numeros <- stringr::str_replace(LETRAS, stringr::fixed("]"), "0-9]")
        nao_LETRAS <- stringr::str_to_upper(nao_letras)
        nao_LETRAS_ <- stringr::str_to_upper(nao_letras_)
        LETRAS_ <- stringr::str_to_upper(letras_)
        letRAS <- stringr::str_replace(stringr::str_glue("{letras}{LETRAS}"), stringr::fixed("]["), "")
        letRAS_e_numeros <- stringr::str_replace(letRAS, stringr::fixed("]"), "0-9]")
        letRAS_ <- stringr::str_replace(letRAS, stringr::fixed("]"), " ]")
        letRAS_parenteses <- stringr::str_replace(letRAS, stringr::fixed("]"), " \\(\\)]")
        nao_letRAS <- stringr::str_replace(letRAS, stringr::fixed("["), "[^")
        nao_letRAS_ <- stringr::str_replace(letRAS_, stringr::fixed("["), "[^")

        list(
            "letras" = letras,
            "letras_" = letras_,
            "LETRAS_" = LETRAS_,
            "letras" = letras,
            "letras_especiais" = letras_especiais,
            "letras_" = letras_,
            "nao_letras" = nao_letras,
            "nao_letras_" = nao_letras_,
            "LETRAS" = LETRAS,
            "LETRAS_e_numeros" = LETRAS_e_numeros,
            "nao_LETRAS" = nao_LETRAS,
            "nao_LETRAS_" = nao_LETRAS_,
            "LETRAS_" = LETRAS_,
            "letRAS" = letRAS,
            "letRAS_e_numeros" = letRAS_e_numeros,
            "letRAS_" = letRAS_,
            "letRAS_parenteses" = letRAS_parenteses,
            "nao_letRAS" = nao_letRAS,
            "nao_letRAS_" = nao_letRAS_
        )
    }
)

#' Função que retira caracteres especiais de um texto
#' @param texto character
retira_caracteres_especiais <- function(texto){
    texto |>
    iconv(to='ASCII//TRANSLIT')
}

#' Função útil para converter um número em formato texto no padrão pt-br
#' @param texto_numero character
converte_numero <- function(texto_numero){
    readr::parse_number(texto_numero, locale = pt_BR_locale_para_readr) 
}

#' Função útil para formatar tabela kable
#' @param df dataframe
#' @param notas_rodape character
#' @param digitos integer
#' @param numeros vetor com nomes das colunas que tem números.
formata_tabela <- function(df, notas_rodape, digitos = 0, numeros = c()){
    df |>
    # gt::gt()
    knitr::kbl(
        digits = digitos, 
        format.args = list(big.mark = ".", decimal.mark = ",", scientific = FALSE)) |>
    knitr::kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) |>
    kableExtra::footnote(
        general_title = "",
        general = notas_rodape, 
        number = numeros, 
        footnote_as_chunk = T)
}

#' Função para configurar um tema para o ggplot2 com tamanho de fonte proporcional
#' @param fonte_base integer
obtem_tema <- function(fonte_base = 12) {

    fonte_pequena <- fonte_base
    fonte_media <- ceiling(fonte_base * 1.2)
    fonte_grande <- ceiling(fonte_base * 1.5)
    text_color <- "#002042"

    ggplot2::theme(
        text = ggplot2::element_text(family = "DejaVu Sans"),
        legend.title = ggplot2::element_blank(),
        legend.text = ggplot2::element_text(size = fonte_pequena, color = text_color),
        plot.title = ggplot2::element_text(size = fonte_grande, color = text_color),
        plot.subtitle = ggplot2::element_text(size = fonte_media, color = text_color),
        plot.caption = ggplot2::element_text(size = fonte_pequena, color = text_color, hjust = 0),
        plot.caption.position = "plot",
        plot.background = ggplot2::element_rect(colour = "white", fill = "white") ,
        plot.margin = ggplot2::unit(c(5, 5, 5, 5), "mm"),
        panel.background = element_rect(colour = "white", fill = "white") ,
        panel.grid.major.y = ggplot2::element_line(colour="grey", linewidth = 0.5, linetype = "solid"),
        panel.grid.major.x = ggplot2::element_blank(),
        axis.title = ggplot2::element_text(size = fonte_media, color = text_color),
        axis.text = ggplot2::element_text(size = fonte_pequena, color = text_color),
        axis.ticks = ggplot2::element_line(colour="grey", linewidth = 0.5, linetype = "solid"),
        axis.ticks.x = ggplot2::element_blank(),
        strip.text = ggplot2::element_text(size = fonte_pequena, color = text_color)
    ) 
}



# Funções para trabalhar a organização --------------------------------

#' Função auxiliar que, dado um identificador de prompt, retorna a pasta
#' onde os dados serão salvos.
#' @param identificador
obtem_pasta <- function(identificador, modelo = "deepseek-chat") {
    sprintf("./%s/%s", modelo, identificador)
}

#' Função auxiliar que retorna o conteúdo do arquivo de prompt identificado por
#' ./Prompts/<identificador>.txt
#' @param identificador
obtem_prompt_system <- function(identificador){
    readr::read_file(sprintf("./Prompts/%s.txt", identificador))
}

#' Função auxiliar que mostra um exemplo de prompt de um dataframe.
#' @param df dataframe
#' @param rn inteiro. Número da linha para usar de exemplo.
cat_exemplo_prompt <- function(df, rn = 50){
    exemplo <- df |>
        dplyr::filter(dplyr::row_number() == 100) |>
        purrr::transpose() |>
        purrr::pluck(1)
    cat("```{txt}\n", exemplo$Prompt, "\n```", sep = "")
}

#' Função auxiliar que mostra um exemplo de system prompt.
#' @param identificador identificador do prompt
cat_system_prompt <- function(identificador){
    cat("```{txt}\n", obtem_prompt_system(identificador), "\n```", sep = "")
}

#' Função auxiliar que mostra um exemplo de arquivo de saída.
#' @param df dataframe com coluna "Arquivo Saída"
#' @param rn inteiro com número do registro para usar.
cat_resultado <- function(df, rn = 50){
    exemplo <- df |>
        dplyr::filter(dplyr::row_number() == 100) |>
        purrr::transpose() |>
        purrr::pluck(1)
    cat("```{json}\n", 
    readr::read_file(exemplo$`Arquivo Saída`), "
    ```",
    sep = "")
}

#' Função auxiliar gera as variáveis "Arquivo Saída" e "Prompt"
#' no dataframe de recomendações
#' @param dataframe
#' @param pasta_saida
#' @param template template para gerar a coluna "Prompt"
adapta_dataframe <- function(df, pasta_saida, template){
    df |>
    dplyr::mutate(
        `Prefixo Arquivo` = stringr::str_replace(Arquivo, ".pdf", ""),
        `Arquivo Saída` = "{pasta_saida}/{`Prefixo Arquivo`}/{`# Constatação`}_{`# Recomendação`}.json" |>
                          stringr::str_glue(),
        Prompt = stringr::str_glue(template)) 
}

#' Função auxiliar que retorna o nome do arquivo que deve ser usado
#' para consolidar os resultados para um determinado prompt.
#' @param identificador identificador do prompt
obtem_nome_arquivo_resultados <- function(identificador, modelo = "deepseek-chat"){
    sprintf("./Dados Gerados/cls_%s_%s.rds", modelo, identificador)
}