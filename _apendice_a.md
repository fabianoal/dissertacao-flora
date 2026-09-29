# Apêndice A --- Obtenção e Preparação de Dados

### Introdução

O presente documento registra os passos realizados para a obtenção dos dados referentes às auditorias realizadas pelo DENASUS, bem como sua estruturação com vistas a obter um conjunto de dados que permita a implementação de análises quantitativas.

Ressalta-se que o foco principal está nos metadados das auditorias e de suas respectivas constatações e recomendações.

### Obtenção dos Relatórios

Inicialmente, foi realizada a consulta dos relatórios publicados no site [Consulta Auditoria](https://consultaauditoria.saude.gov.br/visao/pages/principal.html), no período entre 01/01/2023 e 31/07/2025, selecionando-se o órgão MS/SGEP/Departamento Nacional de Auditoria do Sus e o tipo de atividade Auditoria. Os dados dessa consulta foram salvos em uma planilha cuja amostra dos dados pode ser conferida abaixo.

  ---------------------------------------------------------------------------------------------
  Nº              Entidade Responsável                                   Encerramento
  --------------- ------------------------------------------------------ ----------------------
  18714           SECRET. MUNICIPAL DE SAUDE DE CABO FRIO                2023-12-13

  18722           SECRETARIA MUNICIPAL SAUDE DE BOM JARDIM               2023-02-24

  18885           SECRETARIA MUNICIPAL DE SAUDE DE CATANDUVA - FMS ...   2023-10-06

  18892           Secretaria Municipal de Saúde de Monte Alegre          2023-11-16

  18947           SECRETARIA MUNICIPAL DE SAUDE DE CATANDUVA - FMS ...   2024-06-12

  19001           SECRETARIA MUNICIPAL DE SAUDE DE PALMAS                2023-05-17

  19038           SMSBES DE ITAGUAI                                      2023-04-13

  19060           SECRETARIA MUNICIPAL DE SAUDE DE MARILIA               2023-06-28

  19072           SECRETARIA MUNICIPAL DE SAÚDE                          2023-04-10

  19087           SECRETARIA MUNICIPAL DE SAUDE DE AMPARO                2023-12-20
  ---------------------------------------------------------------------------------------------

  : Amostra da planilha com dados de relatórios

Nos dados apresentados, os campos "Órgão" e "Atividade" foram ocultados por limitação de espaço. Observa-se que as auditorias são identificadas pelo número da atividade. Com base nessa informação, utilizou-se o script abaixo, em conjunto com a extensão UI.Vision, para automatizar o download dos relatórios. O trecho reproduzido abrevia três valores extensos do campo `Target`; o script integral está em `RPA/download_relatorios.json`.

```json
 {
  "Name": "download_relatorios",
  "CreationDate": "2025-9-17",
  "Commands": [
    {
      "Command": "store",
      "Target": "<alvo abreviado>",
      "Value": "lista_concatenada",
      "Description": ""
    },
    {
      "Command": "executeScript",
      "Target": "return ${lista_concatenada}.split('|')",
      "Value": "itens",
      "Description": ""
    },
    {
      "Command": "forEach",
      "Target": "itens",
      "Value": "item",
      "Description": ""
    },
    {
      "Command": "waitForElementPresent",
      "Target": "css=input[name=\"campoNumero\"]",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "type",
      "Target": "css=input[name=\"campoNumero\"]",
      "Value": "${item}",
      "Description": ""
    },
    {
      "Command": "click",
      "Target": "css=input[type=\"submit\"]",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "waitForElementPresent",
      "Target": "xpath=//td/span[contains(text(),\"${item}\")]",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "click",
      "Target": "xpath=//a[contains(text(), \"Relatório\")]",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "waitForPageToLoad",
      "Target": "",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "comment",
      "Target": "<alvo abreviado>",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "storeXpathCount",
      "Target": "xpath=//td/a[contains(@href, \"linkDownload\")]",
      "Value": "str_qtd_relatorios",
      "Description": ""
    },
    {
      "Command": "executeScript",
      "Target": "return parseInt(${str_qtd_relatorios})",
      "Value": "qtd_relatorios",
      "Description": ""
    },
    {
      "Command": "times",
      "Target": "${qtd_relatorios}",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "onDownload",
      "Target": "${item}_${!times}.pdf",
      "Value": "true",
      "Description": ""
    },
    {
      "Command": "click",
      "Target": "<alvo abreviado>",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "end",
      "Target": "",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "click",
      "Target": "xpath=//input[@name=\"voltar\"]",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "waitForPageToLoad",
      "Target": "",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "verifyElementNotPresent",
      "Target": "xpath=//span[contains(text(), \"Erro inesperado\")]",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "if",
      "Target": "${!statusOK} == false",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "click",
      "Target": "xpath=//a[contains(text(), \"Inicial\")]",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "waitForPageToLoad",
      "Target": "",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "end",
      "Target": "",
      "Value": "",
      "Description": ""
    },
    {
      "Command": "end",
      "Target": "",
      "Value": "",
      "Description": ""
    }
  ]
} 
```

O processo gerou 399 arquivos. Além disso, observou-se que algumas auditorias possuem mais de um relatório registrado.

### Extração de Texto

Com os arquivos baixados, usou-se o pacote *pdftools* (OOMS, 2025) para extrair os textos e consolidá-los em uma *dataframe* único, com um registro por linha extraída e as seguintes informações de controle:

- Nome do arquivo,
- Número da página,
- Número da linha na página,
- Número da linha geral,
- Linha original (linha de texto na forma como extraída do arquivo)
- Linha (linha de texto com espaços duplicados retirados e sem espaços no começo e no final)

<!-- -->

    converte_pdf_dataframe <- function(nome_do_arquivo) {
        print(str_glue("Convertendo arquivo {nome_do_arquivo}"))

        texto_pdf <- pdftools::pdf_text(nome_do_arquivo)

        total_paginas <- length(texto_pdf)

        tibble(
            `Arquivo` = basename(nome_do_arquivo),
            `# Página` = 1:total_paginas,
            pagina_original = texto_pdf
        ) |>
        separate_longer_delim(pagina_original, delim = "\n") |>
        mutate(`Linha Original` = pagina_original,
               `Linha` = pagina_original |>
                       str_replace_all(" {2,}", " ") |>
                       str_trim(), 
               .keep = "unused") |>
        mutate(`# Linha` = row_number(), .by = "# Página") |>
        mutate(`# Linha Geral` = row_number()) |>
        mutate(`Qtd Páginas` = total_paginas) |>
        mutate(`# Linha Fim Página` = max(`# Linha`), .by = `# Página`)
    }

    lista_arquivos |>
    map(converte_pdf_dataframe) |>
    bind_rows() |>
    write_rds("./Dados Gerados/textos_relatorios.rds")

  ------------------------------------------------------------------------------
    Pág. Linha                                               \# Ln   \# Ln Geral
  ------ ------------------------------------------------- ------- -------------
       3 SNA - Sistema Nacional de Auditoria do SUS              1            42

       3 MS/SGEP/Departamento Nacional de Auditoria d...         2            43

       3 Relatório                                               3            44

       3                                                         4            45

       3 I - DADOS BÁSICOS                                       5            46

       3                                                         6            47

       3                                                         7            48

       3 Finalidade: Verificar se a SMS possui contro...         8            49

       3 adequadamente a Cadeia de Frio.                         9            50

       3 Entidade Responsável: SMSPC                            10            51

       3 CPF/CNPJ: **.629.840/-**                               11            52

       3 Munícipio/UF: POÇOS DE CALDAS-MG                       12            53

       3 Fase(s):                                               13            54

       3 Tipo da Fase Data Início Data Término                  14            55

       3 Analítica 01/07/2024 12/07/2024                        15            56
  ------------------------------------------------------------------------------

  : Amostra da tabela com textos consolidados

Optou-se pelo arquivo 19764_1.pdf como exemplo inicial para formular hipóteses sobre a estrutura básica dos relatórios. A partir dessa escolha, o processo de extração de dados estruturados referentes às auditorias e constatações foi conduzido de forma interativa, envolvendo a formulação de hipóteses sobre a organização dos documentos, sua verificação empírica e a construção progressiva de etapas para a sistematização dos dados com base nas hipóteses confirmadas.

### Estrutura Básica, Cabeçalhos e Rodapés

A partir da análise da primeira página do documento de exemplo, listada abaixo, foi possível extrair alguns dados essenciais, a começar pelo número da auditoria, unidade e município.

    mostra_pagina <- \(arquivo, pagina)
        textos_relatorios |> 
        filter(`Arquivo` == arquivo) |>
        filter(`# Página` == pagina) |>
        select(`# Linha`, Linha) |>
        rename(`# Linha` = `# Linha`) |>
        mutate(Linha = str_trunc(Linha, 70, ellipsis = "…")) |>
        knitr::kable()

    mostra_pagina(arquivo_teste, 1)

  -------------------------------------------------------------------------
    \# Linha Linha
  ---------- --------------------------------------------------------------
           1 MS/SGEP/Departamento Nacional de Auditoria do SUS

           2 

           3 

           4 

           5 

           6 Auditoria nº 19764

           7 

           8 

           9 

          10 

          11 Relatório

          12 

          13 

          14 

          15 

          16 Unidade: SECRETARIA MUNICIPAL DE SAUDE DE POCOS DE CALDAS

          17 

          18 Munícipio: POÇOS DE CALDAS/MG

          19 
  -------------------------------------------------------------------------

  : Amostra página 1 relatório

Já na página 2, tem-se o sumário do relatório.

  ------------------------------------------------------------------------------
    \# Linha Linha
  ---------- -------------------------------------------------------------------
           1 SNA - Sistema Nacional de Auditoria do SUS

           2 MS/SGEP/Departamento Nacional de Auditoria do SUS

           3 Relatório

           4 

           5 Sumário

           6 

           7 I - DADOS BÁSICOS 3

           8 II - INTRODUÇÃO 3

           9 III - METODOLOGIA 6

          10 IV - CONSTATAÇÕES 8

          11 Tópico: PROGRAMA NACIONAL DE IMUNIZAÇÃO 8

          12 V - CONCLUSÃO 15

          13 VI - ANEXOS 17

          14 

          15 

          16 

          17 

          18 Gerado em: 27/11/2024 - 23:13:23 Página 2 de 25 Fonte: Sisaud/SUS

          19 

          20 Auditoria nº

          21 19764

          22 
  ------------------------------------------------------------------------------

  : Amostra página 2 relatório

Observou-se, a partir do sumário, a presença de um cabeçalho aparentemente padronizado e de um rodapé contendo a data de geração do arquivo, a numeração das páginas e o número da auditoria. Constatou-se, ainda, que o sumário estava delimitado por duas linhas em branco.

    detecta_sumario <- \(df)
      df |>
      mutate(
          `Sumário?` = lag(Linha) == "" & 
                      Linha == "Sumário" & 
                      lead(Linha) == "")

    textos_sumarios_detectados <- textos_relatorios |> 
        detecta_sumario() |>
        filter(`Sumário?`) |>
        summarise(
            Arquivos = n_distinct(Arquivo),
            .by = `# Página`
        )

  -----------------------------------------------------------------------
                           \# Página                             Arquivos
  ---------------------------------- ------------------------------------
                                   2                                  398

  -----------------------------------------------------------------------

  : Quantidade de arquivos com sumário detectado por página

Na tabela acima, observou-se que a página \"Sumário\" apareceu em 398 dos 399 arquivos analisados, sempre localizada na segunda página. Isso indica que, em um dos relatórios, o sumário não seguiu o padrão identificado.

O código apresentado a seguir foi utilizado para verificar qual arquivo destoava desse padrão.

    arquivo_sem_sumario <- textos_relatorios |> 
        detecta_sumario() |>
        mutate(`Página Sumário` = if_else(`Sumário?`, `# Página`, 0)) |>
        summarise(
            `Max Página Sumário` = max(`Página Sumário`),
            .by = `Arquivo`
        ) |>
        filter(`Max Página Sumário` == 0) |>
        chuck("Arquivo") |>
        pluck(1)

    mostra_pagina(arquivo_sem_sumario, 1)

  --------------------------------------------------------------------------------------
    \# Linha Linha
  ---------- ---------------------------------------------------------------------------
           1 SNA - Sistema Nacional de Auditoria do SUS

           2 MS/SGEP/Departamento Nacional de Auditoria do SUS

           3 Relatório

           4 

           5 I - DADOS BÁSICOS

           6 

           7 

           8 Finalidade: Verificar se a SMS possui controles internos capazes de a...

           9 Entidade Responsável: SECRETARIA MUNICIPAL DE SAÚDE DE LAURO DE FREIT...

          10 CPF/CNPJ: 13.927.819/0001-40

          11 Munícipio/UF: LAURO DE FREITAS-BA

          12 Fase(s):

          13 Tipo da Fase Data Início Data Término

          14 Analítica 29/07/2024 30/07/2024

          15 Execução - In loco 20/08/2024 21/08/2024

          16 Relatório 26/08/2024 02/09/2024

          17 

          18 

          19 Gestão do Prestador: Plena

          20 Demandante: Componente Federal do SNA

          21 Forma: Direta

          22 Objeto: .Fora de bloco\|Rede de Frio

          23 Abrangência: Janeiro/2022 a Junho/2024

          24 Nº Protocolo: 25000.109921/2024-43

          25 

          26 

          27 II - INTRODUÇÃO

          28 

          29 

          30 

          31 Esta atividade de auditoria visa atender à demanda do Plano Anual de ...

          32 Único de Saúde-- DenaSUS/MS, realizada na Secretaria Municipal de Saúd...

          33 meio de instrumento de trabalho padronizado que visa verificar o Proc...

          34 PNI no Município.

          35 

          36 O Programa Nacional de Imunizações - PNI tem como missão reduzir a mo...

          37 fortalecimento de ações integradas de vigilância em saúde para promoç...

          38 Programa vigente desde 1973, normatizado pela Lei nº 6.259, de 30/10/...

          39 das características marcantes do programa é sua abordagem inclusiva, ...

          40 

          41 A Rede de Frio é um sistema amplo, inclui estrutura técnico-administr...

          42 avaliação e financiamento que visa à manutenção adequada da Cadeia de...

          43 desempenha papel primordial para garantir que os imunobiológicos seja...

          44 é o processo logístico da Rede de Frio para conservação dos imunobiol...

          45 de recebimento, armazenamento, distribuição e transporte, de forma op...

          46 características originais. A estrutura de distribuição é apoiada na p...

          47 adequado e a distribuição tempestiva das vacinas e demais imunobiológ...

          48 

          49 O Município de Lauro de Freitas/BA alçou à categoria de município em ...

          50 região do Litoral Norte da Bahia, divisa com a capital do Estado, Sal...

          51 junto aos municípios de Camaçari, Entre Rios, Jandaíra, Conde e Mata ...

          52 densidade demográfica (número de habitantes pela área territorial) é ...

          53 km²) quase a mesma da Capital Salvador com 3.486,49 habitantes por Km...

          54 ocupando a 416ª colocação dentre os 417 municípios (Apêndice A).

          55 

          56 A Central Municipal de Rede de Frio (CMRF) integra fisicamente a Cent...

          57 do Secretário, o Conselho Municipal de Saúde, a Regulação, a Ouvidori...

          58 própria com gerador elétrico, e recebeu recursos para aquisição de eq...

          59 

          60 

          61 Gerado em: 20/12/2024 - 10:59:00 Página 1 de 30 Fonte: Sisaud/SUS

          62 

          63 Auditoria nº

          64 Atividade homologada e encerrada em: 20/12/2024 por Sidney Richardson...

          65 19783

          66 
  --------------------------------------------------------------------------------------

  : Página 1 arquivo sem sumário

