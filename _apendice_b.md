# Apêndice B --- Processo de Codificação para Análise das Recomendações do DENASUS

### Introdução {#introdução}

Este documento descreve os procedimentos adotados para classificar as recomendações emitidas pelo DENASUS, com base nos critérios definidos na pesquisa.

De forma geral, a classificação foi realizada por meio de chamadas à API do provedor de LLM selecionado, utilizando-se um prompt estruturado. As instruções de codificação foram inseridas no papel *system*, enquanto os dados das recomendações foram inseridos no papel *user*.

O texto também apresenta a estrutura de organização dos dados, os procedimentos de interação com a API, a forma de armazenamento dos resultados conforme o modelo definido e a posterior tabulação das informações.

A seguir, apresenta-se uma amostra dos dados utilizados na composição dos prompts.

    recomendacoes <- read_rds("./Dados Gerados/dataset_consolidado.rds")

    recomendacoes |>
    select(Finalidade, `# Constatação`, `Constatação`, `# Recomendação`, `Recomendação`) |>
    head(10) |>
    mutate(
        Finalidade = str_trunc(Finalidade, 14, ellipsis = "…"),
        `Constatação` = str_trunc(`Constatação`, 22, ellipsis = "…"),
        `Recomendação` = str_trunc(`Recomendação`, 22, ellipsis = "…")
    ) |>
    rename(
        `# Const.` = `# Constatação`,
        `# Rec.` = `# Recomendação`,
        ) |>
    knitr::kable()

  ----------------------------------------------------------------------------------------------
  Finalidade         \# Const.   Constatação                  \# Rec. Recomendação
  ------------------ ----------- -------------------------- --------- --------------------------
  Verificar a r...   671301      A Secretaria Municipa...           1 Instruir adequadament...

  Verificar a r...   671302      A Secretaria Municipa...           1 Instruir os processos...

  Verificar a r...   671304      Os Avisos de Edital e...           1 Realizar as publicaçõ...

  Verificar a r...   671305      As Minutas do Contrat...           1 Estabelecer procedime...

  Verificar a r...   671306      As Atas dos Pregões E...           1 Implementar medidas p...

  Verificar a r...   671307      A Secretaria Municipa...           1 Assegurar que nos cas...

  Verificar a r...   671308      A ratificação do Proc...           1 Assegurar que as publ...

  Verificar a r...   671312      O Processo de Dispens...           1 Assegurar que os proc...

  Verificar a r...   671314      No Processo de Dispen...           1 Adotar medidas que as...

  Verificar a r...   671323      O Processo Administra...           1 Adotar medidas que as...
  ----------------------------------------------------------------------------------------------

  : Amostra dos dados de recomendações

O processo de categorização foi dividido em etapas correspondentes aos diferentes prompts definidos na pesquisa. Para cada *prompt*, foi realizada uma chamada à API do fornecedor selecionado, e os resultados foram armazenados em arquivos organizados segundo o modelo descrito na próxima seção.

Ao final, os dados foram consolidados em um *dataset* final, que serviu de base para a análise.

A estrutura adotada para organização dos arquivos permitiu identificar eventuais chamadas com erro e repetir apenas essas interações, assegurando a obtenção completa dos resultados para o conjunto de recomendações analisado.

### Organização dos Dados

Considerando que os fornecedores de LLMs disponibilizam múltiplos modelos e que a pesquisa faz uso de diferentes prompts, optou-se por estruturar os resultados de cada chamada à API em diretórios organizados de forma hierárquica. Essa estrutura leva em conta o identificador do prompt, bem como as variáveis fornecedor, modelo, nome do relatório PDF, número da constatação e número da recomendação. O padrão de nomenclatura adotado para os arquivos foi o seguinte:

    <modelo>\<prompt>\<arquivo>\<constatação>_<recomendação>.json

Onde:

- modelo: Nome do modelo (deepseek-chat, deepseek-reasoner, o4-mini etc.)
- prompt: nome do arquivo que contém o prompt sem a extensão (ex: prompt_1)
- arquivo: nome do relatório PDF sem a extensão ".pdf"
- constatação: número que identifica a constatação (extraído do texto do relatório)
- recomendação: número que identifica a recomendação (numeração incremental criada para cada recomendação no contexto de uma constatação)
- .json sufixo padrão para arquivos no formato `json`, que é o formato usado pelas APIs.

