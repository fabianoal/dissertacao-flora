library(tidyverse)
library(httr2)
library(dotenv)

install.packages(
    c(
        "tidyverse",
        "httr2",
        "dotenv",
        "duckdb",
        "languageserver"
    )
)


# dados <- list.files("./DeepSeekAPI", "*rds$", full.names = TRUE) |>
#     map(read_rds) |>
#     enframe() |>
#     unnest_wider(value) |>
#     unnest_longer(choices) |>
#     unnest_wider(choices) |>
#     unnest_wider(message) |>
#     mutate(content = )


constatacoes_batches <-  read_rds("constatacoes.rds") |>
    filter(!is.na(`Recomendação`)) |>
    mutate(`Recomendação Identificada` = str_glue("ID: {`No. Constatação`}\n{`Recomendação`}")) |>
    mutate(
        Tamanho = str_length(`Recomendação Identificada`)/4,
        Qtd_Tokens = cumsum(Tamanho), 
        Batch = Qtd_Tokens %/% 1025) |>
    summarise(
        Texto = str_flatten(`Recomendação Identificada`, collapse = "\n\n"),
        Qtd = n_distinct(`No. Constatação`),
        .by=Batch
    ) |>
    transpose()

prompt_template <- read_lines("template_prompt.txt") |> str_flatten(collapse = "\n")

val_per_output_token <- 2.19/1000000
val_per_input_cache_miss <- 0.55/1000000
val_per_input_cache <- 0.14/1000000

for (batch in constatacoes_batches |> keep(\(el) el$Batch > 10)){
    #batch <- constatacoes_batches[[1]]

    tentativa <- 1

    while (tentativa < 10){
        print(str_glue("Processando batch {batch$Batch} com {batch$Qtd} recomendações. Tentativa {tentativa}"))

        prompt <- str_replace(prompt_template, fixed("<recomendacoes>"), batch$Texto)


        req_body <- list(
                "model" = "deepseek-reasoner",
                "messages" = list(
                    list("role"= "system", "content"= "Você é um assistente especializado em análise textual e categorização."),
                    list("role"= "user", "content"= prompt)
                ),
                "stream" = FALSE
            )

        #jsonlite::toJSON(req_body, auto_unbox = TRUE)

        req <- request("https://api.deepseek.com") |> 
            req_method("POST") |> 
            req_auth_bearer_token(api_key) |>
            req_headers("Content-Type"= "application/json") |>
            req_url_path("chat/completions") |>
            req_body_json(req_body, auto_unbox = TRUE) |>
            req_perform()
            

        if (req$status_code == 200 && req |> resp_has_body()){
            response <- req |>
                resp_body_json()

            valor <- response$usage$prompt_cache_miss_tokens * val_per_input_cache_miss + response$usage$prompt_cache_hit_tokens * val_per_input_cache + response$usage$completion_tokens * val_per_output_token
            
            print(str_glue("Prompt no cache:{response$usage$prompt_cache_miss_tokens}. Prompt cache hit: {response$usage$prompt_cache_hit_tokens}. Completion: {response$usage$completion_tokens}. Valor da chamada: {valor}"))

            write_rds(response, str_glue("./DeepSeekAPI/{response$id}.rds"))

            tentativa <- 1000
        } else {
            print(str_glue("Erro na chamada."))
            Sys.sleep(60 * tentativa)
            tentativa <- tentativa + 1
        }
    }
}