A tabela acima demonstra que o arquivo 19783_1.pdf iniciava diretamente na seção "I --- DADOS BÁSICOS", a qual parece compor uma estrutura padronizada nos relatórios. No rodapé dessa página, identificou-se que ela correspondia à página 1. Observou-se ainda que essa seção apresentava informações como o município auditado e a entidade responsável, enquanto o número da auditoria constava apenas no rodapé.

Com isso, confirmou-se que apenas esse documento não continha a seção de sumário, que, nos demais casos, aparecia consistentemente na segunda página. Dessa forma, pôde-se inferir com segurança que o arquivo 19783_1.pdf era o único, entre os analisados, que não dispunha de uma capa.

    textos_relatorios |> 
    mutate(`Página Dados Básicos` = if_else(Linha == "I - DADOS BÁSICOS", `# Página`, 0)) |>
    summarise(
        `Max Página Dados Básicos` = max(`Página Dados Básicos`),
        .by = `Arquivo`
    ) |>
    summarise(
        Arquivos = n_distinct(Arquivo),
        .by = `Max Página Dados Básicos`
    ) |>
    knitr::kable()

  -----------------------------------------------------------------------
                            Max Página Dados Básicos             Arquivos
  -------------------------------------------------- --------------------
                                                   3                  398

                                                   1                    1
  -----------------------------------------------------------------------

  : Página ocorrência seção DADOS BÁSICOS

Conforme evidenciado na tabela acima, a seção "I --- DADOS BÁSICOS" foi identificada em todos os arquivos, sempre localizada na página 3 --- com exceção do documento sem sumário, no qual essa seção apareceu já na página 1.

Em relação ao sumário, cuja estrutura se mostrou consistente entre os arquivos, foi possível extrair a data de geração do arquivo, que é útil para fins de reprodutibilidade (partindo-se da hipótese de que esses arquivos podem ser corrigidos e regerados em uma data posterior), bem como o número da auditoria, necessário para validar que o nome do arquivo está consistente com seu conteúdo, além da paginação lógica, que pode servir para validar a inexistência de páginas faltantes nos arquivos.

    regex_dados_rodape <- stringr::regex("^Gerado em\\: ([0-9/]{10}) \\- ([0-9\\:]{8}) P.gina (\\d{1,}) de (\\d{1,}).*")

    detecta_rodape <- \(df)
        df |>
        mutate(
          `Rodapé?` = str_detect(Linha, regex_dados_rodape),
          `Linha Início Rodapé` = if_else(`Rodapé?`, `# Linha`, 0)) |>
        mutate(
          `Rodapé?` = cummax(`Rodapé?`), 
          `Rodapé?` = `Rodapé?` == 1,
          .by = c(Arquivo, `# Página`))

    dados_rodape <- textos_relatorios |> 
        detecta_rodape() |>
        filter(`Linha Início Rodapé` > 0) |>
        select(Arquivo, Linha) |>
        separate_wider_regex(Linha, patterns = c(
            ".*?",
            Data = "[0-9/]{10}", 
            " - ", 
            Hora = "[0-9\\:]{8}",
            " P.gina ",
            `# Página Lógica` = "\\d{1,}",
            " de ",
            `Total Páginas Lógicas` = "\\d{1,}",
            ".*")) |>
        mutate(
          Data = dmy(Data),
          Hora = hms(Hora),
          `# Página Lógica` = as.integer(`# Página Lógica`),
          `Qtd Páginas Lógicas` = as.integer(`Total Páginas Lógicas`)
        )

    arquivos_paginas_inconsistentes <- textos_relatorios |>
        select(Arquivo, `# Página`, `Qtd Páginas`) |>
        filter(`# Página` > 1 | Arquivo == arquivo_sem_sumario) |>
        distinct() |>
        left_join(
            dados_rodape,
            by = c(
                "Arquivo",
                "# Página" = "# Página Lógica"
            )
        ) |>
        filter(is.na(`Qtd Páginas Lógicas`))

    arquivos_inconsistentes <- textos_relatorios |>
        select(Arquivo, `Qtd Páginas`) |>
        distinct() |>
        left_join(
            dados_rodape |>
            select(Arquivo, `Qtd Páginas Lógicas`) |>
            distinct(),
            by = c("Arquivo")
        ) |>
        filter(`Qtd Páginas` != `Qtd Páginas Lógicas`)


    paginas_sem_rodape <- textos_relatorios |>
        detecta_rodape() |>
        summarise(
            `Max Linha Rodapé` = max(`Linha Início Rodapé`),
            .by = c(Arquivo, `# Página`)
        ) |>
        filter(
          `Max Linha Rodapé` == 0 &
          (`# Página` > 1 | Arquivo == arquivo_sem_sumario))

No código apresentado, o dataframe paginas_sem_rodape retornou zero linhas, o que indica que todas as páginas analisadas possuem rodapé e seguem um padrão consistente de formatação.

O dataframe arquivos_paginas_inconsistentes, por sua vez, foi utilizado para identificar possíveis divergências entre a numeração física das páginas dos arquivos PDF e a numeração lógica extraída dos rodapés. Assim como no caso anterior, não foram encontradas inconsistências, uma vez que esse dataframe também não apresentou registros.

Já o dataframe arquivos_inconsistentes concentrou os casos em que a quantidade total de páginas indicada no rodapé difere da contagem real de páginas do arquivo. Os dados a seguir apresentam essas ocorrências específicas:

  -----------------------------------------------------------------------
  Arquivo                      Qtd Páginas            Qtd Páginas Lógicas
  -------------------- ------------------- ------------------------------
  19610_1.pdf                          181                            182

  19614_1.pdf                           89                             90

  19683_1.pdf                           74                             75

  19882_1.pdf                           64                             65
  -----------------------------------------------------------------------

  : Arquivos inconsistentes

Abaixo, tem-se a última página do arquivo 19610_1.pdf.

  ---------------------------------------------------------------------------------
    \# Linha Linha
  ---------- ----------------------------------------------------------------------
           1 SNA - Sistema Nacional de Auditoria do SUS

           2 MS/SGEP/Departamento Nacional de Auditoria do SUS

           3 Relatório

           4 

           5 ANEXO XIX - TABELAS-OFÍCIO Nº 03/2024-IOM

           6 

           7 

           8 

           9 

          10 Gerado em: 28/11/2024 - 15:47:32 Página 181 de 182 Fonte: Sisaud/SUS

          11 

          12 Auditoria nº

          13 19610

          14 
  ---------------------------------------------------------------------------------

Ao abrir o arquivo pdf diretamente, conclui-se que a extração está correta e que o arquivo não contém a última página.

Agora, o arquivo 19614_1.pdf.

  -------------------------------------------------------------------------------
    \# Linha Linha
  ---------- --------------------------------------------------------------------
           1 SNA - Sistema Nacional de Auditoria do SUS

           2 MS/SGEP/Departamento Nacional de Auditoria do SUS

           3 Relatório

           4 

           5 ANEXO IX - PROPOSTAS DE EMPRESAS PARA A COTAÇÃO DE PREÇOS 06/2022

           6 

           7 

           8 

           9 

          10 Gerado em: 29/11/2024 - 08:49:12 Página 89 de 90 Fonte: Sisaud/SUS

          11 

          12 Auditoria nº

          13 19614

          14 
  -------------------------------------------------------------------------------

Observou-se a mesma situação identificada no arquivo anterior, o que reforça a conclusão de que o problema decorre de inconsistências nos próprios arquivos.

Diante disso, foi possível realizar a primeira transformação nos dados: a extração do número da auditoria a partir da capa dos documentos. Para o caso específico do único arquivo sem capa, utilizou-se o próprio nome do arquivo, cuja correspondência com o número registrado no rodapé já havia sido previamente confirmada.

Considerando que os demais dados presentes na capa também estão reproduzidos na seção \"I --- DADOS BÁSICOS\", optou-se por descartar as duas primeiras páginas (capa e sumário) de todos os arquivos --- com exceção do arquivo que já não apresenta sumário.

Além disso, agregou-se ao dataframe a `Data de Geração`, extraída de forma padronizada dos rodapés dos arquivos.

    rel_com_num_auditoria <- textos_relatorios |>
        mutate(
            `No. Auditoria` = if_else(
                  `# Página` == 1, 
                  str_extract(`Linha`, "^Auditoria n. (\\d{3,10}).*$", 1), 
                  NA) , 
            `No. Auditoria (Nome)` =  str_extract(`Arquivo`, "(\\d{1,})_", 1)) |>
        group_by(Arquivo) |>
        fill(`No. Auditoria`, .direction = "downup") |>
        ungroup()


    rel_num_inconsistente_nome <- rel_com_num_auditoria |>
        filter(`No. Auditoria` != `No. Auditoria (Nome)`) |>
        select(Arquivo, `No. Auditoria`, `No. Auditoria (Nome)`) |>
        distinct()

    rel_sem_sumario_rodape <- rel_com_num_auditoria |>
        detecta_rodape() |>
        filter(`# Página` > 2 | Arquivo == arquivo_sem_sumario) |>
        filter(!`Rodapé?`) |>
        select(-`Linha Início Rodapé`, -`Rodapé?`) |>
        left_join(
            dados_rodape |>
            select(Arquivo, Data) |>
            rename(`Data Geração` = Data) |>
            distinct(),
            by = "Arquivo"
        ) |>
        mutate(
            `No. Auditoria` = coalesce(`No. Auditoria`, `No. Auditoria (Nome)`) |>
                              as.integer(),
            .keep = "unused"
        )

No passo anterior, o dataframe rel_num_inconsistente_nome registrou os casos em que o número da auditoria extraído da capa diferia daquele identificado a partir do nome do arquivo. Contudo, esse dataframe resultou vazio, indicando que não foram encontradas inconsistências entre essas duas fontes de informação.

### Validação Completude Arquivos