Para identificar quais recomendações ainda não foram classificadas, foi gerado, no *dataframe* das recomendações, o nome do arquivo de destino para cada chamada, conforme o padrão descrito acima. Em seguida, foram filtradas apenas aquelas recomendações cujos respectivos arquivos ainda não constavam entre os já processados. Assim, quando todas as recomendações já tiverem sido classificadas e os arquivos correspondentes existirem, o filtro resultará em um *dataframe* vazio.

É importante destacar que, como o nome do arquivo de saída inclui o identificador do *prompt*, o nome do fornecedor e o modelo utilizado, qualquer alteração em uma dessas variáveis implicará uma nova rodada de classificação, limitada ao que ainda não foi processado para a nova combinação prompt/modelo.

### Implementação das Funções de Necessárias

Com o modelo de organização de dados definido, estruturou-se o processo de chamadas à API em três etapas principais, descritas a seguir:

1.  A obtenção das recomendações não processadas consiste em gerar, no *dataframe,* uma coluna com o nome do arquivo onde a recomendação será salva, conforme detalhado na seção anterior. Com base nessa coluna, filtra-se apenas recomendações cujos arquivos ainda não existem no sistema de arquivos, compondo assim o conjunto de recomendações pendentes.
2.  Com as recomendações pendentes, é criada uma requisição (que representa uma chamada na API) por recomendação e executa-se todas essas chamadas usando-se a função `req_perform_parallel` do pacote *httr2* (WICKHAM, 2025), o qual implementa todo o controle de chamadas em paralelo.
3.  Após o término das chamadas, salva-se o conteúdo de cada resposta em um arquivo `.``json` conforme especificado na seção anterior para as chamadas que resultaram em sucesso.

O fluxo definido acima foi implementado pela função `executa_chamadas`, utilizada nas seções posteriores para operacionalizar as duas etapas definidas para o presente trabalho.

A seguir, apresenta-se o conjunto de funções criado para aplicar os prompts e armazenar os resultados:

    #' Função auxiliar que, dada uma pasta de saída, lê os arquivos .json, e
    #' retorna o dataset recomendacoes filtrado contendo somente recomendações
    #' cujo campo "Arquivo Saída" não consta na lista de arquivos existentes na pasta.
    #' @param dataframe
    #' @param pasta_saida
    obtem_recomendacoes_pendentes <- function(df, pasta_saida){
        recomendacoes_processadas <- list.files(pasta_saida, "*.json$", full.names = TRUE, recursive = TRUE)
        df |>
        filter(!(`Arquivo Saída` %in% recomendacoes_processadas))
    }

    #' Função auxiliar que, dado um dataframe com as colunas "Prompt" e "Arquivo Saída",
    #' executa as chamadas à API com o system_prompt na role system e o conteúdo da coluna "Prompt"
    #' na role user para cada registro do dataframe e salva o resultado
    #' no arquivo com o caminho especificado em "Arquivo Saída"
    #' @param dataframe dataframe com as colunas "Prompt" e "Arquivo Saída"
    #' @param system_prompt string com o prompt para a role system
    executa_chamadas <- function(dataframe, system_prompt){
        
        if (!all(c("Prompt", "Arquivo Saída") %in% colnames(dataframe))) {
            stop("Dataframe precisa ter campos 'Prompt' e 'Arquivo Saída'")
        }
        
        sequencia <- seq(1, nrow(dataframe))

        base_request <- request("https://api.deepseek.com") |> 
                    req_method("POST") |> 
                    req_auth_bearer_token(Sys.getenv("API_KEY_DEEPSEEK")) |>
                    req_headers("Content-Type"= "application/json") |>
                    req_url_path("chat/completions") |>
                    req_throttle(capacity = 15, fill_time_s = 60)

        requests <- map(sequencia,
                \(i) 
                base_request |>
                req_body_json(
                    list(
                        "model" = modelo,
                        "messages" = list(
                            list(
                                "role" = "system",
                                "content" = system_prompt),
                            list(
                                "role" = "user",
                                "content" = dataframe[i, "Prompt"] |> 
                                            purrr::pluck(1) |>
                                            stringr::str_trim())
                        ),
                        "stream" = FALSE,
                        "temperature" = 1.0,
                        "response_format" = list(
                            "type" = "json_object"
                        )
                    ), 
                    auto_unbox = TRUE
                )
            )

        responses <- req_perform_parallel(
                        requests, 
                        on_error = "continue", 
                        progress = TRUE)

        walk(sequencia, function(i) {
            resp <- responses[[i]]

            arquivo_saida <- dataframe[i, "Arquivo Saída"] |> pluck(1)
            
            dir.create(dirname(arquivo_saida), showWarnings = FALSE, recursive = TRUE)

            resposta_ok <- "httr2_response" %in% class(resp)  && 
                           resp$status_code == 200 && 
                           resp_has_body(resp)
            if (resposta_ok) {
                resp |>
                resp_body_json(auto_unbox = TRUE) |>
                jsonlite::toJSON(auto_unbox = TRUE, pretty = TRUE) |>
                readr::write_file(arquivo_saida)
            }
        })
        invisible("Feito")
    }

