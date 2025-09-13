library(tidyverse)
# library(httr2)
library(ollamar)

# test_connection()

modelo <- "deepseek-r1:7b"

processados <- tibble(arquivo = list.files("../dados/DeepSeekLocal", "*txt$", full.names = FALSE)) |>
    mutate(`No. Constatação` = str_extract(arquivo, "\\d*"))
     

constatacoes <-  read_rds("constatacoes.rds") |>
    filter(!is.na(`Recomendação`)) |>
    anti_join(processados, by="No. Constatação") |>
    transpose()

prompt_template <- read_lines("template_prompt_individuais.txt") |> str_flatten(collapse = "\n")

for (constatacao in constatacoes){
    # constatacao <- constatacoes[[1]]
    # constatacao |> str()

    print(str_glue("Processando batch {constatacao$`No. Constatação`}"))

    prompt <- prompt_template |>
        str_replace(fixed("<constatacao>"), constatacao$Constatação) |>
        str_replace(fixed("<recomendacao>"), constatacao$`Recomendação`)


    start_time <- Sys.time()
    resp <- ollamar::generate(modelo, prompt,  keep_alive = "60m") |>
        resp_process("text")

    write_lines(resp, str_glue("../dados/DeepSeekLocal/{constatacao$`No. Constatação`}.txt"), append = FALSE)

    # Your instruction here
    end_time <- Sys.time()
    elapsed_time <- end_time - start_time
    print(str_glue("Processamento gastou {prettyNum(elapsed_time)}"))
}