De posse dos números das auditorias extraídos dos documentos, foi possível prosseguir com a validação da completude dos arquivos, comparando-os com a planilha de referência utilizada originalmente para o download dos relatórios.

    qtd_relatorios_faltantes <- lista_relatorios |>
      anti_join(
        rel_sem_sumario_rodape,
        by = c("Nº" = "No. Auditoria")) |>
      nrow()

    qtd_relatorios_sobrando <- rel_sem_sumario_rodape |>
      anti_join(
        lista_relatorios,
        by = c("No. Auditoria" = "Nº")) |>
        nrow()

Verificou-se 0 relatórios faltando e 0 relatórios sobrando, confirmando-se, assim, a completude dos dados.

### Limpeza

A seguir, a título de exemplo, tem-se o texto extraído da 4ª página do arquivo 19764_1.pdf.

  --------------------------------------------------------------------------------------
    \# Linha Linha
  ---------- ---------------------------------------------------------------------------
           1 SNA - Sistema Nacional de Auditoria do SUS

           2 MS/SGEP/Departamento Nacional de Auditoria do SUS

           3 Relatório

           4 

           5 A estrutura e o funcionamento do Conselho garantem autonomia administ...

           6 dotação orçamentária, autonomia financeira e organização da secretari...

           7 

           8 3.3 Não Escopo

           9 

          10 Nesta auditoria foi estipulado que não seria escopo deste trabalho os...

          11 

          12 Avaliação de outros programas de saúde não relacionados à Rede de Fri...

          13 Auditoria de unidades de saúde não vinculadas diretamente à CMRF.

          14 Avaliação de políticas e regulamentações não relacionadas à gestão de...

          15 

          16 3.4. Visão Geral do Objeto

          17 

          18 Com o intuito de seguir um padrão de controle na Cadeia de Frio, foi ...

          19 Nacional de Imunização. Esse instrumento elenca as medidas necessária...

          20 de Frio, mesmo em regiões remotas.

          21 O Manual de Rede de Frio do PNI, elaborado pela Secretaria de Vigilân...

          22 práticas ao longo da cadeia de frio por meio de diversas diretrizes e...

          23 • Armazenamento Adequado: Estabelece as condições ideais de armazenam...

          24 diferentes tipos de imunobiológicos.

          25 • Transporte Seguro: Define as práticas seguras para o transporte de ...

          26 percurso.

          27 • Monitoramento Contínuo: Recomenda a utilização de sistemas de monit...

          28 garantir o controle constante ao longo da cadeia.

          29 • Manutenção Preventiva: Orienta sobre a importância da manutenção pr...

          30 de câmaras refrigeradas, freezers e outros dispositivos.

          31 • Treinamento de Profissionais: Inclui diretrizes de treinamento para...

          32 compreendam e sigam as práticas recomendadas.

          33 • Procedimentos em Caso de Emergência: Define procedimentos a serem s...

          34 uma resposta rápida para evitar perdas.

          35 Registra-se que, de acordo com informações fornecidas pela área técni...

          36 Frio do PNI está em processo de atualização, com previsão de conclusã...

          37 publicada no ano de 2017.

          38 

          39 3.5 A Rede de Frio do Programa Nacional de Imunizações - PNI

          40 

          41 O Programa Nacional de Imunizações tem o objetivo de promover a garan...

          42 população, para isso conta com uma Rede Nacional constituída por uma ...

          43 Cadeia de Frio, conforme definições a seguir:

          44 a\) Rede de Frio: É um sistema amplo, inclui estrutura técnico-adminis...

          45 avaliação e financiamento que visa à manutenção adequada da Cadeia de...

          46 Estados, Distrito Federal e Municípios, e tem como propósito principa...

          47 especialmente imunobiológicos, ao longo de sua cadeia de distribuição.

          48 b\) Cadeia de Frio: É o processo logístico da Rede de Frio para conser...

          49 incluindo as etapas de recebimento, armazenamento, distribuição e tra...

          50 suas características originais.

          51 

          52 3.6 O Processo Logístico na Rede de Frio

          53 

          54 O controle da temperatura dos imunobiológicos é fator fundamental, da...

          55 ideais dos insumos, da mesma forma os equipamentos utilizados, o acon...

          56 Os imunobiológicos transportados devem ser separados por tipo, de aco...

          57 monitoramento de temperatura ao longo do percurso. Independente da vi...

          58 

          59 
  --------------------------------------------------------------------------------------

  : 4ª Página do Arquivo de Referência

Conforme observado, foi possível identificar, até a linha 3, a presença de um texto que se assemelha a um cabeçalho.

A seguir, procedeu-se à análise das três primeiras linhas de todas as páginas de todos os relatórios, com o objetivo de verificar se esse cabeçalho apresenta um padrão recorrente entre os documentos.

    rel_sem_sumario_rodape |>
    filter(`# Linha` <= 3) |>
    summarise(
      Contagem = n(),
      .by = Linha
    ) |>
    knitr::kable()

  -----------------------------------------------------------------------
  Linha                                                          Contagem
  ---------------------------------------------------------- ------------
  SNA - Sistema Nacional de Auditoria do SUS                        18191

  MS/SGEP/Departamento Nacional de Auditoria do SUS                 18191

  Relatório                                                         18046

  Relatório Complementar                                              145
  -----------------------------------------------------------------------

  : Contagem de Ocorrências de Linhas de Cabeçalho

Conforme demonstrado anteriormente, constatou-se que as três primeiras linhas de todas as páginas correspondem, de fato, a um cabeçalho padronizado. Com base nessa evidência, concluiu-se a etapa de limpeza dos dados, a qual consistiu na remoção dos cabeçalhos, de linhas órfãs e de linhas desprovidas de qualquer caractere alfanumérico. Adicionalmente, foram excluídas as colunas `Qtd`` Páginas` e `# Linha Fim Página`, por não serem mais necessárias para as etapas subsequentes da análise.

    rel_texto_limpo <- rel_sem_sumario_rodape |>
    filter(
        `# Linha` > 3 &
        str_detect(Linha, "[[:alnum:]]")
    ) |>
    select(-`Qtd Páginas`, -`# Linha Fim Página`) 

### Seções

Como este trabalho tem especial interesse nos metadados das auditorias, bem como nas constatações e recomendações nelas registradas, tornou-se necessário investigar a estrutura das seções que compõem os relatórios. Conforme já observado, essas seções seguem, em geral, um padrão de identificação baseado em algarismos romanos seguidos de um traço (`-`) separando a numeração do título.

Parte-se da hipótese de que, embora a numeração das seções possa variar entre os documentos, os títulos dessas seções são razoavelmente padronizados. Com base nessa premissa, filtraram-se as linhas que aderem ao padrão esperado, separando-se a numeração do título, e contabilizou-se a frequência de ocorrência de cada título ao longo do conjunto de documentos. Caso os títulos se repitam em quantidades compatíveis com o número de relatórios analisados, considera-se válida a hipótese de padronização. Assim, torna-se possível utilizar essas marcações como referência confiável para a identificação das seções nos relatórios de auditoria.

    letras <- "[a-záàâãçéêíóôõú]"
    letras_ <- str_replace(letras, fixed("]"), " ]")
    LETRAS_ <- str_to_upper(letras_)

    regex_secoes <- regex(str_glue("^[IVX]{{1,4}} \\- {LETRAS_}{{5,50}}")) 

    secoes_possiveis <- rel_texto_limpo |>
        filter(str_detect(`Linha`, regex_secoes)) |>
        separate_wider_delim(
            `Linha`, 
            delim = "-",
            names = c("Numeração", "Seção"),
            too_many = "merge",
            too_few = "error",
            cols_remove = FALSE) |>
        mutate(across(c("Numeração", "Seção"), str_trim)) 
        
    secoes_candidatas <- secoes_possiveis |>
        summarise(
            `Ocorrências` = n(),
            `Numerações Possíveis` = str_flatten(
                    unique(`Numeração`), 
                    collapse=", "),
            .by = `Seção`
        ) |>
        arrange(desc(`Ocorrências`)) |>
        head(15)

    secoes_candidatas |>
    knitr::kable()

  -----------------------------------------------------------------------------------
  Seção                                        Ocorrências Numerações Possíveis
  ------------------------------------------ ------------- --------------------------
  DADOS BÁSICOS                                        399 I

  INTRODUÇÃO                                           349 II

  CONSTATAÇÕES                                         347 IV, III, II

  CONCLUSÃO                                            347 V, VI, IV

  METODOLOGIA                                          343 III

  ANEXOS                                               299 VII, II, VI, VIII, V, IV

  PROPOSIÇÃO DA DEVOLUÇÃO                              149 VI, VII, V

  DA CONCLUSÃO                                           9 II

  RESULTADO DA DENÚNCIA                                  1 V

  LIMITAÇÕES                                             1 III

  AÇÕES ANALÍTICAS                                       1 I

  AÇÕES OPERATIVAS                                       1 II

  ESCOPO E NÃO ESCOPO                                    1 XIV

  CRONOGRAMA DE TRABALHO DA FASE OPERATIVA               1 III

  CONSIDERAÇÕES DA FASE OPERACIONAL                      1 IV
  -----------------------------------------------------------------------------------

  : Amostra de seções com diferentes numerações

Conforme observado acima, a hipótese foi confirmada: detectou-se um padrão consistente de ocorrência dos títulos de seções nos relatórios, o que reforça a ideia de padronização estrutural. Verificou-se, inclusive, que o título "PROPOSIÇÃO DA DEVOLUÇÃO" apresenta um número expressivo de repetições, o que indica sua recorrência. Por outro lado, o título "DA CONCLUSÃO" foi identificado em apenas nove documentos, sugerindo tratar-se de uma seção não padronizada.

Com base nessa análise, consolidou-se a seguinte lista de seções possíveis:

    secoes <- secoes_possiveis |>
        semi_join(
            secoes_candidatas |>
            filter(`Ocorrências` > 140),
            by = "Seção"
        ) |>
        select(`Linha`, `Seção`) |>
        distinct() 

    unique(secoes$`Seção`) |>
    walk(\(secao) cat("- ", secao, "\n"))

- DADOS BÁSICOS
- INTRODUÇÃO
- METODOLOGIA
- CONSTATAÇÕES
- CONCLUSÃO
- PROPOSIÇÃO DA DEVOLUÇÃO
- ANEXOS

A lista de seções identificadas foi utilizada para marcar todas as linhas correspondentes nos documentos. Como a correta delimitação das seções é fundamental para a organização e extração dos dados, numeraram-se as ocorrências de cada seção por arquivo, garantindo que eventuais repetições não comprometessem a estruturação das informações. Após essa etapa de junção, as linhas que representam os títulos das seções puderam ser descartadas, uma vez que sua função de demarcação estrutural já havia sido cumprida.

    rel_com_secoes <- rel_texto_limpo |>
        left_join(secoes, by = "Linha") |>
        mutate(
          `# Seção` = if_else(!is.na(`Seção`), 1, 0),
          `Início Seção?` = !is.na(`Seção`)
        ) |>
        group_by(Arquivo) |>
        mutate(
          `# Seção` = cumsum(`# Seção`),
        ) |>
        fill(Seção, .direction = "down") |>
        ungroup() |>
        filter(!`Início Seção?`) |>
        select(-`Início Seção?`)

    qtd_linhas_sem_secao <- rel_com_secoes |> 
        filter(is.na(`Seção`)) |>
        nrow()

O código acima gerou um novo *dataframe,* no qual todas as linhas foram associadas corretamente a uma seção identificada, conforme os padrões previamente definidos. Como resultado, confirmou-se que não houve nenhuma linha restante sem associação a uma seção.

### Tabulação de Dados

#### Rótulos de Campos

Abaixo, apresenta-se o texto extraído da seção "DADOS BÁSICOS" do arquivo 19796_1.pdf, que serviu de referência para orientar o processo de identificação dos dados dessa seção.

  -------------------------------------------------------------------------------------
    \# Linha Linha
  ---------- --------------------------------------------------------------------------
           8 Finalidade: Verificar regulação do acesso/ref/contra referência p/ ex...

           9 cirurg.revascularização

          10 Entidade Responsável: SMSJP

          11 CPF/CNPJ: **.806.754/-**

          12 Munícipio/UF: JOÃO PESSOA-PB

          13 Fase(s):

          14 Tipo da Fase Data Início Data Término

          15 Analítica 09/07/2024 26/07/2024

          16 Execução - In loco 23/09/2024 27/09/2024

          17 Relatório 07/10/2024 25/10/2024

          20 Gestão do Prestador: Plena

          21 Demandante: Ministério Público Federal

          22 Forma: Direta

          23 Objeto: REGULAÇÃO DO ACESSO ÀS CONSULTAS E EXAMES

          24 Abrangência: Janeiro 2019 a Agosto 2024

          25 Nº Protocolo: 25000.132815/2024-63
  -------------------------------------------------------------------------------------

  : Página Contendo Seção 'Dados Básicos'

