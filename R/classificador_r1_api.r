pacotes_necessarios <- c(
        "foreach",
        "doParallel",
        "tidyverse",
        "httr2",
        "dotenv",
        "logger")

pacotes_instalados <- installed.packages()[, 1]

pacotes_para_instalar <- setdiff(pacotes_necessarios, pacotes_instalados)

if (length(pacotes_para_instalar) > 0){
    install.packages(pacotes_para_instalar, quiet = TRUE, repos = "https://cloud.r-project.org")
}

dotenv::load_dot_env()

library(tidyverse)
library(httr2)

#model <- "deepseek-reasoner"

model <- "deepseek-chat"
base_saida <- "./DeepSeek"

constatacoes_processadas <- list.files(base_saida, "*.json$", full.names = TRUE, recursive = TRUE)

system_prompt <- read_file("./Prompts/prompt_classificacao_1.txt")

recomencaoes <- read_rds("./Dados Gerados/auditorias.rds") |>
    select(Arquivo, Finalidade) |>
    inner_join(
        read_rds("./Dados Gerados/constatacoes.rds") |>
        select(Arquivo, Conformidade, `# Constatação`, `Constatação`),
        by = "Arquivo"
    ) |>
    inner_join(
        read_rds("./Dados Gerados/recomendacoes.rds") |>
        select(Arquivo, `# Constatação`, `# Recomendação`, Recomendação),
        by = c("Arquivo", "# Constatação")
    ) |>
    mutate(
        `Prefixo Arquivo` = str_replace(Arquivo, ".pdf", ""),
        `Arquivo Saída` = str_glue("{base_saida}/{model}/{`Prefixo Arquivo`}/{`# Constatação`}_{`# Recomendação`}.json")) |>
    select(-`Prefixo Arquivo`) |>
    filter(!(`Arquivo Saída` %in% constatacoes_processadas))

obtem_campo <- function(indice, campo){
    recomencaoes[indice, campo] |> 
    purrr::pluck(1)
}

obtem_req_body <- function(i) {
    prompt <- stringr::str_glue("
        Finalidade da auditoria: {obtem_campo(i, 'Finalidade')}\n\n
        Constatação:\n\n{obtem_campo(i, 'Constatação')}\n\n
        Recomendação:\n\n{obtem_campo(i, 'Recomendação')}") |>
        stringr::str_trim()

    list(
        "model" = model,
        "messages" = list(
            list(
                "role" = "system",
                "content" = system_prompt),
            list(
                "role" = "user",
                "content" = prompt)
        ),
        "stream" = FALSE,
        "temperature" = 1.0,
        "response_format" = list(
            "type" = "json_object"
        )
    )
}

base_request <- request("https://api.deepseek.com") |> 
            req_method("POST") |> 
            req_auth_bearer_token(Sys.getenv("API_KEY_DEEPSEEK")) |>
            req_headers("Content-Type"= "application/json") |>
            req_url_path("chat/completions") |>
            req_throttle(capacity = 15, fill_time_s = 60)

calcula_custo <- function(response_body){
    val_per_output_token <- 1.68/1e6
    val_per_input_cache_miss <- 0.56/1e6
    val_per_input_cache <- 0.07/1e6
    prompt_cache_miss_tokens <- resp_body$usage$prompt_cache_miss_tokens
    prompt_cache_hit_tokens <- resp_body$usage$prompt_cache_hit_tokens
    completion_tokens <- resp_body$usage$completion_tokens
    val_cache_miss <- prompt_cache_miss_tokens * val_per_input_cache_miss
    val_prompt <- prompt_cache_hit_tokens * val_per_input_cache
    val_completion <- completion_tokens * val_per_output_token
    valor_total <-  val_cache_miss + val_prompt + val_completion
    valor_total_reais <- valor_total * 5.3
    valor_total_reais

}

sequencia <- seq(1, nrow(recomencaoes))

requests <- map(sequencia,
        \(i) 
        base_request |>
        req_body_json(obtem_req_body(i), auto_unbox = TRUE)
    )

responses <- req_perform_parallel(requests, on_error = "continue", progress = TRUE)

walk(sequencia, function(i) {
    resp <- responses[[i]]

    arquivo_saida <- obtem_campo(i, 'Arquivo Saída')
    
    dir.create(dirname(arquivo_saida), showWarnings = FALSE, recursive = TRUE)

    if ("httr2_response" %in% class(resp)  && resp$status_code == 200 && resp_has_body(resp)) {
        resp |>
        resp_body_json(auto_unbox = TRUE) |>
        jsonlite::toJSON(auto_unbox = TRUE, pretty = TRUE) |>
        readr::write_file(arquivo_saida)
    }
})