A partir da leitura do conteúdo da função `executa_chamadas``,` definida acima, observa-se que a lista de mensagens enviada em cada chamada à API possui duas entradas: uma para o papel (*role*) `system` e outra para o papel (*user*). Dessa forma, as etapas subsequentes utilizam as funções definidas acima, manipulando essas variáveis para implementar as etapas propostas no processo de classificação.

Para tabular os dados produzidos, deve-se ler os arquivos `.``json` gerados, associando-os às suas respectivas recomendações. Para tanto, utilizam-se as informações contidas na própria estrutura de diretórios e nos nomes dos arquivos `.``json``,` que permitem criar a chave necessária para realizar essa associação.

Ressalta-se terem sido utizados os pacotes *foreach* (MICROSOFT & WESTON, 2022) e *doParallel* (CORPORATION & WESTON, 2022) para executar a leitura desses arquivos em paralelo.

### Etapa Codificação

    prompt <- "cls_cod_2"

    cat("\nPrompt *role* `system`:\n\n")

Prompt *role* `system`:


    cat_system_prompt(prompt)
    O usuário é um pesquisador que está desenvolvendo uma pesquisa sobre o potencial do Departamento Nacional de Auditoria do Sistema Único de Saúde (DENASUS) de atuar como uma organização capaz de gerar transformações no âmbito do SUS, através da execução de auditorias que proponham recomendações potencialmente capazes de influenciar mudanças no sistema de saúde.

    Os resultados das auditorias realizadas pelo DENASUS são materializados em relatórios, os quais apontam constatações (também chamadas de achados de auditoria) que expõem condições observadas que não atendem aos critérios requeridos definidos pela equipe de auditoria. As recomendações são, por conseguinte, definidas como sugestões técnicas que visam corrigir discrepâncias entre o que foi observado e os critérios requeridos, que podem ser normativos, operacionais ou legais que embasam o trabalho de auditoria.

    Segundo a tipologia difundida pelo Institute of Internal Auditors (IIA) as recomendações que têm foco na causa (cause-based) são aquelas que propõem ações necessárias para evitar que a condição ou a observação volte a ocorrer. Normalmente envolvem soluções de longo prazo e podem demandar mais tempo para a sua implementação (exemplo: criação e implementação de uma política de revisão de acessos). Já recomendações que consistem em medidas cuja finalidade é corrigir a condição encontrada, fornecem uma solução temporária para corrigir a condição atual (exemplo: remoção de acessos indevidos) e são consideradas, portanto, como tendo foco na condição (condition-based).

    O objetivo do trabalho consiste em identificar as recomendações exaradas pelo DENASUS que possuam foco na causa.

    Para realizar essa identificação, o usuário pesquisador irá fornecer uma breve descrição da finalidade do trabalho de auditoria realizado, a constatação que expressa a condição encontrada que motivou a emissão da recomendação e a própria recomendação. Sua função consistirá em avaliar a recomendação em relação aos seguintes critérios:

    - Critério "Foco Causa": Há alguma ação proposta na recomendação que trate da causa do problema que gerou a condição encontrada? Responda somente "Sim" ou "Não. 
    - Critério "Efeitos Duradouros": Os efeitos pretendidos pela ação sugerida para tratar a causa da condição permanecem mesmo se os atores envolvidos eventualmente mudarem? A avaliação deste critério deve se dar somente quando o critério "Foco Causa" for "Sim". Se a resposta para "Foco Causa" for "Não", responda "Não se aplica".

    A análise para avaliar cada critério deverá constar no campo "Análise" da resposta, que será sucedido pelos campos referentes aos critérios delineados acima.

    Caso a recomendação não contenha uma recomendação de fato, responda "Não se aplica" para os dois critérios.

    Formate sua resposta no format Json com a seguinte estrutura:

    EXAMPLE JSON OUTPUT:

    {
       "Análise": "Em relação ao foco, a recomendação... Ja em relação aos efeitos pretendidos pela recomendação...",
       "Foco Causa": "Sim",
       "Efeitos Duradouros": "Sim"
    }

    template <- "Finalidade da auditoria: {Finalidade}\n\n
    Constatação:\n\n{`Constatação`}\n\n
    Recomendação:\n\n{`Recomendação`}"

    dataframe_adaptado <- recomendacoes |>
        adapta_dataframe(obtem_pasta(prompt) , template) 

    cat("\nExemplo prompt *role* `user`:\n\n")