A seguir, uma amostra da seção "CONSTATAÇÕES" do mesmo arquivo, exibindo as linhas em sua forma original, sem a remoção dos espaços em branco no início e no final.

  --------------------------------------------------------------------------------------
    \# Linha Linha
  ---------- ---------------------------------------------------------------------------
          38 Grupo: Regulação Constatação Nº: 693598

          39 Subgrupo: Controle e Avaliação

          40 Item: Rotinas de Trabalho

          41 Constatação: A Secretaria Municipal de Saúde de João Pessoa/PB não ut...

          42 para regulação dos pacientes portadores de Diabetes Mellitus e Doença...

          43 primária, para outros pontos de atenção.

          44 Evidência: Em visita a Unidade Básica de Saúde (UBS) Cruz das Armas I...

          45 endereço sem a devida atualização cadastral, em desacordo com o Art. ...

          46 28/09/2017, a saber: O cadastramento e a manutenção dos dados cadastr...

          47 estabelecimento de saúde, através de seus responsáveis técnicos ou re...

          50 Durante a visita, a profissional médica, Dra. I. L. T., informou que ...

          51 pacientes portadores de Diabetes Mellitus e Doença vascular periféric...

          52 digital) dos instrumentos de regulação, em desacordo com o §3º do Art...

          53 28/09/2017 (Cabe aos Municípios: II- Viabilizar o processo de regulaç...

          54 capacitação, ordenação de fluxo, aplicação de protocolos e informatiz...

          57 Na análise do prontuário do paciente G.R.S. (CNS 704207747143988), am...

          58 17/10/2022, verificou-se:

          61 a\) falta de anamnese do paciente no período anterior e imediatamente ...

           5 Resolução nº 2056, de 20/09/2013 (Art. 50 - A realização da anamnese ...

           6 inclusive em atendimento ambulatorial e nos consultórios);
  --------------------------------------------------------------------------------------

  : Página Contendo Seção 'CONSTATAÇÕES'

Os relatórios de auditoria pareceram ter sido gerados por meio de um sistema automatizado, o que conferiu um padrão recorrente à organização dos dados. Com base nisso, foi possível executar alguns procedimentos exploratórios para verificar a viabilidade de extração de dados estruturados a partir da identificação de determinados padrões textuais.

Conforme já visto acima, alguns campos dos relatórios seguem o padrão `<Rótulo>: <Conteúdo>`. Dessa forma, formulou-se a seguinte hipótese: Dividindo-se as linhas que possuem o caractere dois-pontos (`:`) em duas partes, a primeira parte conterá os rótulos candidatos. Mesmo que tal procedimento gere falsos positivos, se esse padrão estiver correto, os rótulos padronizados irão aparecer em quantidades aproximadamente iguais ou superiores à quantidade de documentos.

Como o corpus objeto do trabalho encontra-se delimitado por seções, e considerando que o interesse principal do trabalho recai sobre os metadados das auditorias, localizados na seção "DADOS BÁSICOS", bem como nas constatações e recomendações, presentes na seção "CONSTATAÇÕES", a verificação da hipótese foi restringida a essas duas seções.

A seguir, apresentam-se os rótulos candidatos com maior número de ocorrências em suas respectivas seções, considerando apenas aqueles que foram identificados em mais de 150 registros.


    secoes_interesse <- c("DADOS BÁSICOS", "CONSTATAÇÕES")

    rotulos_candidatos <- rel_com_secoes |>
        filter(`Seção` %in% secoes_interesse) |>
        filter(
            str_detect(`Linha`, fixed(":")) & 
            str_starts(`Linha Original`, "[A-Z]")) |>
        separate_wider_delim(
            `Linha`, 
            delim = ":",
            names = c("Rótulo", "Conteúdo"), 
            too_few = "align_end", 
            too_many = "merge") |>
        filter(!is.na(`Rótulo`)) |>
        mutate(across(c("Rótulo", "Conteúdo"), str_trim)) |>
        summarise(
            `Ocorrências` = n(),
            .by = c(`Seção`, `Rótulo`)
        )

    rotulos_candidatos_rankeados <- rotulos_candidatos |>
        group_by(`Seção`) |>
        arrange(desc(`Ocorrências`)) |>
        mutate(`Posição` = row_number()) |>
        filter(`Ocorrências` >= 150)

    rotulos_candidatos_rankeados |>
    knitr::kable()

  ------------------------------------------------------------------------
  Seção              Rótulo                          Ocorrências   Posição
  ------------------ ----------------------------- ------------- ---------
  CONSTATAÇÕES       Grupo                                  4978         1

  CONSTATAÇÕES       Subgrupo                               4978         2

  CONSTATAÇÕES       Item                                   4978         3

  CONSTATAÇÕES       Constatação                            4978         4

  CONSTATAÇÕES       Evidência                              4978         5

  CONSTATAÇÕES       Fonte da Evidência                     4978         6

  CONSTATAÇÕES       Conformidade                           4978         7

  CONSTATAÇÕES       Recomendação                           4289         8

  CONSTATAÇÕES       Acatamento da Justificativa            3512         9

  CONSTATAÇÕES       Justificativa                          3235        10

  CONSTATAÇÕES       Análise da Justificativa               3138        11

  CONSTATAÇÕES       Tópico                                  717        12

  DADOS BÁSICOS      Finalidade                              399         1

  DADOS BÁSICOS      Entidade Responsável                    399         2

  DADOS BÁSICOS      CPF/CNPJ                                399         3

  DADOS BÁSICOS      Munícipio/UF                            399         4

  DADOS BÁSICOS      Fase(s)                                 399         5

  DADOS BÁSICOS      Demandante                              399         6

  DADOS BÁSICOS      Forma                                   399         7

  DADOS BÁSICOS      Objeto                                  399         8

  DADOS BÁSICOS      Abrangência                             399         9

  DADOS BÁSICOS      Nº Protocolo                            380        10
  ------------------------------------------------------------------------

  : Amostra de rótulos com maior número de ocorrências

A tabela acima possui um conjunto de rótulos que é suficiente para a continuação do presente trabalho.

#### Marcadores

Outra situação observada foi a existência de rótulos que não seguem o padrão explorado na etapa anterior. Um exemplo disso pôde ser identificado na linha 7 da amostra da seção anterior, onde se encontrava o texto `Tipo da Fase Data Início Data Término`.

Trata-se de um rótulo que indica a presença de cabeçalhos associados a informações organizadas em formato tabular dentro do corpo do relatório.

Diante disso, formulou-se a hipótese de que esse tipo de cabeçalho, caso seja padronizado, também apareceria em múltiplos documentos. Para testá-la, aplicou-se uma técnica semelhante à utilizada na seção anterior, conforme descrito anteriormente.

    marcadores_candidatos <- rel_com_secoes |>
        filter(`Seção` %in% secoes_interesse) |>
        filter(!str_detect(`Linha`, fixed(":"))) |>
        summarise(
            `Ocorrências` = n(),
            .by = c(`Seção`, `Linha`)
        ) |>
        filter(`Ocorrências` > 150)


    marcadores <- marcadores_candidatos |>
        filter(!str_starts(Linha, "S[E/]")) |>
        mutate(Marcador = Linha) |>
        select(-`Ocorrências`)
            
    marcadores_candidatos |>
    knitr::kable()

  ------------------------------------------------------------------------
  Seção              Linha                                     Ocorrências
  ------------------ --------------------------------------- -------------
  DADOS BÁSICOS      Tipo da Fase Data Início Data Término             399

  CONSTATAÇÕES       Destinatários da Recomendação                    4095

  CONSTATAÇÕES       Nome CPF/CNPJ                                    4839

  CONSTATAÇÕES       Responsável(eis)                                  748

  CONSTATAÇÕES       SEST **.053.117/-**                               181

  CONSTATAÇÕES       S/ M- SESI **.394.544/-**                         888
  ------------------------------------------------------------------------

Da lista acima, dois rótulos são claramente falso-positivos. Assim, elege-se os 4 primeiros rótulos da tabela acima como rótulos padronizados.

### Estruturação dos Dados

De posse dos rótulos identificados, procedeu-se à sua associação com as linhas dos textos dos relatórios, de forma que, quando havia correspondência, a linha era classificada como um rótulo ou marcador.

Considerando que, na etapa anterior, o termo "Marcador" já havia sido utilizado para se referir a esses elementos, optou-se por consolidar essa informação em uma única coluna denominada `Rótulo`. Além disso, foi criado um campo adicional destinado a numerar a ocorrência de cada rótulo em cada seção de cada documento

Como estratégia de validação, adotou-se um critério para confirmar se a linha identificada corresponde, de fato, a um rótulo. Para isso, verificou-se se a linha original iniciava com uma letra maiúscula. Quando essa condição não era satisfeita, considerava-se que o conteúdo era, possivelmente, um falso positivo, ou seja, um trecho encontrado no corpo de um texto descritivo (como uma constatação ou justificativa), sem a função estruturante de um marcador informacional.

    rel_com_secoes |>
    filter(`Seção` %in% secoes_interesse) |>
    separate_wider_delim(
        `Linha`, 
        delim = ":",
        names = c("Rótulo Candidato", "Conteúdo"), 
        too_few = "align_end", 
        too_many = "merge",
        cols_remove = FALSE) |>
    mutate(across(c("Rótulo Candidato", "Conteúdo"), str_trim)) |>
    mutate(
        `Rótulo Candidato` = if_else(
                str_starts(`Linha Original`, "[A-Z]"), 
                `Rótulo Candidato`, 
                NA),
        `Conteúdo` = if_else(
            is.na(`Rótulo Candidato`), 
            `Linha`, 
            `Conteúdo`),
    ) |>
    left_join(
        marcadores,
        by = c("Seção", "Linha")
    ) |>
    left_join(
        rotulos |> mutate(`Rótulo Candidato` = `Rótulo`),
        by = c("Seção", "Rótulo Candidato") 
    ) |>
    select(-`Rótulo Candidato`) |>
    mutate(`Rótulo` = coalesce(`Rótulo`, `Marcador`)) |>
    mutate(`# Rótulo` = if_else(is.na(`Rótulo`), 0, 1)) |>
    group_by(Arquivo, `Seção`, `# Seção`) |>
    mutate(
      `# Rótulo` = cumsum(`# Rótulo`),
    ) |>
    fill(`Rótulo`, .direction = "down") |>
    ungroup() |>
    select(-`Linha Original`) |>
    write_rds("./Dados Gerados/rel_com_secoes_rotulos.rds")

  ------------------------------------------------------------------------------------------------
  Rótulo                                  Conteúdo                                       \# Rótulo
  --------------------------------------- -------------------------------------------- -----------
  Finalidade                              Verificar a regular utilização de recur...             1

  Finalidade                              veículos pela SMS.                                     1

  Entidade Responsável                    S. MSCF                                                2

  CPF/CNPJ                                **.475.879/-**                                         3

  Munícipio/UF                            CABO FRIO-RJ                                           4

  Fase(s)                                                                                        5

  Tipo da Fase Data Início Data Término   Tipo da Fase Data Início Data Término                  6

  Tipo da Fase Data Início Data Término   Analítica 01/08/2022 18/08/2022                        6

  Tipo da Fase Data Início Data Término   Execução - In loco 07/08/2023 11/08/2023               6

  Tipo da Fase Data Início Data Término   Relatório 14/08/2023 01/09/2023                        6
  ------------------------------------------------------------------------------------------------

  : Amostra de linhas sem números com maior número de ocorrências

Conforme se observou acima, o processo resultou em uma tabela na qual as linhas foram devidamente associadas às suas respectivas seções e rótulos.

Com essa base consolidada, passou-se à etapa de estruturação dos dados a partir dessas marcações. Para os rótulos delimitados pelo separador dois-pontos (`:`), já se dispunha, em princípio, do valor correspondente a cada campo --- representado pela parte do texto localizada após o separador. No entanto, identificaram-se casos em que o conteúdo extrapolava os limites da linha original, como ocorre com o valor atribuído ao rótulo "Finalidade", conforme evidenciado na tabela anterior.

Para consolidar o valor de campos, optou-se por concatenar todas as linhas associadas a cada ocorrência de rótulo, preservando a integridade semântica dos dados.

