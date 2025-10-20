#' Função que, dada uma lista de pacotes, checa quais já estão instalados 
#' e instala somente os que faltam
#' @param pacotes_necessarios character
instala_pacotes <- function(pacotes_necessarios) {
    pacotes_instalados <- installed.packages()[, 1]

    pacotes_para_instalar <- setdiff(pacotes_necessarios, pacotes_instalados) |>
        unique()

    if (length(pacotes_para_instalar) > 0){
        install.packages(pacotes_para_instalar, quiet = TRUE, repos = "https://cloud.r-project.org")
    }
}