Exemplo *prompt role* `user`:


    cat_exemplo_prompt(dataframe_adaptado)
    Finalidade da auditoria: Ver. a regular. na execução do Contrato de Gestão (SAMU e UBS), entre mun. Catanduva e a Pró-Saúde.


    Constatação:

    Secretaria Municipal de Saúde de Catanduva realizou pagamentos para a Pró Saúde Associação Beneficente de Assistência Social e Hospitalar para a prestação de serviços auxiliares de diagnose, em decorrência do Contrato de gestão S/N -Chamada Pública 01/2010, sem a comprovação da efetiva prestação dos serviços, em desacordo com a legislação.


    Recomendação:

    Confirmar a prestação dos serviços e liquidar a despesa mediante a verificação do direito adquirido pelo credor tendo por base os títulos e documentos comprobatórios do respectivo crédito de acordo com os itens I,II e III, do § 2º do art. 63 da Lei Federal 4.320 de 17/03/64 que diz que a liquidação da despesa por fornecimentos feitos ou serviços prestados terá como base: o contrato, ajustes ou acordo respectivos e os comprovantes de entrega de material ou prestação efetiva do serviço, a Lei Federal nº 8.666, de 21/06/93, art. 66 que diz que o contrato deverá ser executado fielmente pelas partes, de acordo com as cláusulas avençadas, artigo 112 que diz que quando o objeto do contrato interessar a mais de uma entidade pública caberá ao órgão contratante, perante a entidade interessada, responder pela sua boa execução, fiscalização e pagamento, combinado com o artigo 116 que diz que aplicam-se as disposições desta Lei, no que couber, aos convênios, acordos ajustes e outros instrumentos congêneres celebrados por órgão e entidades da administração, o Parágrafo único do artigo 70 da Constituição Federal, de 05 de outubro de 1988 que diz que prestará contas qualquer pessoa física ou jurídica, pública ou privada, que utilize, arrecade, guarde, gerencie ou administre dinheiros, bens e valores públicos ou pelos quais a União responda, ou que, em nome desta, assuma obrigações de natureza pecuniária.

    recomendacoes_pendentes <- dataframe_adaptado |>
        obtem_recomendacoes_pendentes(obtem_pasta(prompt)) 

    if (nrow(recomendacoes_pendentes) > 0 ){     
        executa_chamadas(recomendacoes_pendentes, obtem_prompt_system(prompt))
        consolida_resultados(prompt)
    }

### Etapa de Crítica da Categorização

    prompt_crit <- "cls_crit_2"

    cat("\nPrompt *role* `system`:\n\n")