No código a seguir, executou-se tal operação, e apresenta-se, em seguida, um exemplo das informações rotuladas para o arquivo 19764_1.pdf.

    rel_com_secoes_rotulos |>
    summarise(
        `Conteúdo` = str_flatten(str_trim(Conteúdo), collapse = " "),
        `Linhas` = str_flatten(`# Linha Geral`, collapse = ", "),
        `Linha Inicial` = min(`# Linha Geral`),
        `Linha Final` = max(`# Linha Geral`),
        `Qtd Linhas` = (`Linha Final` - `Linha Inicial`) + 1,
        `# Página` = min(`# Página`),
        .by = c(
            `Arquivo`, 
            `No. Auditoria`,
            `Data Geração`,
            `Seção`, 
            `# Seção`,
            `Rótulo`,
            `# Rótulo`
        )
    ) |>
    write_rds("./Dados Gerados/conteudo_estruturado.rds")

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Rótulo                                  Conteúdo
  --------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------
  Finalidade                              Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.

  Entidade Responsável                    SMSPC

  CPF/CNPJ                                **.629.840/-**

  Munícipio/UF                            POÇOS DE CALDAS-MG

  Fase(s)                                 

  Tipo da Fase Data Início Data Término   Tipo da Fase Data Início Data Término Analítica 01/07/2024 12/07/2024 Execução - In loco 26/08/2024 30/08/2024 Relatório 02/09/2024 20/09/2024

  Demandante                              Componente Federal do SNA

  Forma                                   Direta

  Objeto                                  .Fora de bloco\|Rede de Frio

  Abrangência                             De Janeiro/2022 a Junho/2024.

  Nº Protocolo                            25000.102655/2024-28

  Tópico                                  PROGRAMA NACIONAL DE IMUNIZAÇÃO

  Grupo                                   Vigilância em Saúde Constatação Nº: 691723

  Subgrupo                                Vigilância Epidemiológica

  Item                                    Documentação/Registros
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Amostra tabela com dados estruturados

### Checagem do Processo de Rotulação

Para avaliar a qualidade do processo de rotulação, a principal preocupação foi identificar possíveis casos de vazamento, situações em que o algoritmo falhou em delimitar corretamente o conteúdo associado a um determinado rótulo, incorporando indevidamente informações que pertencem a outras seções ou rótulos.

Com esse objetivo, analisou-se a distribuição da variável que representa a quantidade de linhas agregadas por ocorrência de rótulo. A ideia central foi verificar se determinados rótulos concentraram um número atípico de linhas, o que poderia indicar um erro de associação.

Abaixo, apresenta-se uma visão geral dos rótulos que, em pelo menos um relatório, agregaram mais de uma linha. Adicionalmente, foram calculadas métricas descritivas sobre o número de ocorrências e a quantidade de linhas utilizadas, ordenadas conforme a frequência e o volume de conteúdo por rótulo.

- Min: quantidade mínima de linhas que esse rótulo usou
- P.25: quantidade de linhas usadas em 25% das ocorrências
- Mediana: mediana da quantidade de linhas usadas
- P.75: quantidade de linhas usadas em 75% das ocorrências
- P.99: quantidade de linhas usadas em 99% das ocorrências
- Max: quantidade máxima de linhas detectada

<!-- -->

    metricas_avaliacao <- conteudo_estruturado |>
        summarise(
            `Ordem` = median(`Linha Inicial`),
            `Min` = min(`Qtd Linhas`),
            `Mediana` = median(`Qtd Linhas`),
            `P.75` = quantile(`Qtd Linhas`, probs = .75, names = TRUE),
            `P.99` = quantile(`Qtd Linhas`, probs = .99, names = TRUE),
            `Max` = max(`Qtd Linhas`),
            .by = c(`Rótulo`) 
        ) |>
        mutate()

    num_rotulos <- nrow(metricas_avaliacao )

    rotulos_multilinhas <- metricas_avaliacao |>
      filter(`Max` > 1) |>
      arrange(Ordem) |>
      select(-Ordem) 

    rotulos_multilinhas |>
    arrange(desc(Max)) |>
    knitr::kable()

  ---------------------------------------------------------------------------
  Rótulo                                    Min   Mediana   P.75   P.99   Max
  --------------------------------------- ----- --------- ------ ------ -----
  Justificativa                               1         5     15    101   289

  Análise da Justificativa                    1         5     10     64   231

  Evidência                                   1        19     30     61    92

  Fonte da Evidência                          1         3      4     20    61

  Recomendação                                1         5      8     29    55

  Nome CPF/CNPJ                               2         2      2     14    37

  Tipo da Fase Data Início Data Término       2         5      7     10    27

  Constatação                                 1         2      2     13    22

  Destinatários da Recomendação               1         1      1      1    17

  Responsável(eis)                            1         1      1      1    17

  Objeto                                      1         1      1      1     4

  Finalidade                                  1         2      2      2     2

  Acatamento da Justificativa                 1         1      1      1     2
  ---------------------------------------------------------------------------

  : Métricas para Validação de Conteúdos

Ao todo, foram utilizados 26 rótulos na estruturação dos dados. Desses, 13 consolidaram conteúdos distribuídos em duas ou mais linhas em pelo menos um relatório.

Observou-se, por exemplo, que nos rótulos Justificativa e Análise da Justificativa, 75% das ocorrências apresentaram, respectivamente, até 15 e 10 linhas. Já no percentil 99, esses valores aumentaram para 101 e 64 linhas, o que ainda se mostrou compatível com a natureza descritiva esperada dessas seções.

A fim de verificar a robustez da extração, procedeu-se à análise dos casos extremos, em que se registrou o maior número de linhas para esses rótulos. Abaixo, detalha-se o caso referente ao campo Justificativa.

    obtem_caso <- function(rotulo, qtd_linhas, fim_secao){
        conteudo_estruturado |>
        filter(
            `Rótulo` == rotulo &
            `Qtd Linhas` == qtd_linhas & 
            str_ends(`Seção`, fim_secao)) |>
        select(`Arquivo`, `Linha Inicial`, `Linha Final`, `# Página`) |>
        transpose() |>
        pluck(1)
    }

    caso_justificativa <- obtem_caso("Justificativa", 289, "CONSTATAÇÕES")

    str(caso_justificativa)
    #> List of 4
    #>  $ Arquivo      : chr "19514_1.pdf"
    #>  $ Linha Inicial: int 645
    #>  $ Linha Final  : int 933
    #>  $ # Página     : int 12

