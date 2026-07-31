# Análise Recomendações DENASUS - Dados de Suporte

Este repositório contém os códigos, documentos de análise, prompts e materiais auxiliares usados no estudo sobre recomendações de auditoria do DENASUS no SUS.

## Dados

Os arquivos grandes usados no estudo não são versionados neste repositório. Eles foram depositados separadamente e podem ser baixados pelo link [https://zenodo.org/records/21711929?token=eyJhbGciOiJIUzUxMiJ9.eyJpZCI6ImRmNjc0OWY3LTk5YWYtNGJmMi04Y2YxLWE4ZTBmNDUwZDY4OCIsImRhdGEiOnt9LCJyYW5kb20iOiI5MzkyYzRmMzg3NjUzOWM1NjEzNDk4ZTM1YjIzN2UxOCJ9.HXP_0ocXnwzCw3fLuikIFDklfiEuHmvMG6I_bzA2Wwrs4mIISaKhIbfggbKixzRfeq1QOgKM8ioDP-Sz_3j7tw].

Baixe no Dataverse:

- PDFs originais dos relatórios de auditoria do DENASUS
- dataframes em formato RDS da pasta `Dados Gerados/`
- saídas intermediárias da pasta `deepseek-chat/`

Após baixar os arquivos, restaure a estrutura local esperada pelo projeto:

```text
Downloads/
Dados Gerados/
deepseek-chat/
```

Essas pastas estão no `.gitignore` de propósito. Elas devem existir localmente para reproduzir ou explorar os resultados, mas não devem ser commitadas no Git.

## Organização

- `R/`: funções e scripts em R usados no processamento e análise.
- `RPA/`: fluxo de automação usado para obtenção dos relatórios.
- `Prompts/`: prompts usados nas etapas de classificação.
- `Quarto/`: referências e configurações de renderização.
- `*.qmd`: documentos de análise e apêndices.

## Reprodução

1. Clone este repositório.
2. Baixe o dataset complementar no Dataverse.
3. Extraia ou copie os arquivos baixados para `Downloads/`, `Dados Gerados/` e `deepseek-chat/`, mantendo os nomes originais.
4. Execute os documentos ou scripts de análise a partir da raiz do repositório.

Os PDFs originais foram preservados no Dataverse porque a fonte pública consultada pode apresentar indisponibilidade ou instabilidade, o que prejudicaria a reprodução integral do estudo.