*Prompt role* `system`:


    cat_system_prompt(prompt_crit)
    O usuário é um pesquisador que está desenvolvendo uma pesquisa sobre o potencial do Departamento Nacional de Auditoria do Sistema Único de Saúde (DENASUS) de atuar como uma organização capaz de gerar transformações no âmbito do SUS, através da execução de auditorias que proponham recomendações potencialmente capazes de influenciar mudanças no sistema de saúde. 

    Os resultados das auditorias realizadas pelo DENASUS são materializados em relatórios, os quais apontam constatações (também chamadas de achados de auditoria) que expõem condições observadas que não atendem aos critérios definidos pela equipe de auditoria. As recomendações são, por conseguinte, definidas como sugestões técnicas que visam corrigir discrepâncias entre o que foi observado e os critérios requeridos, que podem ser normativos, operacionais ou legais, aptos a embasar o trabalho de auditoria. 

    Segundo a tipologia difundida pelo Institute of Internal Auditors (IIA), as recomendações que têm foco na causa (cause-based) são aquelas que propõem ações necessárias para evitar que a condição ou a observação detectada volte a ocorrer. Normalmente envolvem soluções de longo prazo e podem demandar mais tempo para a sua implementação (exemplo: criação e implementação de uma política de revisão de acessos). Já as recomendações que traduzem medidas cuja finalidade consiste em corrigir a condição encontrada em sede de auditoria, fornecem uma solução temporária para ajustar a condição atual (exemplo: remoção de acessos indevidos) e são consideradas, portanto, como tendo foco na condição (condition-based). 

    O usuário pesquisador, com vistas a realizar a análise do conteúdo automatizada das recomendações de auditoria produzidas pelo DENASUS, forneceu a um modelo de LLM uma breve descrição da finalidade do trabalho de auditoria realizado, a constatação, a respectiva recomendação e solicitou, em seguida, ao modelo, que avaliasse a recomendação em relação aos seguintes critérios: 

    - Critério "Foco Causa": Há alguma ação proposta na recomendação que trate da causa do problema que gerou a condição encontrada? Responda somente "Sim" ou "Não.  
    - Critério "Efeitos Duradouros": Os efeitos pretendidos pela ação sugerida para tratar a causa da condição detectada permanecem mesmo se os atores envolvidos eventualmente mudarem ou forem substituídos? A avaliação deste critério deve se dar somente quando o critério "Foco Causa" for "Sim". Se a resposta para "Foco Causa" for "Não", responda "Não se aplica". 

    Agora, o usuário pesquisador pretende que seja feita uma análise crítica da classificação realizada. 

    Para tanto, ele irá fornecer, novamente, a finalidade do trabalho de auditoria realizado, a constatação, a respectiva recomendação e, adicionalmente, a análise realizada pelo modelo, juntamente com os resultados para os dois critérios acima definidos. 

    Sua função será realizar uma análise crítica da classificação para cada critério e emitir um juízo, que poderá ser materializado nos seguintes sentidos: "Concordo" ou "Discordo". 

    Formate sua resposta no formato Json com a seguinte estrutura:

    EXAMPLE JSON OUTPUT:

    {
       "Análise Crítica": "Em relação ao critério...",
       "Análise Foco Causa": "Concordo",
       "Análise Efeitos Duradouros": "Discordo"
    }

    df_codificacao <- read_rds(obtem_nome_arquivo_resultados(prompt))

    template_prompt_crit <- "Finalidade da auditoria: {Finalidade}\n
    Constatação: {`Constatação`}\n
    Recomendação: {`Recomendação`}\n
    Análise Codificação: {`Análise`}\n
    - Foco Causa: {`Foco Causa`}
    - Efeitos Duradouros: {`Efeitos Duradouros`}\n"

    recomendacoes_prompt_crit <- recomendacoes |>
        adapta_dataframe(obtem_pasta(prompt), "") |>
        select(`Arquivo`, `Arquivo Saída`, Finalidade, `# Constatação`, `Constatação`, `# Recomendação`, `Recomendação`) |>
        left_join(
            df_codificacao |>
            select(-finish_reason, -erro) |>
            mutate(`Efeitos Duradouros` = str_to_sentence(`Efeitos Duradouros`)),
            by = c("Arquivo Saída" = "arquivo")
        ) |>
        select(!c(`Arquivo Saída`)) |>
        adapta_dataframe(obtem_pasta(prompt_crit), template_prompt_crit)

    cat("\nExemplo prompt *role* `user`:\n\n")