Abaixo, tem-se o texto encontrado nesse arquivo e linhas.

  --------------------------------------------------------------------------------------
    \# Linha Linha
  ---------- ---------------------------------------------------------------------------
         645 Justificativa: JUSTIFICATIVA APRESENTADA POR M. C. M. S. G., SECRETÁR...

         646 OFÍCIO N.º 263/2024SMS, DE 16/5/2024. A JUSTIFICATIVA REFERE-SE AS CO...

         647 685243 e 682565:

         648 ''Nas Constatações referenciadas, a Auditoria aborda possíveis inserç...

         649 Informação Ambulatorial do Sistema Único de Saúde - SIA/SUS pela Secr...

         650 assim, se tornar, de modo indevida, elegível ao recebimento indevido ...

         651 No caso em questão, e com uma destacada diferença, é importante ressa...

         652 consciente ação de praticar quaisquer atos ilícitos que porventura pu...

         653 que, os recursos aplicados não tem e não tiveram o fim de obter prove...

         654 mesmo entidade que não fosse os atendimentos das necessidades dos dem...

         655 A Regional de Caxias, deveria em tese atender a 7 munícipios. Sucede ...

         656 estruturado da Mesorregião do Leste Maranhense, composto de 44 municí...

         657 de atração, principalmente na questão saúde, ocasionando muita das ve...

         658 prestados.

         659 Associado a esse problema de enorme demanda, é importante frisar, o c...

         671 detectou o seguinte: litteris ''Falta de acompanhamento, controle e a...

         672 informados nos Sistemas de Informação Ambulatorial (SAI/SUS), pelo Se...

         673 Municipal de Saúde de Caxias.''

         674 Desde que foi habilitado na Gestão Plena do Sistema Municipal de Saúd...

         675 controle e avaliação dos prestadores de serviços de saúde (públicos e...

         676 Cabe ao Setor de Controle e Avaliação a responsabilidade pelo cadastr...

         677 processamento da produção ambulatorial, garantindo a alimentação do b...

         678 instrumentos para operacionalização das atividades e autorização de i...

         679 ambulatoriais.

         680 É importante lembrar que quando um município é habilitado na Gestão P...

         681 assistência à saúde prestada aos seus munícipes, desde as ações básic...

         682 complexidade, que na sua maioria são oferecidos pela rede complementa...

         683 Diante desse cenário, a programação física e orçamentária da rede de ...

         684 responsabilidade do Setor de Controle e Avaliação, o que não ocorreu.

         685 Vale destacar que, a gestão financeira do Sistema Único de Saúde (SUS...

         686 regras que devem ser seguidas por cada um dos Entes da Federação. Den...

         687 as necessidades de se conhecer os fluxos estabelecidos dos recursos f...

         688 vinculações devem ser seguidas. Para tanto, compreender os principais...

         689 legislação que rege o processo de financiamento do SUS é papel fundam...

         690 necessidades públicas e ao melhor atendimento da população. Nesse âmb...

         691 no final do ano de 2017 pelo Ministério da Saúde alterou a forma de r...

         692 antigos blocos de financiamento de custeio do SUS.

         693 A Portaria nº 3.992, de 28 de dezembro de 2017, alterou a Portaria de...

         694 2017, que trata das normas sobre o financiamento e a transferência do...

         695 saúde do Sistema Único de Saúde. A Portaria de Consolidação nº 6 havi...

         696 a Portaria 204/2007, o financiamento e as transferências dos recursos...

         697 blocos de financiamento ou blocos financeiros. Para a recepção dos re...

         698 Fundo Nacional de Saúde, abria para cada bloco uma conta bancária e, ...

         699 financeira para cada um dos projetos aprovados com plano de aplicação...

         700 Nesse diapasão podemos creditar que o recebimento e a aplicação dos r...

         701 Nacional de Saúde ao Fundo Municipal de Saúde, foram aplicados de for...

         702 desorganização administrativa e financeira existente no setor, sem, c...

         703 recursos públicos.

         704 Finalmente, usando a expressão em Latim, ''pretium lluminationes'', q...

         705 a UNIÃO deve responder pelos PROGRAMAS E PROJETOS PACTUADOS tendo em ...

         706 estabelecida para cuidar da saúde, prevista no ARTIGO 23, INCISO II, ...

         707 ARTIGO 70, PARÁGRAFO ÚNICO, E ARTIGO 74, INCISO I, DA CONSTITUIÇÃO FE...

         708 federativa suportada pela arquitetura legal do cofinanciamento dos PR...

         709 essa interpretação. A PACTUAÇÃO COMO PONTO CENTRAL PARA AUTORIZAR A F...

         710 ENTES PARTICIPANTES, DOS RECURSOS CONTABILIZADOS NO FUNDO.

         711 A Lei Orgânica do SUS - Lei n° 8.080, de 19 de setembro de 1990 - que...

         712 proteção e recuperação da saúde, a organização e o funcionamento dos ...

         713 providências. Referida lei prevê, em seu artigo 35, os critérios para...

         714 União. Além disso, o dispositivo legal estabelece que os repasses ser...

         715 programas e projetos e serão depositados em conta especial, em cada e...

         716 Art. 12. Serão criadas comissões intersetoriais de âmbito nacional, s...

         717 integradas pelos Ministérios e órgãos competentes e por entidades rep...

         718 comissões intersetoriais terão a finalidade de articular políticas e ...

         719 envolva áreas não compreendidas no âmbito do Sistema Único de Saúde (...

         720 Art. 33. Os recursos financeiros do Sistema Único de Saúde (SUS) serã...

         732 de sua atuação, e movimentados sob fiscalização dos respectivos Conse...

         733 recursos financeiros, originários do Orçamento da Seguridade Social, ...

         734 fontes, serão administrados pelo Ministério da Saúde, através do Fund...

         735 4º O Ministério da Saúde acompanhará, através de seu sistema de audit...

         736 aplicação dos recursos repassados a Estados e Municípios. Constatada ...

         737 recursos, caberá ao Ministério da Saúde aplicar as medidas previstas ...

         738 Art. 34. As autoridades responsáveis pela distribuição da receita efe...

         739 ao Fundo Nacional de Saúde (FNS), observado o critério do parágrafo ú...

         740 correspondentes às dotações consignadas no Orçamento da Seguridade So...

         741 executados no âmbito do Sistema Único de Saúde (SUS).

         742 Art. 35. Para o estabelecimento de valores a serem transferidos a Est...

         743 combinação dos seguintes critérios, segundo análise técnica de progra...

         744 perfil epidemiológico da população a ser coberta; III - característic...

         745 IV - desempenho técnico, econômico e financeiro no período anterior; ...

         746 orçamentos estaduais e municipais; VI - previsão do plano quinquenal ...

         747 atendimento a serviços prestados para outras esferas de governo. § 1º...

         748 Municípios será distribuída segundo o quociente de sua divisão pelo n...

         749 qualquer procedimento prévio. (Revogado pela Lei Complementar nº 141,...

         750 casos de Estados e Municípios sujeitos a notório processo de migração...

         751 serão ponderados por outros indicadores de crescimento populacional, ...

         752 Além disso, existe a Lei n° 8.142, de 28 de dezembro de 1990, que tam...

         753 subnacionais recebam recursos do Fundo Nacional de Saúde. Vejamos:

         754 Art. 4° Para receberem os recursos, de que trata o art. 3° desta lei,...

         755 contar com:

         756 I - Fundo de Saúde;

         757 II - Conselho de Saúde, com composição paritária de acordo com o Decr...

         758 III - plano de saúde;

         759 IV - relatórios de gestão que permitam o controle de que trata o § 4°...

         760 V - contrapartida de recursos para a saúde no respectivo orçamento;

         761 VI - Comissão de elaboração do Plano de Carreira, Cargos e Salários (...

         762 implantação. Parágrafo único. O não atendimento pelos Municípios, ou ...

         763 requisitos estabelecidos neste artigo, implicará em que os recursos c...

         764 pelos Estados ou pela União.

         765 O Decreto n° 1.232, de 30 de agosto de 1994, que dispõe sobre as cond...

         766 recursos do Fundo Nacional de Saúde para os fundos de saúde estaduais...

         767 a apresentação pelo ente subnacional de um plano de saúde, que nada m...

         768 interfederativa que visa a nortear a atuação de todos os entes gestor...

         769 A Lei Complementar n° 141, de 2012, também prevê que a fiscalização d...

         770 sistema de auditoria de SUS pelos órgãos de controle interno de cada ...

         771 cumprimento da mesma lei. Vejamos:

         772 Art. 27. Quando os órgãos de controle interno do ente beneficiário, d...

         773 detectarem que os recursos previstos no inciso II do § 3º do art. 198...

         774 ações e serviços diversos dos previstos no art. 3o desta Lei Compleme...

         775 originalmente pactuado, darão ciência ao Tribunal de Contas e ao Mini...

         776 do recurso, com vistas:

         777 I - à adoção das providências legais, no sentido de determinar a imed...

         778 Saúde do ente da Federação beneficiário, devidamente atualizados por ...

         779 visando ao cumprimento do objetivo do repasse;

         780 II - à responsabilização nas esferas competentes.

         781 Art. 37. Os órgãos fiscalizadores examinarão, prioritariamente, na pr...

         793 art. 56 da Lei Complementar nº 101, de 4 de maio de 2000, o cumprimen...

         794 nesta Lei Complementar.

         795 Art. 38. O Poder Legislativo, diretamente ou com o auxílio dos Tribun...

         796 órgão de controle interno e do Conselho de Saúde de cada ente da Fede...

         797 Complementar, fiscalizará o cumprimento das normas desta Lei Compleme...

         798 I - à elaboração e execução do Plano de Saúde Plurianual;

         799 II - ao cumprimento das metas para a saúde estabelecidas na lei de di...

         800 III - à aplicação dos recursos mínimos em ações e serviços públicos d...

         801 Complementar;

         802 IV - às transferências dos recursos aos Fundos de Saúde;

         803 V - à aplicação dos recursos vinculados ao SUS;

         804 VI - à destinação dos recursos obtidos com a alienação de ativos adqu...

         805 Art. 40. Os Poderes Executivos da União, dos Estados, do Distrito Fed...

         806 respectivos Tribunais de Contas, informações sobre o cumprimento dest...

         807 subsidiar as ações de controle e fiscalização. Parágrafo único. Const...

         808 pelo Poder Executivo e os obtidos pelos Tribunais de Contas em seus p...

         809 Poder Executivo e à direção local do SUS, para que sejam adotadas as ...

         810 previstas em lei.

         811 Além disso, o Decreto n° 7.827, de 16 de outubro de 2012, estabelece ...

         812 ao eventual descumprimento da Lei Complementar n° 141, de 2012:

         813 Art. 23. Verificado o descumprimento das disposições da Lei Complemen...

         814 detectada a aplicação de recursos federais em objeto diverso do origi...

         815 comunicará a irregularidade:

         816 I - ao órgão de auditoria do SUS;

         817 II - à direção local do SUS;

         818 III - ao responsável pela administração orçamentária e financeira do ...

         819 IV - aos órgãos de controle interno e externo do ente federativo;

         820 V - ao Conselho de Saúde; e

         821 VI - ao Ministério Público.

         822 § 1º A comunicação a que se refere o caput somente será encaminhada a...

         823 Público com atribuição para o caso após o esgotamento da via administ...

         824 sem prejuízo do exercício autônomo das competências e atribuições pre...

         825 § 2º A atuação dos destinatários da comunicação de que trata o caput ...

         826 dos recursos irregularmente aplicados ao Fundo de Saúde do ente feder...

         827 objetivo do repasse, nos termos do inciso I do caput do art. 27 da Le...

         828 Decreto nº 9.380, de 2018)

         829 § 3º Para os fins do disposto no § 2º , em caso de aplicação de recur...

         830 Constituição em ações e serviços diversos dos previstos no art. 3º da...

         831 diverso do originalmente pactuado, a devolução será efetivada com rec...

         832 § 4º Na hipótese de, durante a cobrança administrativa, que faz parte...

         833 refere o §1º , ficar evidenciado que o ente federativo beneficiário n...

         834 repassdeverá ser feita a devolução dos recursos irregularmente aplica...

         835 federativo que repassou os recursos. (Incluído pelo Decreto nº 9.380,...

         836 A Portaria n° 2.587, de 25 de setembro de 2020, que dispõe sobre os p...

         837 transferência de recursos federais na modalidade fundo a fundo no âmb...

         838 determina que compete aos setores finalísticos do Ministério da Saúde...

         839 Art. 2º Compete aos setores finalísticos do Ministério da Saúde, resp...

         840 de saúde:

         841 I - a análise e aprovação de mérito referente à política de saúde a s...

         842 federais;

         854 II - a apuração e controle de limites e parâmetros relativos aos valo...

         855 ente beneficiário, inclusive por meio de sistemas informatizados espe...

         856 III - o estabelecimento e acompanhamento de critérios para efetivação...

         857 federais a fundos de saúde de Estados, Municípios e Distrito Federal,...

         858 suspensão de transferências, quando cabível; e

         859 IV - o monitoramento, regulação, controle e avaliação das ações e ser...

         860 recursos federais, inclusive proceder à análise dos Relatórios de Ges...

         861 subsidiar o aprimoramento das políticas de saúde e a tomada de decisõ...

         862 1148 da Portaria de Consolidação nº 6/GM/MS, de 28 de setembro de 201...

         863 Portanto, exige-se do ente subnacional interessado no recebimento do ...

         864 de habilitação junto ao Ministério da Saúde. Tal exigência é prevista...

         865 2020, da seguinte maneira:

         866 CAPÍTULO II DOS PROCEDIMENTOS PARA A OPERACIONALIZAÇÃO DAS TRANSFERÊN...

         867 FEDERAIS NA MODALIDADE FUNDO A FUNDO

         868 Art. 3º As transferências de recursos federais aos Estados, Distrito ...

         869 será precedida de:

         870 I - publicação de portaria ministerial de habilitação dos entes benef...

         871 II - inclusão das informações de pagamento no Sistema de Gerenciament...

         872 SISPROFNS; e

         873 III - instrução e encaminhamento de processo administrativo de pagame...

         874 O Anexo da referida Portaria estabelece, ainda, os requisitos formais...

         875 Dentre os requisitos estão a consignação das normas a serem observada...

         876 da transferência fundo a fundo. Vejamos:

         877 ANEXO

         878 REQUISITOS FORMAIS PARA A OPERACIONALIZAÇÃO DAS TRANSFERÊNCIAS DE REC...

         879 MODALIDADE FUNDO A FUNDO PORTARIA DE HABILITAÇÃO

         880 1 - O preâmbulo da portaria deve conter referência aos seguintes norm...

         881 a\) Art. 35 da Lei nº 8.080, de 19 de setembro de 1990, que estabelece...

         882 técnica de programas e projetos para o estabelecimento de valores;

         883 b\) Arts. 3º e 4º da Lei nº 8.142, de 28 de dezembro de 1990, que dete...

         884 Estados, Municípios e Distrito Federal e as condições para que os ent...

         885 c\) Lei Complementar nº 141, de 13 de janeiro de 2012, que estabeleceu...

         886 transferências da saúde e as normas de fiscalização, avaliação e cont...

         887 governo, especialmente o disposto no parágrafo único de seu art. 22, ...

         888 e ao funcionamento do Fundo e do Conselho de Saúde no âmbito do ente ...

         889 d\) Decreto nº 1.232, de 30 de agosto 1994, que dispõe sobre as condiç...

         890 recursos do Fundo Nacional de Saúde para os fundos de saúde estaduais...

         891 Decreto nº 7.507, de 27 de junho 2011, que dispõe sobre a movimentaçã...

         892 e\) Portaria de Consolidação nº 6/GM/MS, de 28 de setembro de 2017, qu...

         893 o financiamento e a transferência dos recursos federais para as ações...

         894 f\) Atos normativos que regulamentam a execução de emendas parlamentar...

         895 g\) Os atos legais que regulamentam o programa e a rede prioritária, r...

         896 h\) Número Único de Protocolo (NUP) do Sistema Eletrônico de Informaçõ...

         897 correspondente ao processo administrativo com as informações técnicas...

         898 No mesmo sentido caminha a Portaria de Consolidação n° 6, de 28 de se...

         899 normas sobre o financiamento e a transferência dos recursos federais ...

         900 Único de Saúde. Referida norma prevê que os recursos que compõem cada...

         901 em ações e serviços públicos de saúde relacionados ao próprio bloco.

         902 Dessa maneira, verifica-se que a legislação atinente ao SUS prevê a p...

         903 fundo a fundo pela União devam ser precedidas da realização de pactua...

         915 habilitação do ente subnacional a uma determinada ação de saúde. Port...

         916 recíproco entre a União e o ente federado que pactua para o desenvolv...

         917 este devidamente amparado pela competência comum prevista no artigo 2...

         918 Portanto, na medida em que existe uma pactuação feita pela União e o ...

         919 responsabilidade acerca do objeto e da execução da referida pactuação.

         920 Nesse ponto, os repasses fundos a fundo pelos entes federados, não de...

         921 financeiras estanques, em que a execução das despesas só pode ser vis...

         922 sem espelhar a verdadeira integração entre os entes federados no proj...

         923 Todos esses aspectos reforçam a necessidade de que todas as instituiç...

         924 avaliação e monitoramento do SUS superem a abordagem burocrática, foc...

         925 regras de finanças públicas, e avance em abordagens focadas nos resul...

         926 SUS, que, ressalta-se, são relacionadas ao modelo de gestão participa...

         927 compreender que não existem finalidades exclusivas do Ministério da S...

         928 União é apenas uma parte do grande empreendimento social que é o SUS....

         929 os objetivos e finalidades sejam comuns e indivisíveis, conforme pact...

         930 falar em separação dos recursos.

         931 Finalmente, tem-se observado que a Douta Auditoria tem se reportado a...

         932 ora a questão não pode ser analisada somente por esse viés, por uma q...

         933 desses recursos? Eles não despencam do universo.''
  --------------------------------------------------------------------------------------

  : Casos Justificativa

Conforme se vê, o texto foi corretamente atribuído ao seu rótulo. Passa-se, agora, à análise do caso extremo referente ao rótulo "Análise da Justificativa".

A seguir, apresentam-se os dados correspondentes ao relatório em que esse caso foi identificado.

    caso_analise_justificativa <- obtem_caso("Análise da Justificativa", 231, "CONSTATAÇÕES")

    str(caso_analise_justificativa)
    #> List of 4
    #>  $ Arquivo      : chr "19484_1.pdf"
    #>  $ Linha Inicial: int 2569
    #>  $ Linha Final  : int 2799
    #>  $ # Página     : int 42

