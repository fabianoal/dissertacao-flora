# Dissertacao Flora

Este repositorio contem os codigos, documentos de analise, prompts e materiais auxiliares usados na pesquisa sobre recomendacoes de auditoria do DENASUS no SUS.

## Dados

Os arquivos grandes usados na pesquisa nao sao versionados neste repositorio. Eles foram depositados separadamente no Dataverse para preservar a reprodutibilidade sem ultrapassar os limites de tamanho do GitHub.

Baixe no Dataverse:

- PDFs originais dos relatorios de auditoria do DENASUS
- dataframes em formato RDS da pasta `Dados Gerados/`
- saidas intermediarias da pasta `deepseek-chat/`

Link do dataset:

```text
INSERIR_AQUI_O_DOI_OU_URL_DO_DATAVERSE
```

Apos baixar os arquivos, restaure a estrutura local esperada pelo projeto:

```text
Downloads/
Dados Gerados/
deepseek-chat/
```

Essas pastas estao no `.gitignore` de proposito. Elas devem existir localmente para reproduzir ou explorar os resultados, mas nao devem ser commitadas no Git.

## Organizacao

- `R/`: funcoes e scripts em R usados no processamento e analise.
- `RPA/`: fluxo de automacao usado para obtencao dos relatorios.
- `Prompts/`: prompts usados nas etapas de classificacao.
- `Quarto/`: referencias e configuracoes de renderizacao.
- `*.qmd`: documentos de analise e apendices.

## Reproducao

1. Clone este repositorio.
2. Baixe o dataset complementar no Dataverse.
3. Extraia ou copie os arquivos baixados para `Downloads/`, `Dados Gerados/` e `deepseek-chat/`, mantendo os nomes originais.
4. Execute os documentos ou scripts de analise a partir da raiz do repositorio.

Os PDFs originais foram preservados no Dataverse porque a fonte publica consultada pode apresentar indisponibilidade ou instabilidade, o que prejudicaria a reproducao integral da pesquisa.