Exemplo *prompt* *role* `user`:


    cat_exemplo_prompt(recomendacoes_prompt_crit)
    Finalidade da auditoria: Ver. a regular. na execução do Contrato de Gestão (SAMU e UBS), entre mun. Catanduva e a Pró-Saúde.

    Constatação: Secretaria Municipal de Saúde de Catanduva realizou pagamentos para a Pró Saúde Associação Beneficente de Assistência Social e Hospitalar para a prestação de serviços auxiliares de diagnose, em decorrência do Contrato de gestão S/N -Chamada Pública 01/2010, sem a comprovação da efetiva prestação dos serviços, em desacordo com a legislação.

    Recomendação: Confirmar a prestação dos serviços e liquidar a despesa mediante a verificação do direito adquirido pelo credor tendo por base os títulos e documentos comprobatórios do respectivo crédito de acordo com os itens I,II e III, do § 2º do art. 63 da Lei Federal 4.320 de 17/03/64 que diz que a liquidação da despesa por fornecimentos feitos ou serviços prestados terá como base: o contrato, ajustes ou acordo respectivos e os comprovantes de entrega de material ou prestação efetiva do serviço, a Lei Federal nº 8.666, de 21/06/93, art. 66 que diz que o contrato deverá ser executado fielmente pelas partes, de acordo com as cláusulas avençadas, artigo 112 que diz que quando o objeto do contrato interessar a mais de uma entidade pública caberá ao órgão contratante, perante a entidade interessada, responder pela sua boa execução, fiscalização e pagamento, combinado com o artigo 116 que diz que aplicam-se as disposições desta Lei, no que couber, aos convênios, acordos ajustes e outros instrumentos congêneres celebrados por órgão e entidades da administração, o Parágrafo único do artigo 70 da Constituição Federal, de 05 de outubro de 1988 que diz que prestará contas qualquer pessoa física ou jurídica, pública ou privada, que utilize, arrecade, guarde, gerencie ou administre dinheiros, bens e valores públicos ou pelos quais a União responda, ou que, em nome desta, assuma obrigações de natureza pecuniária.

    Análise Codificação: Em relação ao foco, a recomendação propõe a confirmação da prestação dos serviços e a liquidação da despesa mediante verificação de documentos comprobatórios, o que visa corrigir a condição específica de pagamentos sem comprovação, mas não aborda ações para prevenir a causa raiz do problema, como falhas nos processos de controle ou fiscalização. Já em relação aos efeitos duradouros, como o critério 'Foco Causa' não é atendido, esta análise não se aplica.

    - Foco Causa: Não
    - Efeitos Duradouros: Não se aplica

    recomendacoes_pendentes_prompt_crit <- recomendacoes_prompt_crit |>
        obtem_recomendacoes_pendentes(obtem_pasta(prompt_crit)) 

    if (nrow(recomendacoes_pendentes_prompt_crit) > 0 ){     
        executa_chamadas(recomendacoes_pendentes_prompt_crit, obtem_prompt_system(prompt_crit))
        consolida_resultados(prompt_crit)
    }

### Referências

CORPORATION, Microsoft; WESTON, Steve. **doParallel: Foreach Parallel Adaptor for the 'parallel' Package**. \[S. l.: s. n.\], 2022. R package version 1.0.17. DOI: 10.32614/CRAN.package.doParallel. Disponível em: [https://CRAN.R-project.org/package=doParallel](https://cran.r-project.org/package=doParallel). Acesso em: 5 out. 2025.

MICROSOFT; WESTON, Steve. **foreach: Provides Foreach Looping Construct**. \[S. l.: s. n.\], 2022. R package version 1.5.2. DOI: 10.32614/CRAN.package.foreach. Disponível em: [https://CRAN.R-project.org/package=foreach](https://cran.r-project.org/package=foreach). Acesso em: 5 out. 2025.

OOMS, Jeroen. **The jsonlite Package: A Practical and Consistent Mapping Between JSON Data and R Objects**. arXiv:1403.2805 \[stat.CO\], \[S. l.\], 2014. Disponível em: <https://arxiv.org/abs/1403.2805>. Acesso em: 2 out. 2025.

WICKHAM, Hadley. **httr2: Perform HTTP Requests and Process the Responses**. \[S. l.: s. n.\], 2025. R package version 1.2.1. DOI: 10.32614/CRAN.package.httr2. Disponível em: [https://CRAN.R-project.org/package=httr2](https://cran.r-project.org/package=httr2). Acesso em: 10 out. 2025.