Abaixo, tem-se o texto encontrado nesse arquivo e linhas.

  --------------------------------------------------------------------------------------
    \# Linha Linha
  ---------- ---------------------------------------------------------------------------
        2569 Análise da Justificativa: A justificativa apresentada pela SMS de Bom...

        2570 situação evidenciada na constatação, conforme apresentado em sua próp...

        2571 setor de fiscalização, tal situação, prevista na cláusula décima terc...

        2572 Convênio n° 001/2017, não substitui as obrigações descritas nas cláus...

        2573 vista que estabelecem os critérios de "APURAÇÃO DOS SERVIÇOS PRESTADO...

        2574 PAGAMENTO, DA PRESTAÇÃO DE CONTAS E DA APLICAÇÃO DO REPASSE FINANCEIR...

        2575 INSTRUMENTO DE CONTROLE", respectivamente, uma vez que não foi possív...

        2576 documental da apuração dos serviços prestados, da forma de pagamento,...

        2577 aplicação do repasse financeiro, assim como a efetiva atuação da Comi...

        2578 enquadramentos encontram reforço na Portaria GM/MS de Consolidação n....

        2579 Seção III, art. 28, § 3°: "O não cumprimento pelo hospital das metas ...

        2580 discriminadas no Documento Descritivo implicará na suspensão parcial ...

        2581 financeiros pelo gestor local. (Origem: PRT MS/GM 3410/2013, Art. 28,...

        2582 auditoria considerou a validação dos instrumentos apresentados em car...

        2583 contendo informações sobre aspectos qualitativos da organização hospi...

        2584 pertinência, quando comparadas com as metas estabelecidas contratualm...

        2585 demonstrou um alcance percentual de resultados nos anos de 2017, 2018...

        2586 24%, respectivamente, cujos efeitos recaem no volume de pagamentos de...

        2587 pagos acerca das metas qualitativas contidas nos respectivos Document...

        2588 impactando os valores a serem objeto de proposição de devolução, cujo...

        2589 específica reduzindo o valor para R\$ 5.411.324,29 (cinco milhões, qua...

        2590 quatro reais e vinte e nove centavos). Não obstante, ainda que esteja...

        2591 atenuantes, tais instrumentos não foram capazes de elidir integralmen...

        2592 constatação, sendo mantida assim sua não conformidade.

        2604 A justificativa do ex-Secretário Municipal de Saúde de Bom Jesus do I...

        2605 acatada, conforme afirmado em resposta, cita a exiguidade do prazo pa...

        2606 além de apresentar cópia de documento do tipo Declaração, informando ...

        2607 atendeu a regular e satisfatória demanda da gestão municipal, assinad...

        2608 na Coordenação de Controle e Avaliação, Regulação e Auditoria em perí...

        2609 na SMS de Bom Jesus do Itabapoana/RJ. Acrescentando que a função de g...

        2610 função de fiscalização. Ademais, independentemente do documento de de...

        2611 responsabilidades do gestor municipal são estabelecidas na Portaria d...

        2612 setembro de 2017, ANEXO XXIV, CAPÍTULO I, art. 5º, inciso IX -"gestão...

        2613 comandar um sistema de saúde municipal,(...), exercendo as funções de...

        2614 negociação, planejamento, acompanhamento, controle, avaliação e audit...

        2615 de formulação de políticas/planejamento, financiamento, coordenação, ...

        2616 sistema/redes e dos prestadores públicos ou privados e prestação dire...

        2617 MS/GM 3390/2013, Art. 5º, IX), assim como no Anexo XXVI, CAPÍTULO I, ...

        2618 ...exercer, em seu âmbito administrativo, as seguintes atividades: (O...

        2619 "executar a regulação, o controle, a avaliação e a auditoria da prest...

        2620 MS/GM 1559/2008, Art. 10, I), II -"definir, monitorar e avaliar a apl...

        2621 PRT MS/GM 1559/2008, Art. 10, II), III -"elaborar estratégias para a ...

        2622 (Origem: PRT MS/GM 1559/2008, Art. 10, III), (...) V -"capacitar de f...

        2623 controle e avaliação; e (Origem: PRT MS/GM 1559/2008, Art. 10, V)", a...

        2624 de 1990, TÍTULO II, CAPÍTULO IV, Seção II, art. 18. "À direção munici...

        2625 organizar, controlar e avaliar as ações e os serviços de saúde e geri...

        2626 (...) III - participar da execução, controle e avaliação das ações re...

        2627 trabalho; (...) XI - controlar e fiscalizar os procedimentos dos serv...

        2628 informações apresentadas em caráter de justificativas não foram capaz...

        2629 constatação, sendo mantida assim sua não conformidade. No entanto, a ...

        2630 validação dos instrumentos apresentados em caráter de resposta a essa...

        2631 Jesus do Itabapoana/RJ, contendo informações sobre aspectos qualitati...

        2632 proporção de sua pertinência, quando comparadas com as metas estabele...

        2633 apresentado demonstrou um alcance percentual de resultados nos anos d...

        2634 20%, 22% e 24%, respectivamente, cujos efeitos recaem no volume de pa...

        2635 efetivamente pagos acerca das metas qualitativas contidas nos respect...

        2638 Diante da ausência de manifestação pelo Sr. P. R. T. B. ex- Secretári...

        2639 Itabapoana/RJ, permanece a condição de não conformidade diante dos cr...

        2640 equipe de auditoria considerou a validação dos instrumentos apresenta...

        2641 constatação, pela SMS de Bom Jesus do Itabapoana/RJ, contendo informa...

        2642 da organização hospitalar, na proporção de sua pertinência, quando co...

        2643 contratualmente. O conteúdo apresentado demonstrou um alcance percent...

        2644 2017, 2018 e 2019, na ordem de 20%, 22% e 24%, respectivamente, cujos...

        2645 pagamentos devidos, sobre aqueles efetivamente pagos acerca das metas...

        2646 respectivos Documentos Descritivos.

        2649 A justificativa da ex-Secretária Municipal de Saúde de Bom Jesus do I...

        2650 será acatada, como explicado em resposta, cita a responsabilidade e a...

        2651 Sistema Nacional de Auditoria dos pagamentos realizados, tais informa...

        2652 situação evidenciada na constatação, sendo mantida assim sua não conf...

        2653 auditoria considerou a validação dos instrumentos apresentados em car...

        2654 pela SMS de Bom Jesus do Itabapoana/RJ, contendo informações sobre as...

        2666 hospitalar, na proporção de sua pertinência, quando comparadas com as...

        2667 contratualmente. O conteúdo apresentado demonstrou um alcance percent...

        2668 2017, 2018 e 2019, na ordem de 20%, 22% e 24%, respectivamente, cujos...

        2669 pagamentos devidos, sobre aqueles efetivamente pagos acerca das metas...

        2670 respectivos Documentos Descritivos.

        2673 A justificativa do ex-Secretário Municipal de Saúde de Bom Jesus do I...

        2674 acatada, como explicado em resposta, cita a responsabilidade e avalia...

        2675 Sistema Nacional de Auditoria dos pagamentos realizados, tais informa...

        2676 situação evidenciada na constatação, sendo mantida assim sua não conf...

        2677 auditoria considerou a validação dos instrumentos apresentados em car...

        2678 pela SMS de Bom Jesus do Itabapoana/RJ, contendo informações sobre as...

        2679 hospitalar, na proporção de sua pertinência, quando comparadas com as...

        2680 contratualmente. O conteúdo apresentado demonstrou um alcance percent...

        2681 2017, 2018 e 2019, na ordem de 20%, 22% e 24%, respectivamente, cujos...

        2682 pagamentos devidos, sobre aqueles efetivamente pagos acerca das metas...

        2683 respectivos Documentos Descritivos.

        2686 Diante da ausência de manifestação pela Srª. L. A. N. A. ex- Secretár...

        2687 Itabapoana/RJ, permanece a condição de não conformidade diante dos cr...

        2688 equipe de auditoria considerou a validação dos instrumentos apresenta...

        2689 constatação, pela SMS de Bom Jesus do Itabapoana/RJ, contendo informa...

        2690 da organização hospitalar, na proporção de sua pertinência, quando co...

        2691 contratualmente. O conteúdo apresentado demonstrou um alcance percent...

        2692 2017, 2018 e 2019, na ordem de 20%, 22% e 24%, respectivamente, cujos...

        2693 pagamentos devidos, sobre aqueles efetivamente pagos acerca das metas...

        2694 respectivos Documentos Descritivos.

        2697 A justificativa do auditado Hospital São Vicente de Paulo não será ac...

        2698 inicial apresentada, de que o DENASUS praticara uma mudança no escopo...

        2699 contratualização, é justo esclarecer de que é por meio do instituto d...

        2700 estabelecem a "formalização da relação entre gestores de saúde e hosp...

        2701 estabelecimento de compromissos entre as partes, promovendo a qualifi...

        2702 hospitalar... e as seguintes diretrizes": (Origem: PRT MS/GM 3390/201...

        2703 "I - adequação das ações e serviços contratualizadas às necessidades ...

        2704 na CIR, quando houver; (Origem: PRT MS/GM 3390/2013, Art. 30, I)

        2706 III - estabelecimento de valores e formas de repasse dos recursos fin...

        2707 monitoramento de metas qualiquantitativas; (Origem: PRT MS/GM 3390/20...

        2708 IV - aprimoramento dos processos de avaliação, controle e regulação d...

        2709 PRT MS/GM 3390/2013, Art. 30, IV)

        2710 V - efetivação do controle social e garantia de transparência". (Orig...

        2711 Dessa forma, não há o que acrescentar quanto à legitimidade da verifi...

        2712 subquestões (folhas 4 e 5) apresentadas no relatório de auditoria em ...

        2713 decorrentes dessa verificação.

        2714 A manifestação do auditado prossegue, direcionando argumentações acer...

        2715 instituição na Rede de Atenção à Saúde (RAS) local e regional, bem co...

        2716 mais exitoso desempenho, fatos e situações de que a equipe de auditor...

        2717 efetivo reconhecimento quando da fase operativa. No entanto, ao enver...

        2718 quanto aos responsáveis apontados no relatório, especificamente da nã...

        2730 responsabilização do ente público Município de Bom Jesus do Itabapoan...

        2731 políticas públicas da área em discussão, a Secretaria Municipal de Sa...

        2732 proferida pelo TCU que versa sobre Tomadas de Contas Especiais - TCE,...

        2733 que tal instituto é um processo administrativo devidamente formalizad...

        2734 responsabilidade por ocorrência de dano à administração pública feder...

        2735 quantificação do dano, identificação dos responsáveis e obter o respe...

        2736 IN/TCU 71/2012), que constitui medida de exceção, portanto a Administ...

        2737 administrativas para elidir a irregularidade ensejadora da TCE ou obt...

        2738 formalizar a instauração do processo. Por derradeiro, quanto à TCE me...

        2739 apreciação do processo de TCE, no âmbito da União, constitui competên...

        2740 art. 70, parágrafo único, c/c art. 71, ambos da Constituição Federal.

        2741 Não obstante, ao reler o relatório, o auditado pode claramente observ...

        2742 quais o mesmo fora apontado como responsável, trazem em seu bojo pess...

        2743 públicas nos períodos identificados nos fatos geradores do dano, na i...

        2744 argumentação, em igualdade de responsabilidade. Nessa trilha de equív...

        2745 voga como desvio, em detrimento de seu real enquadramento, o dano ao ...

        2746 argumentativa de que houve benefícios à população e que por isso, em ...

        2747 em repor tais recursos, isso recairia ao ente da federação, fato que ...

        2748 natureza do evento.

        2749 Por conseguinte, continua o auditado em suas argumentações, reitera s...

        2750 responsabilidades sobre os fatos e danos apurados, ao citado municípi...

        2751 despesas que tiveram em seus trâmites internos, a participação das ár...

        2752 menciona que "as liquidações das despesas foram efetuadas pelos setor...

        2753 componente municipal do Sistema Nacional de Auditoria, com amplos pod...

        2754 chancelam o repasse dos recursos pactuados". No que comete novo equív...

        2755 áreas técnicas que compõem a estrutura municipal, não há efetiva ou p...

        2756 apresente vínculo com o SNA. A despeito desse equívoco, é justo admit...

        2757 compreensível, tendo em vista que a estrutura municipal apresenta na ...

        2758 de Controle, Avaliação e Auditoria, cujas atividades de fato não estã...

        2759 pelo SNA, embora atuem nos processos internos da secretaria em tela.

        2760 Os documentos, em forma de fotocópia, apresentados com o fito de dar ...

        2761 somente corroboram o fato constatado e devidamente evidenciado no rel...

        2762 efetuados com recursos federais não cumpriram com os critérios contra...

        2763 instrumentos anteriormente mencionados, Termo de Convênio n.º 01/2017...

        2764 Aditivos.

        2765 Em caráter complementar, o auditado apresenta extratos das manifestaç...

        2766 "Declaração" nos quais dois ex-coordenadores responsáveis pela chefia...

        2767 CONTROLE E AVALIAÇÃO, REGULAÇÃO E AUDITORIA DA SECRETARIA MUNICIPAL D...

        2768 BOM JESUS DO ITABAPOANA expressam que o HSVP atendera "de forma regul...

        2769 demanda direcionada pela gestão municipal, bem como garantiu o acesso...

        2770 seu papel de prestador de serviço contratualizado, nos requisitos ass...

        2771 em seguida admitir "...metas estipuladas possuem uma natureza quase q...

        2772 conhecimento de que os fatos trazidos no relatório de achados dessa a...

        2773 documental de forma clara e objetiva.

        2774 Por epílogo, o auditado ratifica, ao mencionar a ausência da Comissão...

        2775 Contratualização, a irregularidade dos pagamentos realizados sem o de...

        2776 analítico da mesma.

        2777 Acrescenta, resgatando o teor das denúncias que subsidiaram a demanda...

        2778 própria equipe verificara que as mesmas não se mostraram efetivas, di...

        2779 não apresenta fatos novos que elidam as não conformidades referentes ...

        2791 devido amparo documental, objetivamente apresentadas no relatório de ...

        2792 período auditado.

        2793 Por fim, se faz necessário esclarecer que cabe à equipe de auditoria ...

        2794 forma clara e objetiva às partes interessadas e autoridades competent...

        2795 cabendo à mesma, juízo de valor sobre o referido rito, uma vez que a ...

        2796 meio de seus órgãos competentes, essa prerrogativa.

        2797 A justificativa do HSVP, não será acatada, conforme afirmado em respo...

        2798 uma fundamentação adequada específica para constatação em tela. Porta...

        2799 capazes de elidir a situação evidenciada na constatação, sendo mantid...
  --------------------------------------------------------------------------------------

  : Caso Extremo Análise Justificativa

