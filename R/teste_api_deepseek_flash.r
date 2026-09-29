# Diagnóstico mínimo da API do DeepSeek.
# Este script não envia dados da auditoria.

pacotes_necessarios <- c("dotenv", "httr2", "jsonlite")
pacotes_instalados <- rownames(installed.packages())
pacotes_para_instalar <- setdiff(pacotes_necessarios, pacotes_instalados)

if (length(pacotes_para_instalar) > 0) {
    install.packages(
        pacotes_para_instalar,
        quiet = TRUE,
        repos = "https://cloud.r-project.org")
}

source("./R/util.r")

modelo <- Sys.getenv(
    "DEEPSEEK_MODEL",
    unset = "deepseek-flash")
endpoint <- "https://api.deepseek.com/chat/completions"

cat("=== Diagnóstico DeepSeek ===\n")
cat("Modelo:", modelo, "\n")
cat("Endpoint:", endpoint, "\n")
cat(".env existe:", file.exists(".env"), "\n")
cat(".env-local existe:", file.exists(".env-local"), "\n")

api_key <- tryCatch(
    obtem_api_key_deepseek(),
    error = function(erro) {
        cat("Erro ao carregar a chave:", conditionMessage(erro), "\n")
        NULL
    })

if (is.null(api_key)) {
    quit(save = "no", status = 1)
}

cat("Chave carregada:", nzchar(api_key), "\n")
cat("Tamanho da chave:", nchar(api_key), "caracteres\n")

corpo <- list(
    model = modelo,
    messages = list(
        list(
            role = "system",
            content = "Responda exclusivamente com JSON válido."),
        list(
            role = "user",
            content = "Responda com uma saudação curta.")),
    stream = FALSE,
    temperature = 0,
    max_tokens = 100,
    thinking = list(type = "disabled"),
    response_format = list(type = "json_object"))

requisicao <- httr2::request(endpoint) |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(api_key) |>
    httr2::req_headers("Content-Type" = "application/json") |>
    httr2::req_body_json(corpo, auto_unbox = TRUE) |>
    httr2::req_timeout(30)

inicio <- Sys.time()
resposta <- tryCatch(
    httr2::req_perform(requisicao),
    error = function(erro) erro)
fim <- Sys.time()

cat("Tempo decorrido:", round(as.numeric(difftime(fim, inicio, units = "secs")), 2), "segundos\n")

if (inherits(resposta, "error")) {
    cat("Tipo do resultado: erro local de transporte\n")
    cat("Mensagem:", conditionMessage(resposta), "\n")
    quit(save = "no", status = 2)
}

cat("Status HTTP:", resposta$status_code, "\n")
cat("Content-Type:", httr2::resp_header(resposta, "content-type"), "\n")
cat("Request ID:", httr2::resp_header(resposta, "x-request-id"), "\n")
cat("Corpo da resposta:\n")

corpo_resposta <- tryCatch(
    httr2::resp_body_string(resposta),
    error = function(erro) paste("<falha ao ler corpo>", conditionMessage(erro)))

cat(corpo_resposta, "\n")

if (resposta$status_code >= 200 && resposta$status_code < 300) {
    cat("Diagnóstico: chamada concluída com sucesso.\n")
    quit(save = "no", status = 0)
}

cat("Diagnóstico: a API respondeu com erro HTTP.\n")
quit(save = "no", status = 3)