Conforme se observou, tratava-se de uma análise extensa da justificativa, corretamente detectada pelo processo de tratamento de dados.

Todos os rótulos que, em pelo menos um caso, apresentaram valores distribuídos em múltiplas linhas possuíam descrições compatíveis com essa possibilidade, seja por conterem texto contínuo, seja por conterem múltiplos itens, como em "Responsável(eis)".

A única exceção aparente foi o rótulo "Nome CPF/CNPJ". No entanto, verificou-se que esse campo, em todos os casos, ocupou ao menos duas linhas. Ainda assim, para fins de validação, procedeu-se à checagem do conteúdo desse campo no caso extremo.

Abaixo, apresentam-se as informações relativas à ocorrência.

    #> List of 4
    #>  $ Arquivo      : chr "19537_2.pdf"
    #>  $ Linha Inicial: int 1595
    #>  $ Linha Final  : int 1631
    #>  $ # Página     : int 27

Conforme demonstrado na tabela a seguir, o valor atribuído ao rótulo está correto.

  -----------------------------------------------------------------------
                \# Linha Linha
  ---------------------- ------------------------------------------------
                    1595 Nome CPF/CNPJ

                    1596 AMM \***.835.887-**

                    1597 AAF \***.044.457-**

                    1598 CVRR \***.851.417-**

                    1599 CMDL **.609.465/-**

                    1611 IRCC

                    1612 DSM \***.268.327-**

                    1613 \***.155.707-**

                    1614 DPGJ \***.104.897-**

                    1615 ECC \***.177.267-**

                    1616 FCL \***.893.307-**

                    1617 HAS S \***.370.167-**

                    1618 IWSS \***.692.337-**

                    1619 JAM \***.050.797-**

                    1620 JQV \***.418.967-**

                    1622 KCM \***.511.047-**

                    1623 KSO \***.170.207-**

                    1624 LHVF \***.467.537-**

                    1625 MCFS \***.370.557-**

                    1626 PNC \***.653.787-**

                    1627 RTL \***.968.737-**

                    1628 RF \***.875.077-**

                    1629 RAS SA \***.987.947-**

                    1630 RAS S \***.426.607-**

                    1631 SCC \***.020.607-**
  -----------------------------------------------------------------------

  : Caso Extremo Nome CPF/CNPJ

### Identificação das Constatações

Por fim, observou-se que cada constatação é composta por um conjunto de rótulos, tais como Grupo, Subgrupo, Constatação, Evidência, entre outros. Diante disso, tornou-se necessário diferenciar o conjunto de rótulos de cada constatação. Abaixo, apresenta-se um exemplo dos rótulos de uma constatação, conforme registrados no *dataframe*:

  ------------------------------------------------------------------------
  Arquivo          Rótulo                                    Linha Inicial
  ---------------- -------------------------------------- ----------------
  19764_1.pdf      Tópico                                              397

  19764_1.pdf      Grupo                                               401

  19764_1.pdf      Subgrupo                                            402

  19764_1.pdf      Item                                                403

  19764_1.pdf      Constatação                                         404

  19764_1.pdf      Evidência                                           405

  19764_1.pdf      Fonte da Evidência                                  420

  19764_1.pdf      Conformidade                                        424

  19764_1.pdf      Justificativa                                       425

  19764_1.pdf      Análise da Justificativa                            448

  19764_1.pdf      Acatamento da Justificativa                         452

  19764_1.pdf      Recomendação                                        453

  19764_1.pdf      Destinatários da Recomendação                       458

  19764_1.pdf      Nome CPF/CNPJ                                       459

  19764_1.pdf      Grupo                                               465

  19764_1.pdf      Subgrupo                                            466

  19764_1.pdf      Item                                                467

  19764_1.pdf      Constatação                                         468

  19764_1.pdf      Evidência                                           471

  19764_1.pdf      Fonte da Evidência                                  504

  19764_1.pdf      Conformidade                                        507

  19764_1.pdf      Grupo                                               510

  19764_1.pdf      Subgrupo                                            511

  19764_1.pdf      Item                                                512

  19764_1.pdf      Constatação                                         513
  ------------------------------------------------------------------------

  : Amostra Seção Constatações

Foram identificados os seguintes rótulos que antecedem o campo "Constatação": Tópico, Grupo, Subgrupo e Item. A princípio, aventou-se a hipótese de que a primeira ocorrência do rótulo *Tópico* poderia ser utilizada como delimitador do início de uma nova constatação. Para testar essa hipótese, verificou-se se esses rótulos ocorrem com a mesma frequência no corpus analisado.

  -----------------------------------------------------------------------
  Rótulo                                                         Contagem
  -------------------------------------- --------------------------------
  Grupo                                                              4978

  Subgrupo                                                           4978

  Item                                                               4978

  Constatação                                                        4978

  Tópico                                                              717
  -----------------------------------------------------------------------

  : Número de Ocorrências Rótulos Constatação

Conforme demonstrado, os rótulos Grupo, Subgrupo, Item e Constatação aparecem em igual quantidade, o que sugere uma estrutura padronizada de constatação. Já o rótulo Tópico ocorre com frequência menor, indicando que nem todas as constatações o utilizam.

Diante disso, considera-se viável adotar como marcador do início de uma nova constatação tanto a ocorrência do rótulo Tópico (quando presente) quanto a do rótulo Grupo (quando não precedido por Tópico). Para validar essa abordagem, será necessário verificar se existem casos em que o rótulo Tópico aparece sem ser sucedido por Grupo, o que poderia inviabilizar a solução proposta.

Adicionalmente, observa-se que a linha que contém o rótulo "Grupo" também apresenta o número original da constatação. Caso essa relação se confirme como uma regra, tal número poderá ser extraído sistematicamente e atribuído a um novo campo denominado `# Constatação`, contribuindo para a organização e rastreabilidade dos dados estruturados.

    qtd_topicos_nao_sucedidos_grupo <- conteudo_estruturado |>
        filter(`Rótulo` == "Tópico" & lead(`Rótulo`) != "Grupo") |>
        nrow()

    qtd_rotulos_grupo_sem_constatacao <- conteudo_estruturado |>
      filter(`Rótulo` == "Grupo") |>
      filter(!str_detect(`Conteúdo`, "Constata..o N")) |>
      nrow()

    # write_rds(conteudo_estruturado, "./Dados Gerados/conteudo_estruturado.rds")

    conteudo_estruturado_const_delim <- conteudo_estruturado |>
      mutate(
        `# Constatação` = if_else(
            `Rótulo` == "Grupo", 
            str_sub(`Conteúdo`, -6),
            NA),
        `# Constatação` = if_else(`Rótulo` == "Tópico", lead(`# Constatação`), `# Constatação`)
      ) |>
      group_by(Arquivo, `Seção`) |>
      fill(`# Constatação`, .direction = "down") |>
      mutate(`# Recomendação` = if_else(`Rótulo` == "Recomendação", 1, 0)) |>
      group_by(`# Constatação`, .add = TRUE) |>
      mutate(`# Recomendação` = cumsum(`# Recomendação`)) |>
      ungroup()

A hipótese de que o rótulo "Tópico" é sempre imediatamente seguido por "Grupo" foi validada, uma vez que a consulta correspondente retornou zero registros em que essa ordem foi violada. Isso autoriza o uso do rótulo "Tópico" como marcador confiável do início de uma nova constatação, e permite vincular corretamente os dados subsequentes a essa estrutura.

Além disso, verificou-se que em todos os casos o rótulo "Grupo" contém, em seu conteúdo, a numeração original da constatação, o que corrobora a utilização dessa informação como identificador exclusivo. Como não foram encontrados registros em que essa numeração estivesse ausente, optou-se por extrair o número da constatação diretamente do conteúdo associado ao rótulo "Grupo" e utilizá-lo como chave de referência para vincular os demais campos relativos à mesma constatação.

Com base nessa estrutura, também foi possível numerar as recomendações associadas a cada constatação, permitindo estabelecer uma relação clara entre elas e facilitar análises futuras.

### Conclusão

Para facilitar o uso e a manipulação das informações estruturadas ao longo deste trabalho, os dados foram organizados em três conjuntos distintos. O primeiro reúne os metadados das auditorias, extraídos da seção "DADOS BÁSICOS", contendo informações como número da auditoria, unidade auditada e data de geração do relatório. O segundo concentra os dados relativos às constatações identificadas em cada auditoria, excluindo os campos relacionados às recomendações. O terceiro conjunto agrega as recomendações vinculadas a cada constatação, devidamente numeradas e estruturadas com base em seus respectivos rótulos.

A separação em três bases (auditorias, constatações e recomendações) tem como objetivo favorecer tanto a análise individualizada dos elementos quanto sua eventual recombinação, possibilitando o cruzamento de informações com alto grau de granularidade e reprodutibilidade.

Os dados resultantes foram a seguir detalhados:

    auditorias <- conteudo_estruturado_const_delim |>
      filter(`Seção` == "DADOS BÁSICOS") |>
      select(
        `Arquivo`, 
        `No. Auditoria`,
        `Rótulo`,
        `Conteúdo`,
        `Data Geração`) |>
      pivot_wider(
        id_cols = c(`Arquivo`, `No. Auditoria`, `Data Geração`), 
        names_from = "Rótulo", 
        values_from = "Conteúdo")

    rotulos_recomendacao <- conteudo_estruturado_const_delim |>
        filter(`Seção` == "CONSTATAÇÕES") |>
        filter(`# Recomendação` > 0) |>
        select(`Rótulo`) |>
        distinct() |>
        chuck("Rótulo")

    constatacoes <- conteudo_estruturado_const_delim |>
      filter(`Seção` == "CONSTATAÇÕES" & !(`Rótulo` %in% rotulos_recomendacao)) |>
      select(
        `Arquivo`, 
        `No. Auditoria`,
        `# Constatação`,
        `Rótulo`,
        `Conteúdo`) |>
      pivot_wider(
        id_cols = c(`Arquivo`, `No. Auditoria`, `# Constatação`), 
        names_from = "Rótulo", 
        values_from = "Conteúdo")

    recomendacoes <- conteudo_estruturado_const_delim |>
        filter(`Seção` == "CONSTATAÇÕES") |>
        filter(`# Recomendação` > 0) |>
        pivot_wider(
          id_cols = c(`Arquivo`, `No. Auditoria`, `# Constatação`, `# Recomendação`),
          names_from = "Rótulo", 
          values_from = "Conteúdo")

    write_rds(auditorias, "./Dados Gerados/auditorias.rds")
    write_rds(constatacoes, "./Dados Gerados/constatacoes.rds")
    write_rds(recomendacoes, "./Dados Gerados/recomendacoes.rds")

A seguir, algumas estatísticas descritivas que evidenciam a abrangência do corpus analisado:

- Total de arquivos processados: 399
- Total de auditorias identificadas: 349
- Total de unidades auditadas: 204
- Total de municípios abrangidos: 234
- Total de constatações extraídas: 4.978
- Total constatações com recomendação: 3.383
- Total Recomendações: 4.289

Esses resultados expressam a magnitude do processo de estruturação automatizada e indicam o potencial analítico dos dados gerados para estudos futuros em auditoria governamental, transparência e avaliação de políticas públicas.

### Referências

MÜLLER, Kirill; WICKHAM, Hadley. **tibble: simple data frames**. \[S. l.: s. n.\], 2025. R package, versão 3.3.0. DOI: 10.32614/CRAN.package.tibble. Disponível em: https://CRAN.R-project.org/package=tibble. Acesso em: 2 out. 2025.

OOMS, Jeroen. **pdftools: text extraction, rendering and converting of PDF documents.** \[S. l.: s. n.\], 2025. R package, versão 3.6.0. DOI: 10.32614/CRAN.package.pdftools. Disponível em: https://CRAN.R-project.org/package=pdftools. Acesso em: 2 out. 2025.

WICKHAM, Hadley; BRYAN, Jennifer. **readxl: read Excel files**. \[S. l.: s. n.\], 2025. R package, versão 1.4.5. DOI: 10.32614/CRAN.package.readxl. Disponível em: https://CRAN.R-project.org/package=readxl. Acesso em: 10 out. 2025.

WICKHAM, Hadley et al. **Welcome to the tidyverse**. Journal of Open Source Software, \[S. l.\], v. 4, n. 43, p. 1686, 2019. DOI: 10.21105/joss.01686. Acesso em: 10 out. 2025.

