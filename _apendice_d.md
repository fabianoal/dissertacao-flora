# Apêndice D --- Prompt de Codificação --- Tentativa 2

### Prompt

```{txt}
O usuário é um pesquisador que está desenvolvendo uma pesquisa
sobre o potencial do Departamento Nacional de Auditoria do
Sistema Único de Saúde (DENASUS) de atuar como uma organização
capaz de gerar transformações no âmbito do SUS, através da
execução de auditorias que proponham recomendações potencialmente
capazes de influenciar mudanças no sistema de saúde.

Os resultados das auditorias realizadas pelo DENASUS são
materializados em relatórios, os quais apontam achados de
auditoria (também chamados de constatações) e que podem ensejar,
por sua vez, recomendações dirigidas aos entes auditados, caso
sejam detectadas inconformidades. As recomendações são, por
conseguinte, definidas como sugestões técnicas que visam corrigir
discrepâncias entre o que foi observado e os critérios
normativos, operacionais ou legais que embasam o trabalho de
auditoria.

O objetivo do trabalho consiste em classificar as recomendações
exaradas pelo DENASUS, segundo a tipologia difundida pelo
Institute of Internal Auditors (IIA) que distingue entre
recomendações orientadas à abordagem das causas dos problemas
identificados (cause-based) ou à condição observada
(condition-based), conforme definido a seguir:

- Recomendações com foco na causa (cause-based): são aquelas que
propõem ações necessárias para evitar que a condição ou a
observação volte a ocorrer. Normalmente envolvem soluções de
longo prazo e podem demandar mais tempo (exemplo: criação e
implementação de uma política de revisão de acessos).

- Recomendações com foco na condição (condition-based): consistem
em medidas cuja finalidade é corrigir a condição encontrada.
Fornecem uma solução temporária para corrigir a condição atual
(exemplo: remoção de acessos indevidos).

Importante: Para uma recomendação ser considerada como tendo foco
na causa (cause-based), exige-se que ela tenha como objetivo não
apenas enfrentar as causas estruturais dos problemas
identificados, de forma genérica, mas, conforme salientado na
definição expressa acima, a recomendação deve propor "ações
necessárias para evitar que a condição ou a observação volte a
ocorrer". Além disso, é preciso verificar se a solução encarnada
na recomendação tem vocação para para perdurar no tempo,
envolvendo, portanto, "soluções de longo prazo".

Recomendações centradas na condição observada (condition-based),
por sua vez, são indicativas de uma lógica institucional
preponderantemente corretiva e reativa, direcionada à resolução
de inconformidades pontuais e imediatas, com capacidade
potencialmente reduzida de induzir alterações estruturais
duradouras nos processos organizacionais do SUS, visto não se
prestarem a promover mudanças na arquitetura institucional do
sistema. Essas recomendações traduzem medidas indispensáveis à
sua manutenção e desempenho cotidiano e tendem a, quando
assimiladas pelo ente auditado, gerar impacto restrito.

Ressalta-se que o usuário pesquisador irá fornecer uma breve
descrição da finalidade do trabalho de auditoria realizado, a
constatação (ou achado de auditoria) que motivou a emissão da
recomendação e a própria recomendação. Sua função consistirá em
avaliar o foco predominante da recomendação, baseando-se, para
tanto, nas definições acima mencionadas. Por fim, estruture sua
cadeia de raciocínio executando as três etapas apontadas abaixo,
de modo sequencial:

- Critério "Causa Identificada": A recomendação identifica a
causa que levou à condição detectada?
- Critério "Ação Proposta": A recomendação traz uma sugestão de
ação a ser tomada pelo gestor objetivando mitigar o risco de
novas ocorrências da condição?
- Critério "Efeitos Duradouros": Os efeitos pretendidos da ação
proposta permanecem mesmo se os atores envolvidos mudarem?
- Critério "Ação Genérica": A ação proposta se restringe a
sugerir que o destinatário da recomendação cumpra um normativo
legal já existente?

Instruções adicionais para avaliação dos critérios.

No caso do critério "Causa Identificada", se a recomendação traz
uma ação proposta a partir da qual pode-se inferir a causa,
considere que a causa está identificada.

No caso do critério "Ação Proposta", ações que se restrinjam a
sugerir o cumprimento de um normativo já existente devem ser
consideradas como proposições.

No caso do critério "Efeitos Duradouros", o que se pretende
avaliar é se a ação proposta produz uma alteração institucional
para além dos atores específicos que estavam a atuar quando da
ocorrência da condição que motivou a recomendação.

No caso do critério "Ação Genérica", o que se pretende é
diferenciar ações que se restringem a sugerir que o destinatário
da recomendação cumpra um normativo legal já existente em
detrimento de uma proposta de ação concreta que trate a causa do
não cumprimento da norma já existente.

A cadeia de pensamento deverá constar no campo "Análise" da
resposta, que será sucedido pelos campos referentes aos critérios
delineados acima.

Formate sua resposta no format Json com a seguinte estrutura:

EXAMPLE JSON OUTPUT:

{
   "Análise": "Em relação aos efeitos, a recomendação... Ja em
   relação à ação proposta, a recomendação...",
   "Causa Identificada": "sim",
   "Ação Proposta": "sim",
   "Efeitos Duradouros": "não",
   "Ação Genérica": "sim"
}

```
### Resultados

  --------------------------------------------------------------------------------------------------------------------------------------------
  Causa Identificada          Ação Proposta               Efeitos Duradouros          Ação Genérica               Foco Causa     Total      \%
  --------------------------- --------------------------- --------------------------- --------------------------- ------------ ------- -------
  não                         não                         não                         não                         não                1    0.02

  não                         não                         não                         sim                         não              119    2.77

  não                         não                         sim                         sim                         sim                1    0.02

  não                         sim                         não                         não                         não               29    0.68

  não                         sim                         não                         sim                         não             2054   47.89

  não                         sim                         parcialmente                não                         sim                1    0.02

  não                         sim                         parcialmente                sim                         sim                2    0.05

  não                         sim                         sim                         não                         sim               22    0.51

  não                         sim                         sim                         sim                         sim              198    4.62

  não se aplica               não se aplica               não se aplica               não se aplica               não                1    0.02

  não é possível determinar   não é possível determinar   não é possível determinar   não é possível determinar   não                1    0.02

  parcialmente                sim                         não                         não                         não                2    0.05

  parcialmente                sim                         não                         sim                         não               10    0.23

  parcialmente                sim                         parcialmente                não                         sim                1    0.02

  parcialmente                sim                         parcialmente                parcialmente                sim                4    0.09

  parcialmente                sim                         parcialmente                sim                         sim                4    0.09

  parcialmente                sim                         sim                         não                         sim                5    0.12

  parcialmente                sim                         sim                         sim                         sim                5    0.12

  sim                         não                         não                         sim                         não                2    0.05

  sim                         sim                         não                         não                         não               82    1.91

  sim                         sim                         não                         sim                         não              752   17.53

  sim                         sim                         parcialmente                não                         sim                2    0.05

  sim                         sim                         parcialmente                sim                         sim                4    0.09

  sim                         sim                         sim                         não                         sim              519   12.10

  sim                         sim                         sim                         sim                         sim              445   10.38

  NA                          NA                          NA                          NA                          não               23    0.54
  --------------------------------------------------------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------
  Foco Causa                                Total                      \%
  ----------------------- ----------------------- -----------------------
  não                                        3076                      72

  sim                                        1213                      28
  -----------------------------------------------------------------------

### Listagem {#listagem-2}

#### Auditoria 19806, Constatação Nº 694420

**Finalidade**: Auditoria na PNSMAD - 2024. Verificar se a APS está exercendo as atribuições de coord. da Raps.

**Constatação**: A FMS não comprovou que as ações relacionadas à saúde mental, álcool e outras drogas na atenção básica do Plano de Ação Municipal estão alinhadas às ações do Plano de Ação Regional.

**Recomendação**: a) Elaborar Plano de Ação Municipal, previsto na Raps, em consonância com o Plano de Ação Regional e considerando ainda as especificidades locais; b) Que a FMS preste, sempre que exigida ao pessoal em exercício no SNA, toda informação necessária ao desempenho das atividades de controle, avaliação e auditoria, facilitando-lhes o acesso a documentos, pessoas e instalações, conforme o art. 11 do Decreto nº 1.651/1995.

**Análise Codificação**: A recomendação (a) propõe a elaboração de um Plano de Ação Municipal alinhado ao regional, o que sugere uma ação para evitar a repetição da falta de alinhamento, mas não identifica explicitamente a causa subjacente, como falhas na coordenação ou capacitação. A ação proposta visa mitigar o risco de novas ocorrências ao estabelecer um plano, porém seus efeitos podem ser duradouros se institucionalizados, embora dependam da implementação contínua. A ação não é genérica, pois vai além do mero cumprimento normativo ao especificar a elaboração de um plano. Já a recomendação (b) é claramente genérica, focando no cumprimento de um decreto existente sem abordar causas ou propor mudanças estruturais, sendo reativa e de efeitos limitados. Considerando o foco principal da recomendação (a) como mais relevante para a classificação, ela se aproxima de uma abordagem cause-based, mas com limitações na identificação direta da causa e na durabilidade.

- Causa Identificada: não
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: não

#### Auditoria 19399, Constatação Nº 663962

**Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil (PFPB)

**Constatação**: Registro de dispensação de medicamentos pelo Programa Farmácia Popular do Brasil sem a comprovação das aquisições por meio de notas fiscais, no período de janeiro de 2017 a março de 2020.

**Recomendação**: 1-Apresentar a documentação solicitada pelos órgãos de controle do SUS e as entidades privadas, que dele participarem de forma complementar ao pessoal em exercício no SNA toda informação necessária ao desempenho da atividade de auditoria, em observância a determinação contida no artigo 11 do Decreto Federal nº 1.651 de 28/09/1995. 2- Manter os documentos fiscais de aquisição dos medicamentos e/ou fraldas geriátricas do PFPB, por um prazo de 10 (dez) anos, com arquivamento de 2 (duas) cópias, mantidas em locais distintos, uma em meio físico e outra em arquivo digitalizado, conforme estabelecido no inciso II e § 1º do artigo 22 do Anexo LXXVII da Portaria de Consolidação GM/MS nº 5 de 28/09/2017, alterado pelo artigo 1º da Portaria GM/MS nº 2898 de 03/11/2021. 3- Comercializar e dispensar medicamentos e/ou fraldas geriátricas em observância às regras de execução do Programa Farmácia Popular do Brasil, a fim de não incorrer em práticas irregulares, conforme inciso I do artigo 37 do Anexo LXXVII da Portaria de Consolidação GM/MS nº 5 de 28/09/2017, alterado pelo artigo 1º da Portaria GM/MS nº 2898 de 03/11/2021.

**Análise Codificação**: A recomendação é composta por três itens distintos. O primeiro item trata da apresentação de documentação solicitada por órgãos de controle, focando em cumprir exigências legais existentes sem propor ações específicas para evitar a causa da falta de documentação. O segundo item estabelece procedimentos de arquivamento de documentos fiscais, que embora possa ter efeitos duradouros ao instituir uma prática organizacional, não aborda diretamente as causas da não comprovação das aquisições. O terceiro item recomenda a observância das regras do programa, sendo uma ação genérica de cumprimento normativo. Em conjunto, as recomendações priorizam a correção da condição atual (falta de documentação) e o cumprimento de normas, sem propor ações claras para evitar a reincidência ao enfrentar causas subjacentes, como falhas em processos de aquisição ou controle interno.

- Causa Identificada: não
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: sim

#### Auditoria 19508, Constatação Nº 669076

**Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil/PFPB

**Constatação**: Falta de apresentação das cópias dos cupons vinculados e prescrições médicas solicitados no período de 1º/1/2015 a 17/12/2019.

**Recomendação**: Devolver ao Fundo Nacional de Saúde o valor de R\$ 12,00 (doze reais), conforme detalhado no Anexo IV deste relatório, com a devida correção a partir da data constante das Proposições de Devolução. Prestar, quando exigida, ao pessoal em exercício no Sistema Nacional de Auditoria (SNA), toda informação necessária ao desempenho das atividades de controle, avaliação e auditoria, facilitando-lhes o acesso a documentos, pessoas e instalações, em observância à determinação contida no artigo 11 do Decreto Federal nº 1.651 de 28/09/1995. Manter, por 10 (dez) anos as vias assinadas dos cupons vinculados, do documento fiscal, da prescrição, laudo ou atestado médico e do documento de identidade oficial apresentado no ato da compra, em ordem cronológica de emissão, com arquivamento em locais distintos, de 2 (duas) cópias, uma em meio físico e outra em arquivo digitalizado, conforme estabelecido no § 2º do artigo 21 combinado com o artigo 22, do Anexo LXXVII da Portaria de Consolidação GM/MS nº 5 de 28/09/2017, alterada pela Portaria GM/MS nº 2.898, de 26/10/2021.

**Análise Codificação**: A recomendação é composta por três ações distintas: (1) devolução de valores, (2) prestação de informações ao SNA, e (3) manutenção de documentação por 10 anos. Em relação ao critério 'Causa Identificada', a recomendação não explicita a causa da falta de apresentação dos documentos, limitando-se a propor ações corretivas e preventivas. Quanto à 'Ação Proposta', a recomendação sugere medidas específicas, incluindo a devolução de valores e a manutenção de documentos, mas não aborda diretamente a prevenção de novas ocorrências da condição inicial. Sobre 'Efeitos Duradouros', a ação de manter documentação por 10 anos pode ter efeitos prolongados, mas as demais ações são pontuais ou reativas. No critério 'Ação Genérica', a recomendação inclui referências a normativos legais existentes, como o Decreto Federal e a Portaria GM/MS, indicando que parte das ações se restringe ao cumprimento de normas pré-estabelecidas, sem propor soluções inovadoras para as causas subjacentes.

- Causa Identificada: não
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: sim

#### Auditoria 19591, Constatação Nº 682488

**Finalidade**: Verificar a implementação da Política Nac. de Atenção ao Portador de Doença Renal. Estágios 4 e 5

**Constatação**: A gestão estadual não cumpre adequadamente as responsabilidades previstas na Assistência Farmacêutica Especializada ao portador de Doença Renal Crônica (DRC), com foco no estágio 5-D, no que se refere a programação, aquisição e disponibilização de medicamentos. (Continuação da constatação n.º 677630).

**Recomendação**: Recomendação descrita na Constatação n.° 677630.

**Análise Codificação**: A recomendação não foi fornecida explicitamente, apenas referenciada a partir de outra constatação. Sem o conteúdo específico da recomendação, não é possível avaliar se ela identifica a causa, propõe ações para evitar recorrências, tem efeitos duradouros ou se é genérica. Portanto, todos os critérios são considerados não aplicáveis.

- Causa Identificada: não se aplica
- Ação Proposta: não se aplica
- Efeitos Duradouros: não se aplica
- Ação Genérica: não se aplica

#### Auditoria 19590, Constatação Nº 684816

**Finalidade**: Verificar a implementação da Pol. Nac. ao Portador de Doença Ren. Crônica, nos estágios 4 e 5 em TRS

**Constatação**: O setor de hemodiálise do Sistema de Assistência Social e de Saúde (SAS) não atendeu aos parâmetros estabelecidos pela Vigilância Sanitária, quanto à manutenção da estrutura física. (Continuação da constatação n.° 684813)

**Recomendação**: Recomendação descrita na Constatação n.° 684813.

**Análise Codificação**: A recomendação não foi fornecida explicitamente, sendo apenas referenciada como 'Recomendação descrita na Constatação n.° 684813'. Sem o conteúdo específico da recomendação, não é possível avaliar se ela identifica a causa da condição (manutenção inadequada da estrutura física), se propõe ações para evitar recorrências, se gera efeitos duradouros ou se é uma ação genérica. Portanto, todos os critérios não podem ser determinados com base nas informações disponíveis.

- Causa Identificada: não é possível determinar
- Ação Proposta: não é possível determinar
- Efeitos Duradouros: não é possível determinar
- Ação Genérica: não é possível determinar

#### Auditoria 19657, Constatação Nº 685645

**Finalidade**: Auditoria no PREVINE - PAA/2024

**Constatação**: O Município de Novo Airão não comprovou ao menos uma das ações propostas previstas na NOTA TÉCNICA Nº 15/2022-SAPS/MS, referente ao indicador 3 - Proporção de gestantes com atendimento odontológico.

**Recomendação**: Desenvolver ações e estratégias para melhorias do Indicador nº 3, conforme Nota Técnica nº 15/2022-SAPS/MS, tais como: Realizar marcação de consulta com a Equipe de saúde bucal no momento da confirmação da gestação, manter vaga aberta na agenda para consulta e criar canal de comunicação direto entre as equipes para verificar o encaminhamento e retorno mesmo que ambas as equipes estejam no mesmo ambiente físico.

**Análise Codificação**: A recomendação propõe ações específicas para melhorar o indicador de atendimento odontológico a gestantes, incluindo marcação de consulta na confirmação da gestação, manutenção de vagas na agenda e criação de canal de comunicação entre equipes. Embora identifique parcialmente causas relacionadas à falta de integração entre serviços e dificuldades de acesso, as ações focam principalmente na correção imediata da condição observada (baixa proporção de atendimento), sem abordar explicitamente causas estruturais como capacitação de profissionais ou alocação de recursos. Os efeitos das ações propostas dependem da continuidade das práticas pelos atores atuais, sem garantir mudanças institucionais duradouras se houver rotatividade. A recomendação vai além de simplesmente sugerir o cumprimento da nota técnica, propondo medidas operacionais concretas.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: não

#### Auditoria 19683, Constatação Nº 696741

**Finalidade**: Realizar auditoria no Convênio 878444/2018 com a Santa Casa de Misericórdia de Sabará

**Constatação**: Impropriedades relacionadas ao acompanhamento e ao monitoramento das ações do Subeixo Educação Permanente.

**Recomendação**: Determinar às unidades de acompanhamento que elaborem relatórios mensais com base nas informações fidedignas relacionadas nos mapas de produção, atas das reuniões e listas de presença apresentados; e adotando medidas de natureza preventiva ou corretiva na hipótese do não cumprimento do disposto no objeto do convênio e/ou Plano de Ação, atendendo à Portaria de Consolidação Sesai/MS nº 1 /2020, especificamente os §§3º e 4º do art. 4º; inciso VI do art. 11; inciso V e parágrafo único do art. 12; e incisos I e II do art. 14.

**Análise Codificação**: A recomendação determina que as unidades de acompanhamento elaborem relatórios mensais baseados em documentos específicos e adotem medidas preventivas ou corretivas em caso de não cumprimento do convênio, referenciando dispositivos legais. Quanto à 'Causa Identificada', a recomendação não explicita a causa raiz da impropriedade no acompanhamento, como falta de capacitação ou recursos, mas foca na ação de elaborar relatórios, que pode inferir uma causa relacionada à falta de monitoramento sistemático. Para 'Ação Proposta', a recomendação sugere ações concretas (elaborar relatórios e adotar medidas), embora parte dela se baseie em cumprir normativos existentes. Sobre 'Efeitos Duradouros', a ação de elaborar relatórios mensais pode criar um processo contínuo, mas depende da adesão dos atores atuais, não garantindo mudanças institucionais permanentes se houver rotatividade. Em relação à 'Ação Genérica', a recomendação inclui referências a portarias existentes, mas vai além ao propor a elaboração de relatórios e medidas específicas, não se restringindo apenas ao cumprimento genérico de normas.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: não

#### Auditoria 19613, Constatação Nº 677735

**Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena

**Constatação**: Impropriedades relacionadas aos relatórios mensais de acompanhamento do Eixo de Atenção à Saúde Indígena.

**Recomendação**: Determinar às unidades de acompanhamento que elaborem relatórios mensais com base nas informações fidedignas relacionadas nos mapas de produção, atas das reuniões e listas de presença apresentados; e adotando medidas de natureza preventiva ou corretiva na hipótese do não cumprimento do disposto no objeto do convênio e/ou Plano de Ação, atendendo à Portaria de Consolidação Sesai/MS nº 1 /2020, especificamente os §§ 3º e 4º do art. 4º; inciso VI do art. 11; inciso V e parágrafo único do art. 12; e incisos I e II do art. 14.

**Análise Codificação**: A recomendação propõe que as unidades de acompanhamento elaborem relatórios mensais com base em informações fidedignas e adotem medidas preventivas ou corretivas em caso de não cumprimento do convênio, referenciando dispositivos legais específicos. Em relação ao critério 'Causa Identificada', a recomendação não explicita claramente a causa das impropriedades nos relatórios, mas sugere ações que podem inferir causas como falta de base em informações confiáveis ou ausência de medidas de controle. Quanto à 'Ação Proposta', a recomendação sugere ações específicas (elaborar relatórios com base em documentos e adotar medidas), mas estas se limitam a cumprir normativos já existentes, sem propor mudanças estruturais para evitar recorrências. Sobre 'Efeitos Duradouros', as ações propostas dependem da atuação contínua das unidades e não criam mudanças institucionais permanentes que persistam independentemente dos atores. Por fim, em 'Ação Genérica', a recomendação se baseia em citar dispositivos legais preexistentes, sem inovar em soluções para as causas subjacentes.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19616, Constatação Nº 676228

**Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena

**Constatação**: Impropriedades relacionadas ao acompanhamento mensal do Eixo de Atenção à Saúde Indígena.

**Recomendação**: Determinar ao DSEI realizar a conferência da documentação comprobatória/complementar inserida no Transferegov a fim de evitar manutenção de informações incorretas no sistema, cumprindo o exposto no inciso IV, art. 11, da Portaria de Consolidação nº 1 SESAI/MS/2020.

**Análise Codificação**: A recomendação propõe que o DSEI realize a conferência da documentação comprobatória/complementar inserida no Transferegov para evitar manutenção de informações incorretas no sistema, cumprindo a Portaria de Consolidação nº 1 SESAI/MS/2020. Em relação ao critério 'Causa Identificada', a ação de conferir a documentação sugere que a causa da condição (informações incorretas no sistema) está relacionada à falta de verificação adequada, embora não explicite a causa raiz. Para o critério 'Ação Proposta', a recomendação sugere uma ação específica (conferir documentação) que visa mitigar o risco de novas ocorrências. No critério 'Efeitos Duradouros', a ação proposta depende da execução contínua pelos atores atuais e não estabelece mudanças institucionais permanentes que persistam independentemente de mudanças de pessoal. Quanto ao critério 'Ação Genérica', a recomendação se baseia no cumprimento de um normativo legal existente (Portaria de Consolidação), sem propor ações adicionais para tratar a causa subjacente do não cumprimento.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19627, Constatação Nº 685176

**Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena.

**Constatação**: Incompletude e inconsistências nas informações encontradas nos relatórios mensais de acompanhamento do Eixo Controle Social e os respectivos documentos de suporte.

**Recomendação**: À Sesai: Determinar às unidades de acompanhamento que: (i) elaborem relatórios mensais com base nas informações, mapas de produção, atas das reuniões e listas de presença enviados pelas unidades de acompanhamento do Dsei Litoral Sul, devendo ser inseridos no Transferegov até o dia 20 do mês subsequente ao mês acompanhado; (ii) e adotem medidas de natureza preventiva ou corretiva na hipótese do não cumprimento do disposto no objeto do convênio e/ou Plano de Trabalho, atendendo à Portaria de Consolidação Sesai/MS nº 1 /2020, especificamente os §§3º e 4º do art. 4º; inciso VI do art. 11; inciso V e parágrafo único do art. 12; e incisos I e II do art. 14.

**Análise Codificação**: A recomendação propõe ações específicas para lidar com a incompletude e inconsistências nos relatórios mensais, focando na correção imediata da condição observada. Ela identifica parcialmente a causa ao sugerir a elaboração de relatórios baseados em documentos específicos e a adoção de medidas preventivas ou corretivas, mas não aborda explicitamente as causas subjacentes, como falta de capacitação ou recursos. A ação proposta é direcionada a mitigar o risco de novas ocorrências, porém os efeitos não são claramente duradouros, pois dependem da adesão contínua dos atores atuais. Além disso, a recomendação se baseia em normativos existentes, como a Portaria de Consolidação Sesai/MS nº 1/2020, sem propor inovações estruturais.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19648, Constatação Nº 685881

**Finalidade**: Avaliar os indicadores de desempenho do programa Previne Brasil no município de Lindoeste/PR.

**Constatação**: O município não disponibilizou documentação comprobatória de adoção de ao menos uma das ações propostas na Nota Técnica n.°22/2022-SAPS/MS, referente ao indicador 5 - Cobertura vacinal de Poliomielite inativada e de Pentavalente, no exercício de 2022.

**Recomendação**: 1. Monitorar permanentemente o cadastro individual completo e mantê-lo atualizado, incluindo dados sociodemográficos e de condições e situações de saúde, estabelecendo uma rotina de acompanhamento das Cadernetas da Criança, tanto na aplicação do calendário vacinal (incluindo as vacinas de campanha) quanto de registros anteriores de vacinação no prontuário do cidadão, como definido no Item 5 da Nota Técnica Nº 22/2022- SAPS/MS. 2. Registrar de forma individualizada em sistema próprio de prontuário eletrônico as doses das vacinas aplicadas de acordo com as especificações do Guia de Qualificação THRIFT.

**Análise Codificação**: A recomendação propõe ações para corrigir a condição específica de falta de documentação comprobatória das ações da Nota Técnica, focando na implementação de processos de monitoramento e registro. Embora identifique parcialmente a causa (falta de rotina de acompanhamento), a ação proposta é genérica, limitando-se a sugerir o cumprimento de normativos existentes (Nota Técnica e Guia THRIFT) sem abordar causas estruturais subjacentes, como capacitação ou recursos. Os efeitos dependem da continuidade dos processos por atores específicos, sem alterações institucionais duradouras que persistam independentemente de mudanças na equipe.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19768, Constatação Nº 693416

**Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.

**Constatação**: A CMRF não realiza manutenção preventiva, corretiva, preditiva e qualificação térmica nos equipamentos.

**Recomendação**: Adotar as seguintes medidas visando atender o estabelecido nas alíneas b e c, do Inciso II, do Art. 7º, da Seção I, Capítulo II, da Resolução, e no Inciso IX, do Art. 23, da Seção III, Capítulo II, da Resolução - RDC nº 63, de 25/11/2011; no Inciso XXIII, do Art. 3º; no Inciso XI, do Art. 18, Seção III, e no § 4º, do Art. 43, da Seção IV, da Resolução de Diretoria Colegiada - RDC nº 430, de 08/10/2020; bem como nos Subitens 5.5 e 5.6, Item 5, páginas 37/38, e nos Subitens 6.13 e 6.14, Item 6, páginas 63 a 65, do Manual de Rede Frio do PNI, 2017: - Elaborar um cronograma para a realização das manutenções preventivas nos equipamentos da CMRF, a fim de assegurar a sua integridade e funcionamento contínuo; - Executar regularmente a qualificação térmica dos equipamentos para verificar a homogeneidade térmica destes e das áreas de temperatura controlada, garantindo condições adequadas de armazenamento e transporte de imunobiológicos da CMRF; - Realizar a calibração dos equipamentos antes do primeiro uso e em intervalos definidos, a fim de assegurar o seu correto funcionamento; e - Implementar rotina diária de conferência das condições do ambiente, de modo a garantir que a temperatura e umidade sejam mantidas dentro dos parâmetros exigidos para melhorar a eficácia dos imunobiológicos.

**Análise Codificação**: A recomendação apresenta medidas específicas para corrigir a condição de falta de manutenção e qualificação térmica nos equipamentos da CMRF. Embora identifique parcialmente as causas ao propor ações como elaboração de cronograma e implementação de rotinas, as ações são predominantemente focadas na correção imediata da condição observada. A recomendação se baseia no cumprimento de normativos já existentes e não propõe mudanças estruturais que alterem processos organizacionais de forma duradoura, mantendo-se no âmbito da conformidade com regulamentos previamente estabelecidos.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19834, Constatação Nº 701470

**Finalidade**: Realizar auditoria financeira e administrativa no Hospital de Cataguases/Sta Casa de Misericórdia

**Constatação**: Os indicadores hospitalares referentes às taxas de ocupação e de Parto Cesariano do Hospital de Cataguases não estão sendo monitorados efetivamente em conformidade com as configurações estabelecidas pelos Ministério da Saúde e por órgãos reguladores.

**Recomendação**: Cumprir as diretrizes estabelecidas pela Portaria nº 306, de 28 de março de 2016, e em consonância com as boas práticas obstétricas preconizadas pelo Ministério da Saúde, como previsto na Portaria GM/MS nº 1.459, de 24 de junho de 2011, que institui a Rede Cegonha, e na Portaria GM/MS nº 5.350, de 12 de setembro de 2024, que implementa a Rede Alyne. Adotar um modelo de atenção obstétrica pautado na integralidade do cuidado à mulher e à criança, valorizando o parto normal, com foco na humanização da assistência e na segurança da gestante e do recém-nascido e ações alinhadas com essas diretrizes e outras iniciativas do SUS que promovem a redução de cesarianas desnecessárias, torna-se essencial a realização de diagnóstico das causas do aumento de partos cesáreos no hospital, promovendo também ações de sensibilização. No que se refere à taxa de ocupação hospitalar, cumprir a Política Nacional de Atenção Hospitalar (PNHOSP), instituída pela Portaria de Consolidação nº 2, de 28 de setembro de 2017, que orienta sobre a otimização da capacidade instalada, qualificação do cuidado e uso racional dos recursos públicos. Nesse contexto, deve-se implantar um sistema de monitoramento efetivo da taxa de ocupação dos leitos, mantendo-se entre 75% e 85%, conforme parâmetros da Agência Nacional de Saúde Suplementar (ANS) e da PNHOSP- Política Nacional de Atenção Hospitalar. Por fim, recomenda-se a elaboração de um Planejamento Estratégico que contenha diretrizes, objetivos e metas para nortear ações que solucionem as fragilidades identificadas, promovendo a efetividade da gestão hospitalar por meio de medidas corretivas que otimizem a utilização dos leitos e contribuam para a redução da elevada taxa de cesáreas, em conformidade com os normativos vigentes.

**Análise Codificação**: A recomendação apresenta elementos mistos. Em relação à taxa de ocupação, propõe a implantação de um sistema de monitoramento específico e a manutenção de parâmetros definidos, o que sugere uma ação concreta, mas ainda focada na condição observada de falta de monitoramento. Para a taxa de parto cesariano, além de cumprir diretrizes existentes, inclui a realização de diagnóstico das causas do aumento e ações de sensibilização, indicando um esforço para abordar causas subjacentes. No entanto, a ênfase principal recai sobre o cumprimento de normativos já estabelecidos e a elaboração de um planejamento estratégico genérico, sem detalhar ações específicas para modificar processos ou estruturas de forma duradoura. Os efeitos propostos dependem da implementação contínua de monitoramento e sensibilização, mas não claramente de mudanças institucionais permanentes independentes de atores específicos.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19855, Constatação Nº 701834

**Finalidade**: Verificar a gestão e o gerenciamento dos Centros de Referência em Saúde do Trabalhador - CERESTs

**Constatação**: O Conselho Municipal de Saúde (CMS) de Maricá/RJ não realizou a fiscalização dos recursos repassados pelo Ministério da Saúde (MS) para custear às ações de manutenção do CEREST Regional Maricá/RJ nos anos de 2023 e 2024.

**Recomendação**: 1- Aprimorar os Relatórios Anuais de Gestão (RAG), de forma a garantir a plena evidência da aplicação dos recursos recebidos para o CEREST, conforme previsto no Art. 25 do Anexo X da Portaria de Consolidação GM/MS nº 3/2017. 2- Dar ciência ao Conselho Municipal de Saúde acerca da obrigatoriedade de fiscalizar os recursos repassados pelo Fundo Nacional de Saúde para o Fundo Municipal de Saúde no bloco de gestão do SUS e no bloco de financiamento da média e alta complexidade, conforme preconizado no § 2º, Art. 1097, Capítulo V, da Portaria de Consolidação MS/GM 06, de 28/09/2017.

**Análise Codificação**: A recomendação possui dois componentes distintos. O primeiro componente ('Aprimorar os Relatórios Anuais de Gestão') foca na melhoria documental para evidenciar a aplicação de recursos, o que pode ser considerado uma ação que trata parcialmente a causa (falta de transparência/evidência), mas não necessariamente impede a reocorrência da falta de fiscalização. O segundo componente ('Dar ciência ao Conselho Municipal de Saúde acerca da obrigatoriedade de fiscalizar') é essencialmente uma ação de comunicação sobre uma obrigação legal preexistente, sem propor mecanismos concretos para garantir que a fiscalização ocorra efetivamente. Ambos os componentes têm efeitos que dependem da continuidade das ações dos atores envolvidos (melhoria contínua dos relatórios e manutenção da comunicação), mas não estabelecem mudanças estruturais permanentes. A recomendação como um todo se baseia fortemente em citar normativos já existentes, sem propor soluções inovadoras ou específicas para as causas profundas da não fiscalização.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19857, Constatação Nº 702619

**Finalidade**: Verificar a regularidade da execução da emenda parlamentar federal nº 3630007.

**Constatação**: Realização de transações bancárias sem a devida comprovação por notas fiscais.

**Recomendação**: 1. Realizar, durante prestação de contas, a conciliação bancária de todas as transações bancárias identificadas na auditoria com as suas respectivas notas fiscais de modo a estabelecer nexo de causalidade entre as despesas pagas e o serviço executado, segundo Acórdão TCU nº 2164/2022 - Plenário. 2. Estabelecer controles financeiros a ações correlatas de saúde realizadas via incremento temporário por Termo de Fomento/Cooperação ou similar confrontando, minimamente a execução física dos itens contratados com a apresentação de notas fiscais dos itens de maior valor, conforme Art. 39 do Decreto GDF n.º 37.843 de 13/12/2016. 3. Providenciar a devolução ao Fundo Nacional de Saúde, consoante Item 9.3.3 do Acórdão/TCU n.º 1.072/2017/Plenário, de todas as transações bancárias que não puderem ser comprovadas por meio de notas fiscais (R\$ 3.306.245,50) ou que não haja nexo de causalidade entre as despesas pagas e o serviço executado, segundo Acórdão TCU nº 2164/2022 - Plenário.

**Análise Codificação**: A recomendação aborda três ações distintas. A primeira ação propõe conciliação bancária para estabelecer nexo causal, focando na correção da condição atual de falta de comprovação. A segunda ação sugere estabelecer controles financeiros confrontando execução física com notas fiscais, o que pode inferir uma causa relacionada à falta de controles preventivos, mas a ação é genérica ao referir-se a normativos existentes e não especifica mudanças estruturais duradouras. A terceira ação trata da devolução de valores não comprovados, sendo claramente corretiva e pontual. No geral, as ações são predominantemente reativas, voltadas para resolver a condição imediata de irregularidades, sem propor medidas específicas e duradouras para evitar a recorrência, como a implementação de sistemas ou políticas permanentes de controle.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19877, Constatação Nº 703161

**Finalidade**: Verificar a regularidade da produção nos sistemas de informação (SIA/SIH) em oncologia

**Constatação**: Houve cobrança irregular de procedimentos cirúrgicos sob o código 04.15.02.005-0 - Procedimentos Sequenciais em Oncologia - no HSJ.

**Recomendação**: - Estabelecer mecanismos eficazes de monitoramento, avaliação e fiscalização das Unidades de média e alta complexidade em oncologia, conforme o estabelecido no Inciso l, Artigo 15 da Lei nº 8080/ 1990. -Proceder perícia pós-operatória de AIH com cobrança do procedimento 04.15.02.005-0 - procedimentos sequenciais em oncologia, conforme recomendado no Manual de Bases Técnicas da Oncologia (2022). - Dar ciência aos responsáveis pela irregularidade apontada nesta constatação para ressarcimento junto ao FNS no valor de R\$ 38.465,02 (trinta e oito mil, quatrocentos e sessenta e cinco reais e dois centavos), atualizado monetariamente e com os acréscimos legais adotados por esse ente federado, conforme indicativo do Anexo X - Planilha de Débito e no Capítulo Proposição da Devolução deste relatório, com base no item 9.3.3, do Acórdão TCU n.º 1072/2017, que prevê: tratando-se de débito decorrente de dano ao erário propriamente dito, cabe ao gestor responsável pela irregularidade a obrigação de devolver os recursos, visto que, nessas situações, não há evidências de que eles tenham sido aplicados em prol de alguma finalidade pública, devendo a recomposição ser feita ao Fundo Nacional de Saúde (FNS), em respeito ao disposto no art. 2º, inciso VII, do Decreto 3.964/2001 combinado com o art. 33, § 4º, da Lei 8.080/1990;. e o Acórdão TCU nº 2079/2023 -Segunda Câmara (itens 33.1.5 e 33.1.1.8), que diz: Portanto, além dos gestores públicos ora responsabilizados, somente a entidade privada deve responder pelo prejuízo aos cofres do Fundo Nacional de Saúde decorrentes das cobranças e consequentes pagamentos indevidos.

**Análise Codificação**: A recomendação apresenta três ações distintas. A primeira ação propõe estabelecer mecanismos de monitoramento, avaliação e fiscalização, o que sugere uma abordagem preventiva para evitar a reincidência da irregularidade, identificando implicitamente a causa como falhas nos sistemas de controle. A segunda ação, realizar perícia pós-operatória, é uma medida corretiva pontual para a condição específica. A terceira ação, dar ciência para ressarcimento, é uma medida reparatória imediata. Considerando o conjunto, a recomendação tem elementos de ambas as abordagens, mas a ação de estabelecer mecanismos de monitoramento atende parcialmente aos critérios de causa, pois propõe uma ação para mitigar riscos futuros, embora não especifique claramente as causas estruturais. Os efeitos duradouros são limitados, pois as ações não alteram profundamente a estrutura institucional, e há uma ação genérica que se baseia no cumprimento de normativos existentes.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19885, Constatação Nº 702631

**Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS

**Constatação**: A data de autorização de tratamento clínico em oncologia, no instrumento Autorização de Procedimento Ambulatorial de Alto Custo - APAC, é posterior à data do início do tratamento em oncologia.

**Recomendação**: Alinhar os procedimentos de forma que os procedimentos sejam previamente aprovados, conforme preconizado nos dispositivos legais que regem o tratamento oncológico no SUS ''Manual Técnico Operacional do SIA/SUS, versão agosto de 2016, pág.19'' que informa quanto à necessidade de autorização prévia para procedimentos registrados em APACs. Ainda, garantir que o prontuário seja documento único, completo, com toda a história clínica em completude, identificação do paciente, assinatura, data e registro dos multiprofissionais, em ordem cronológica, no formato físico e/ou digital conforme disposto artigo 87 do Código de Ética Médica além da a Lei Nº 13.787, de 27 de dezembro de 2018 que dispõe sobre a digitalização e a utilização de sistemas informatizados para a guarda, o armazenamento e o manuseio de prontuário de paciente.

**Análise Codificação**: A recomendação aborda duas questões distintas: a primeira refere-se ao alinhamento dos procedimentos para garantir aprovação prévia de tratamentos oncológicos, conforme exigido pelo Manual Técnico Operacional do SIA/SUS; a segunda trata da completude e organização do prontuário do paciente, com base no Código de Ética Médica e na Lei Nº 13.787/2018. Em relação à primeira parte, a recomendação identifica que a causa da inconformidade (data de autorização posterior ao início do tratamento) é a falta de aprovação prévia, propondo uma ação para alinhar os procedimentos a esse requisito. No entanto, a ação proposta é genérica, limitando-se a sugerir o cumprimento de normativos já existentes, sem especificar medidas concretas para assegurar que a aprovação seja sempre prévia (como implementação de controles ou fluxos específicos). Quanto aos efeitos duradouros, a ação de 'alinhar procedimentos' pode ter caráter permanente se institucionalizada, mas a falta de detalhamento torna essa avaliação incerta. Na segunda parte, a recomendação foca na condição observada (prontuário incompleto ou desorganizado), propondo ações corretivas imediatas (garantir que o prontuário seja único, completo, etc.), mas sem abordar as causas subjacentes para a não conformidade com a lei (como falta de treinamento ou recursos). A ação aqui também é genérica, baseada em cumprir normativos, e os efeitos dependem da adesão contínua dos profissionais, não sendo necessariamente duradouros se os atores mudarem. No geral, a recomendação tem um foco misto, mas predominante na condição, pois as ações propostas são corretivas e reativas, visando resolver as inconformidades pontuais sem abordar sistematicamente as causas profundas para evitar recorrências.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: não
- Ação Genérica: sim

#### Auditoria 19776, Constatação Nº 692041

**Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.

**Constatação**: O Programa Municipal de Imunização de Macaé/RJ não realiza manutenção nos equipamentos e não estabelece cronograma que demonstre a periodicidade das manutenções.

**Recomendação**: Realizar a manutenção nos equipamentos e estabelecer cronograma que demonstre a periodicidade das manutenções para garantir o correto funcionamento dos equipamentos. Para tal, deverá estabelecer contrato com o objetivo de garantir a prestação do serviço de calibração e qualificação dos equipamentos da Rede de Frio, conforme disposto nos Subitens 5.5 Manutenção e 5.6 Programação de Manutenção, Item 5, e Subitens 6.13 Orientação: Manutenção dos Equipamentos e 6.14 Equipamentos de Infraestrutura e Segurança, Item 6, do Manual de Rede Frio do Programa Nacional de Imunização (2017); no Inciso IX, do Art. 23, da Seção III, Capítulo II, da Resolução - RDC Nº 63, de 25/11/2011, bem como no § 4º, Art. 43 , Seção IV, Resolução de Diretoria Colegiada - RDC Nº 430, de 08/10/2020.

**Análise Codificação**: A recomendação propõe ações para corrigir a condição identificada de falta de manutenção nos equipamentos e ausência de cronograma de manutenções. No critério 'Causa Identificada', a recomendação não identifica explicitamente a causa raiz do problema (como falta de recursos, capacitação ou processos), mas a ação proposta de estabelecer contrato para serviços de calibração e qualificação sugere uma causa subjacente de falta de estrutura contratual. No critério 'Ação Proposta', a recomendação sugere ações específicas (realizar manutenção, estabelecer cronograma e contrato) que visam mitigar a reincidência da condição. No critério 'Efeitos Duradouros', a ação de estabelecer um cronograma e contrato pode criar uma estrutura permanente, mas depende da continuidade do contrato e adesão ao cronograma, não sendo totalmente independente de mudanças de atores. No critério 'Ação Genérica', a recomendação vai além de simplesmente citar normativos, propondo ações concretas como estabelecer contrato e cronograma, embora ainda se baseie em conformidade com normas preexistentes.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: não

#### Auditoria 19710, Constatação Nº 696287

**Finalidade**: Verificar a regularidade da produção inserida nos sistemas do SUS.

**Constatação**: A Sesa/ES não realizou atividades de fiscalização, monitoramento, avaliação e auditoria no serviço de oftalmologia eletiva do HMCB, entre 2022 e 2024.

**Recomendação**: Realizar o acompanhamento e a fiscalização do serviço de oftalmologia eletivo prestado pela empresa 20/20 Serviços Médicos S/S no HMCB, por meio de representante designado pela Administração, que deverá registrar ocorrências e adotar medidas corretivas para falhas identificadas, conforme previsto no Art. 67 da Lei 8.666/1993 e no Art. 117 da Lei 14.133/2021. Dessa forma, o acompanhamento e a fiscalização não apenas contribuem para a melhoria dos serviços prestados à população, mas também reforçam a responsabilidade da Administração Pública em zelar pela boa aplicação dos recursos e pelo cumprimento das normas legais. Determinar à empresa contratada a elaboração e adoção de rotinas e normas escritas, atualizadas, assinadas pelo responsável técnico e aprovadas pelo contratante, para assegurar a execução consistente, segura e eficiente das atividades, em atendimento ao disposto no item 3.2 do Anexo I da Portaria MS/SAS nº 288/2008.

**Análise Codificação**: A recomendação propõe duas ações principais: (1) realizar acompanhamento e fiscalização do serviço com registro de ocorrências e adoção de medidas corretivas, e (2) determinar à empresa contratada a elaboração e adoção de rotinas e normas escritas. Em relação ao critério 'Causa Identificada', a recomendação não explicita claramente a causa da falta de fiscalização (como falta de recursos, capacitação ou definição de responsabilidades), mas a ação de criar rotinas e normas sugere que a causa subjacente pode ser a ausência de procedimentos formais. Quanto à 'Ação Proposta', ambas as ações são sugeridas para mitigar riscos futuros, indo além da mera correção pontual. Sobre 'Efeitos Duradouros', a criação de rotinas e normas institucionaliza processos, podendo perdurar com mudanças de atores, enquanto o acompanhamento contínuo depende de designação específica. No critério 'Ação Genérica', a primeira ação referencia leis existentes (Lei 8.666/1993 e Lei 14.133/2021), sendo genérica ao sugerir cumprimento normativo, mas a segunda ação, embora baseada na Portaria MS/SAS nº 288/2008, especifica a elaboração de rotinas, o que é mais concreto.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: parcialmente

#### Auditoria 19855, Constatação Nº 701796

**Finalidade**: Verificar a gestão e o gerenciamento dos Centros de Referência em Saúde do Trabalhador - CERESTs

**Constatação**: O CEREST Regional Maricá/RJ não acompanha, monitora e avalia os resultados relacionados à saúde do trabalhador dos anos de 2023 e 2024.

**Recomendação**: 1 - Assegurar que todas as áreas de saúde compreendidas na PNSTT (promoção, vigilância e atenção básica) estejam inseridas no Plano Municipal de Saúde (PMS) e nas Programações Anuais de Saúde (PAS), acompanhadas das suas respectivas ações, metas e indicadores, atendendo o Inciso I, Paragráfo Único, Art 19, Capítulo II, Anexo X, da Portaria de Consolidação GM/MS n°3, de 28/9/2017; 2 - Implementar metodologia de acompanhamento e avaliação das ações de saúde do trabalhador, com definição de metas, indicadores de desempenho e periodicidade de monitoramento, de forma a permitir a análise dos resultados obtidos e a melhoria contínua das ações executadas pelo CEREST Regional Maricá/RJ, atendendo assim os Incisos I, III, Art. 18, Seção II, Capitulo IV, Título II da Lei n.º 8.080/1990 (Lei Orgânica da Saúde) e Alíneas e, g, do Inciso I, Art. 9º, Capítulo III, do Anexo XV da Portaria de Consolidação GM/MS n.º 2, de 28/9/2017.

**Análise Codificação**: A recomendação é composta por duas partes. A primeira parte (1) visa assegurar que as áreas de saúde do trabalhador estejam inseridas no Plano Municipal de Saúde e nas Programações Anuais de Saúde, com ações, metas e indicadores, referenciando normativos específicos. Esta ação está focada em corrigir a condição atual de ausência desses elementos nos documentos de planejamento, sendo uma medida corretiva e reativa para atender a exigências legais preexistentes. A segunda parte (2) propõe a implementação de uma metodologia de acompanhamento e avaliação com definição de metas, indicadores e periodicidade, referenciando leis e portarias. Esta ação busca estabelecer um processo estruturado e contínuo para monitorar os resultados, o que pode ser visto como uma medida para evitar a recorrência da condição identificada (falta de acompanhamento), promovendo uma mudança institucional duradoura. No critério 'Causa Identificada', a recomendação não explicita claramente a causa da falta de acompanhamento, mas a ação proposta na parte 2 implica a necessidade de um sistema formal, sugerindo uma causa subjacente relacionada à falta de processos estruturados. No critério 'Ação Proposta', ambas as partes sugerem ações específicas, embora a parte 1 seja mais genérica ao exigir cumprimento normativo. No critério 'Efeitos Duradouros', a parte 2 tem potencial para efeitos duradouros, pois institui uma metodologia que pode persistir independentemente de mudanças de pessoal, enquanto a parte 1 é mais sobre conformidade imediata. No critério 'Ação Genérica', a parte 1 é altamente genérica, focada em cumprir normativos existentes, enquanto a parte 2 é mais específica ao propor a implementação de uma metodologia, embora ainda referencie leis.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: parcialmente

#### Auditoria 19879, Constatação Nº 703725

**Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS

**Constatação**: O Hospital de Câncer de Cascavel (Uopeccan) não emitiu nova AIH para procedimento compatível nos casos em que a internação para quimioterapia de administração contínua (03.04.08.002-0) excedeu seis dias de permanência.

**Recomendação**: - Emitir nova AIH compatível com a condição clínica apresentada pelo paciente, nos termos da normativa vigente, utilizando-se do código 03.04.10.001-3 - Tratamento de intercorrências clínicas de paciente oncológico, sempre que a internação se prolongar por intercorrências que extrapolem o escopo do procedimento original de quimioterapia contínua; - Promover capacitação continuada da equipe responsável pelos processos de codificação e faturamento, com foco nas diretrizes do SIA/SUS e nos requisitos normativos para correta classificação e cobrança dos procedimentos oncológicos hospitalares. Essas recomendações seguem as diretrizes do Manual de Bases Técnicas da Oncologia - SIA/SUS, 30ª edição, Ministério da Saúde, 2022, página 22, contribuindo para a correta codificação, a precisão dos registros dos procedimentos realizados, o cumprimento das normas regulatórias e a otimização da gestão dos recursos de saúde.

**Análise Codificação**: A recomendação é composta por duas partes distintas. A primeira parte ('Emitir nova AIH...') é claramente orientada à correção da condição específica identificada (internações prolongadas sem emissão de AIH adequada), focando na solução imediata do problema pontual. Não aborda as causas subjacentes que levaram à não emissão das AIHs, limitando-se a prescrever a ação correta a ser tomada quando a situação ocorrer. A segunda parte ('Promover capacitação continuada...') identifica uma causa potencial (falta de capacitação da equipe) e propõe uma ação que visa prevenir a recorrência do problema através do desenvolvimento de competências permanentes na equipe, o que teria efeitos duradouros mesmo com mudança de pessoal. Quanto ao critério de ação genérica, a primeira recomendação se restringe a sugerir o cumprimento de normativo existente, enquanto a segunda vai além ao propor uma ação concreta de capacitação.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: parcialmente

#### Auditoria 19879, Constatação Nº 703730

**Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS

**Constatação**: O Hospital de Câncer de Cascavel (UOPECCAN) não comprovou documentalmente, em 01 caso, a realização da cirurgia oncológica no máximo 60 dias antes da quimioterapia adjuvante - profilática.

**Recomendação**: - Garantir a conformidade com as normas e regulamentos vigentes. - Alinhar as práticas assistenciais às diretrizes do SUS e às recomendações do Manual de Bases Técnicas da Oncologia. - Manter um diálogo aberto e colaborativo com os responsáveis para promover melhorias contínuas na gestão e na assistência ao paciente. - Orientar os profissionais por meio de treinamentos e capacitações contínuas, com o intuito de reforçar as boas práticas de registro, documentação e cumprimento dos prazos. - Implementar um sistema de acompanhamento periódico para garantir que as ações corretivas estejam sendo efetivas e que futuras não conformidades sejam evitadas. Essas recomendações apresentadas visam atender ao parágrafo 2.° do art. 2 da Lei nº 14.758, de 19 de dezembro de 2023, que institui a Política Nacional de Prevenção e Controle do Câncer no âmbito do SUS e ao Manual de Bases Técnicas da Oncologia - SIA/SUS, 30ª edição, Ministério da Saúde, 2022, que orienta o início da quimioterapia adjuvante entre 30 e 60 dias do pós-operatório (p. 108), desde que respeitadas as condições clínicas e a integralidade da assistência. Além disso, elas têm como objetivo mitigar riscos que possam prejudicar o atingimento dos objetivos do SUS e garantir um atendimento de qualidade à população usuária do sistema.

**Análise Codificação**: A recomendação apresenta múltiplas ações, sendo necessário avaliar o conjunto. Em relação ao critério 'Causa Identificada', a recomendação não explicita claramente a causa da não conformidade (ex: falha no sistema de registro, desconhecimento de prazos, ausência de protocolos), mas ações como treinamentos e implementação de sistema de acompanhamento sugerem inferência de causas relacionadas a capacitação e monitoramento. Para 'Ação Proposta', há sugestões concretas como treinamentos e sistema de acompanhamento, indo além do mero cumprimento normativo. Quanto aos 'Efeitos Duradouros', treinamentos contínuos e sistema de acompanhamento podem perdurar com mudança de atores, mas itens como 'garantir conformidade' e 'alinhar práticas' são genéricos. Sobre 'Ação Genérica', partes da recomendação se restringem a sugerir conformidade com normas existentes, mas outras propõem ações específicas como treinamentos e sistema de acompanhamento.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: parcialmente

#### Auditoria 19586, Constatação Nº 672299

**Finalidade**: Avaliar a atuação do município através dos indicadores de desempenho do Programa Previne.

**Constatação**: O município de Itambaracá/PR não realizou o preenchimento adequado do prontuário relacionando corretamente o paciente ao indicador, mas efetuou a vinculação à equipe, no exercício de 2022.

**Recomendação**: 1. Preencher adequadamente os prontuários, relacionando os pacientes aos indicadores do Programa Previne Brasil, de acordo com as orientações constantes no Manual Instrutivo do Programa; 2. Atender ao disposto no artigo 12-C da Portaria GM/MS nº 2.979, de 12/11/2019, que estabelece que o cálculo do incentivo financeiro do pagamento por desempenho será efetuado considerando os resultados de indicadores alcançados pelas equipes credenciadas e cadastradas no SCNES; 3. Efetivar a informatização das UBS do município, viabilizando o uso do Prontuário Eletrônico nos ambientes de atendimento ao cidadão, garantindo o devido preenchimento das informações de saúde dos usuários da APS e o envio adequado de dados ao Ministério da Saúde, de acordo com as orientações constantes na página 47 do Manual Instrutivo do Programa.

**Análise Codificação**: A recomendação aborda três aspectos distintos. O primeiro item ('Preencher adequadamente os prontuários...') é uma ação corretiva direta para a condição identificada (preenchimento inadequado), sem propor medidas para evitar a recorrência. O segundo item ('Atender ao disposto no artigo 12-C...') limita-se a citar o cumprimento de normativo existente, sem tratar as causas do não cumprimento. O terceiro item ('Efetivar a informatização das UBS...') propõe uma mudança estrutural (implantação de prontuário eletrônico) que, ao padronizar e automatizar processos, pode reduzir a dependência de ações manuais e mitigar o risco de novos erros de preenchimento, com efeitos que persistem independentemente dos atores envolvidos. No entanto, como a recomendação é composta e apenas um dos itens aborda potencialmente a causa, a análise considera o conjunto.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: sim

#### Auditoria 19590, Constatação Nº 684544

**Finalidade**: Verificar a implementação da Pol. Nac. ao Portador de Doença Ren. Crônica, nos estágios 4 e 5 em TRS

**Constatação**: Os mecanismos de regulação para os serviços de TRS com indicação de referência e contrarreferência para os portadores de DRC, nos estágios 4 e 5, são inexistentes no município de Campina Grande/PB.

**Recomendação**: Objetivando-se a adequação das lacunas verificadas pela equipe de auditoria, recomenda-se: -identificar, por meio de pesquisas científicas e/ou criação de sistema informatizado, os determinantes e condicionantes das principais patologias que levam à doença renal com vistas a adotar-se estratégias de enfrentamento por meio de políticas públicas; -garantir o acesso e assegurar a qualidade do processo de diálise visando alcançar impacto positivo na sobrevida, na morbidade e na qualidade de vida e garantir equidade na entrada em lista de espera para transplante renal, com vistas à ampliação com qualidade do atendimento à população necessitada; -regular, fiscalizar o controlar a avaliação de ações de atenção ao portador de doença renal, preferencialmente por meio da interlocução com o estado e conselho de saúde. Tais indicações atendem ao disposto no inciso III, art. 2º e nos incisos III e VI, do art. 3º, Anexo XXXIII, da Portaria de Consolidação GM/MS n.º 2, de 28 de setembro de 2017.

**Análise Codificação**: A recomendação aborda múltiplas ações para lidar com a ausência de mecanismos de regulação para serviços de TRS. Em relação à 'Causa Identificada', a recomendação propõe identificar determinantes e condicionantes das patologias que levam à doença renal, o que sugere uma tentativa de entender as causas subjacentes, embora não especifique claramente a causa imediata da inexistência dos mecanismos. Para 'Ação Proposta', ela inclui ações como identificar determinantes, garantir acesso à diálise e regular ações, que visam mitigar riscos futuros, mas algumas são genéricas. Quanto aos 'Efeitos Duradouros', ações como criar sistemas informatizados ou políticas públicas podem ter efeitos prolongados, mas a ênfase em garantir acesso e qualidade sugere foco em condições atuais. Sobre 'Ação Genérica', partes da recomendação se baseiam em cumprir normativos existentes, como citado na portaria, indicando um elemento genérico.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: sim

#### Auditoria 19840, Constatação Nº 701376

**Finalidade**: Verificar a regularidade da produção inserida nos sistemas do SUS

**Constatação**: A Semsam não comprovou a execução da produção do procedimento Consulta Médica em Atenção Especializada inserida no Sistema de Informações Ambulatoriais (SIA/SUS).

**Recomendação**: Restituir ao Fundo Nacional de Saúde (FNS) os recursos federais do SUS, no valor de R\$910.120,00 (novecentos e dez mil e cento e vinte reais), recebidos indevidamente pelo município de Amarante do Maranhão, atualizados monetariamente e com os acréscimos legais cabíveis, conforme indicado no capítulo "Proposição de Devolução" deste relatório. Essa medida se fundamenta no parágrafo único do artigo 54 da Portaria GM/MS nº 684/2022, que estabelece que incorreções ou discrepâncias na produção registrada podem impedir a execução orçamentária e financeira de emendas parlamentares, e no item 9.3.4 do Acórdão nº 1.072/2017 - Plenário, que determina que, em caso de débito por recebimento irregular de recursos federais, o ente recebedor deve restituir o FNS, independentemente do destino final dos recursos. Garantir a rastreabilidade das informações produzidas e enviadas aos sistemas de informação do SUS, mediante a implementação de mecanismos de registro, verificação e responsabilização por inconsistências, de acordo com o disposto no item 2.3 do Manual de Operação do SIA-SUS (2016) e com a alínea a do item II do art. 295 da Portaria de Consolidação GM/MS nº 1/2017.

**Análise Codificação**: A recomendação possui dois componentes distintos. O primeiro componente, que trata da restituição de recursos, é claramente focado na correção da condição específica identificada (recebimento irregular de recursos), sem propor ações para evitar que situações similares ocorram no futuro. O segundo componente, que trata da garantia de rastreabilidade das informações, identifica uma causa subjacente (falta de mecanismos de registro, verificação e responsabilização) e propõe uma ação que visa prevenir a recorrência da condição, com efeitos que podem perdurar além dos atores atuais, embora se baseie em normativos existentes. No entanto, considerando a recomendação como um todo e o fato de que o componente de rastreabilidade é genérico e não especifica ações concretas para tratar a causa do não cumprimento, a recomendação é predominantemente condition-based.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: sim

#### Auditoria 19890, Constatação Nº 702542

**Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS

**Constatação**: O estabelecimento não comprovou a APAC concomitante para quimioterapia, das AIHs com código 03.04.08.003-9 (internação para quimioterapias de leucemia aguda/crônica agudizadas).

**Recomendação**: Cumprir o que estabelece os artigos 14 e 27, da Portaria SAES/MS 470/2021, sobre a necessidade de APAC concomitante para o procedimento 03.04.08.003-9. Organizar o prontuário como documento único, garantindo a continuidade do cuidado prestado ao paciente, conforme artigo 2º; § 1º da Lei nº 14.758, de 19 de dezembro de 2023.

**Análise Codificação**: A recomendação possui duas partes distintas. A primeira parte ('Cumprir o que estabelece os artigos 14 e 27, da Portaria SAES/MS 470/2021, sobre a necessidade de APAC concomitante para o procedimento 03.04.08.003-9') é uma ação genérica que apenas reforça o cumprimento de normativos já existentes, sem propor medidas específicas para abordar a causa subjacente da não conformidade. A segunda parte ('Organizar o prontuário como documento único, garantindo a continuidade do cuidado prestado ao paciente, conforme artigo 2º; § 1º da Lei nº 14.758, de 19 de dezembro de 2023') sugere uma ação concreta (organização do prontuário) que pode inferir uma causa relacionada à desorganização documental, mas ainda se baseia em cumprir uma lei existente e não propõe claramente ações para prevenir a recorrência da condição. Quanto aos efeitos duradouros, a organização do prontuário como documento único pode ter algum impacto duradouro, mas a ênfase no cumprimento de normativos limita a capacidade de induzir mudanças estruturais profundas. A recomendação como um todo é predominantemente reativa, focada em corrigir a condição imediata de falta de comprovação, sem abordar sistematicamente as causas para evitar repetição.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: parcialmente
- Ação Genérica: sim

#### Auditoria 19475, Constatação Nº 666197

**Finalidade**: Verificar a regularidade da gestão e funcionamento do Serviço de Atendimento Móvel de Urgência 192.

**Constatação**: Os procedimentos licitatórios analisados, de aquisições e contratações visando a execução SAMU 192 de Boa Vista, não ocorreram de acordo com as exigências mínimas previstas na legislação pertinente.

**Recomendação**: Recomenda-se a SMSA de Boa Vista que: -Em atenção ao § 1º, Art. 18 da Lei 14.333/2021 de 01/04/2021, o gestor deve, nas contratações com utilização de recurso federal, durante a vigência exclusiva da nova legislação, realizar o estudo técnico preliminar de modo a permitir, dentre outros, a avaliação da viabilidade técnica e econômica da contratação, contemplando os requisitos mínimos necessários. - Recomenda-se ainda que nos processos de aquisições e contratações de serviços, a SMSA utilize modelo de lista de verificação, como checklist, conforme modelos disponíveis no sitio eletrônico da Advocacia Geral da União (AGU), ou modelos próprios que contemplem todo arcabouço legal relacionado a cada modalidade de compra e/ou contratação.

**Análise Codificação**: A recomendação aborda duas ações principais: a realização do estudo técnico preliminar conforme a Lei 14.333/2021 e a utilização de checklist nos processos de aquisições. Em relação ao critério 'Causa Identificada', a recomendação não explicita claramente a causa das irregularidades nos procedimentos licitatórios, mas a ação proposta de usar checklist sugere uma causa subjacente relacionada à falta de sistematicidade ou controle nos processos. Para o critério 'Ação Proposta', a recomendação sugere ações específicas (realizar estudo técnico e usar checklist) que visam prevenir a recorrência das irregularidades, indo além da mera correção pontual. Quanto aos 'Efeitos Duradouros', a implementação de um checklist e a exigência de estudos técnicos podem institucionalizar práticas que persistem independentemente de mudanças nos atores, promovendo melhorias duradouras. No critério 'Ação Genérica', a primeira parte da recomendação refere-se ao cumprimento de um normativo legal existente (Lei 14.333/2021), enquanto a segunda parte (uso de checklist) propõe uma ação concreta adicional para assegurar a conformidade, indicando que a recomendação não se restringe apenas a sugerir o cumprimento de normas preexistentes de forma genérica.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: sim
- Ação Genérica: não

#### Auditoria 19586, Constatação Nº 672321

**Finalidade**: Avaliar a atuação do município através dos indicadores de desempenho do Programa Previne.

**Constatação**: O Conselho Municipal de Saúde não exerceu o controle social em relação aos resultados obtidos nos indicadores de desempenho do exercício de 2022.

**Recomendação**: 1. Registrar os debates ocorridos nas reuniões do Conselho Municipal de Saúde por meio de atas, bem como divulgar suas deliberações à sociedade, em cumprimento ao disposto no inciso XII do artigo 29 da Constituição Federal de 1988 e nos incisos I, IV, V, VII, XVIII, XXIV da Quinta Diretriz da Resolução nº 453 do Conselho Nacional de Saúde, de 10/5/2012; 2. Encaminhar ao Conselho Municipal de Saúde o resultado do alcance das metas dos indicadores de desempenho do Programa Previne Brasil e das ações voltadas à melhoria do acesso da população à Atenção Básica, conforme preconizado na Resolução Conselho Nacional de Saúde nº 453, de 10/5/2012.

**Análise Codificação**: A recomendação aborda a constatação de que o Conselho Municipal de Saúde não exerceu controle social sobre os indicadores do Programa Previne, propondo ações específicas como registrar debates em atas e divulgar deliberações, além de encaminhar resultados de metas ao Conselho. Em relação ao critério 'Causa Identificada', a recomendação não explicita claramente a causa raiz da falta de controle social, mas as ações propostas sugerem que a causa pode estar relacionada à falta de registro e divulgação adequada, bem como ao não encaminhamento de informações. Para 'Ação Proposta', a recomendação sugere ações concretas, como registrar atas e encaminhar resultados, que visam mitigar a condição atual. Quanto aos 'Efeitos Duradouros', as ações de registro e divulgação institucionalizam práticas que podem persistir independentemente de mudanças nos atores, promovendo transparência contínua. Sobre 'Ação Genérica', a recomendação cita normativos legais existentes, mas vai além ao especificar ações como registrar atas e encaminhar resultados, não se limitando apenas a sugerir o cumprimento genérico da lei.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: sim
- Ação Genérica: não

#### Auditoria 19614, Constatação Nº 676605

**Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena

**Constatação**: Impropriedades relacionadas ao acompanhamento mensal do Eixo de Atenção à Saúde Indígena.

**Recomendação**: Determinar às unidades de acompanhamento que elaborem relatórios mensais com base nas informações fidedignas relacionadas nos mapas de produção, atas das reuniões e listas de presença apresentados; e adotando medidas de natureza preventiva ou corretiva na hipótese do não cumprimento do disposto no objeto do convênio e/ou Plano de Ação, atendendo à Portaria de Consolidação Sesai/MS nº 1 /2020, especificamente os §§3º e 4º do art. 4º; inciso VI do art. 11; inciso V e parágrafo único do art. 12; e incisos I e II do art. 14.

**Análise Codificação**: A recomendação determina que as unidades de acompanhamento elaborem relatórios mensais baseados em informações fidedignas e adotem medidas preventivas ou corretivas em caso de descumprimento do convênio ou Plano de Ação, conforme portaria específica. Em relação à 'Causa Identificada', a recomendação não explicita a causa raiz das impropriedades no acompanhamento, mas a ação proposta sugere que a causa pode estar relacionada à falta de relatórios sistemáticos ou medidas corretivas, permitindo inferir parcialmente a causa. Quanto à 'Ação Proposta', a recomendação sugere ações concretas (elaborar relatórios e adotar medidas), mesmo que referenciando uma norma existente. Sobre 'Efeitos Duradouros', a ação de elaborar relatórios mensais e adotar medidas corretivas cria um processo contínuo que pode persistir independentemente de mudanças nos atores, indicando efeitos duradouros. No critério 'Ação Genérica', a recomendação vai além de apenas sugerir o cumprimento da portaria, pois especifica ações como elaboração de relatórios e adoção de medidas, embora ainda esteja ancorada na norma.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: sim
- Ação Genérica: não

#### Auditoria 19850, Constatação Nº 701771

**Finalidade**: verificar a regularidade no uso do Sistema de Regulação (Sisreg) no município de Queimados

**Constatação**: A Central de Regulação de Queimados/RJ não possui protocolos e critérios bem definidos para elaboração, organização, inserção e priorização de pacientes em fila de espera para consultas, exames e procedimentos ambulatoriais.

**Recomendação**: Elaborar e adotar protocolos e critérios objetivos para organização, inserção e priorização de pacientes em fila de espera para consultas e procedimentos ambulatoriais considerando a prioridade do paciente, tais como: urgência e emergência, complexidade do caso, condições clínicas, tipo de atendimento necessário e/ou disponibilidade de vagas de forma a atender ao disposto no Art.2 item III, do Anexo XXVI, da Política Nacional de Regulação do Sistema Único de Saúde e no Art. 5º, do Capítulo I do Anexo XXVI da Portaria de Consolidação nº. 2 de 28 de setembro de 2017.

**Análise Codificação**: A recomendação propõe a elaboração e adoção de protocolos e critérios objetivos para organização, inserção e priorização de pacientes em fila de espera, considerando fatores como urgência, complexidade e condições clínicas. Em relação ao critério 'Causa Identificada', a recomendação aborda indiretamente a causa (ausência de protocolos definidos), mas não a explicita claramente. Quanto à 'Ação Proposta', a recomendação sugere uma ação concreta (elaborar e adotar protocolos) que visa mitigar o risco de novas ocorrências da condição. Sobre 'Efeitos Duradouros', a ação proposta (implementação de protocolos) tende a produzir efeitos que permanecem mesmo com mudanças de atores, pois institucionaliza processos. No critério 'Ação Genérica', a recomendação vai além de sugerir o cumprimento de normativos existentes, propondo a criação de protocolos específicos para tratar a causa do não cumprimento.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: sim
- Ação Genérica: não

#### Auditoria 19891, Constatação Nº 703364

**Finalidade**: Realizar auditoria de oncologia, dados de produção SIA e SIH, Hospital de Clínicas de Uberlândia/MG

**Constatação**: Inconsistências na realização de cirurgias oncológicas, em até 30 dias, nos pacientes submetidos à quimioterapia prévia (neoadjuvante/citorredutora).

**Recomendação**: - Revisar e atualizar a equipe responsável pela documentação clínica e pelo registro de procedimentos, sobre a sistemática dos lançamentos no sistema SIGTAP, alinhando-se às diretrizes estabelecidas na alimentação dos Bancos de Dados Nacionais dos Sistemas de Informação em Saúde SIA, SIH e SCNES. Essa ação visa garantir maior precisão e consistência nos registros, facilitando a gestão e o monitoramento das ações de saúde. - Estabelecer protocolos claros para o registro de intervenções cirúrgicas e terapêuticas, incluindo a atualização imediata das informações após cada procedimento, para evitar possíveis imprecisões e erros de classificação. Essa prática objetiva possibilitar maior controle e avaliação da produção ambulatorial pelo gestor municipal processada. Essas recomendações atendem aos Incisos I e II, do Art. 295, Seção II da Portaria de Consolidação GM/MS nº 01, de 28/9/2017. Além de garantir a correta codificação e a precisão nos registros de cada procedimento realizado, contribui para a conformidade regulatória e otimização da gestão dos recursos de saúde.

**Análise Codificação**: A recomendação aborda a inconsistência nos registros de cirurgias oncológicas, propondo ações como revisão da equipe de documentação e estabelecimento de protocolos claros para registro. Quanto ao critério 'Causa Identificada', a recomendação não explicita diretamente a causa raiz (ex.: falta de treinamento ou supervisão), mas a ação proposta de revisão e atualização da equipe sugere que a causa pode ser deficiência na capacitação ou processos. Para 'Ação Proposta', a recomendação sugere medidas como revisão da equipe e estabelecimento de protocolos, que visam mitigar riscos futuros, embora parte se restrinja ao cumprimento de normativos. Em 'Efeitos Duradouros', as ações propostas (protocolos e treinamento) podem perdurar com mudanças de atores, pois institucionalizam processos. Quanto à 'Ação Genérica', a recomendação inclui sugestões específicas (ex.: protocolos claros) além de apenas cumprir normativos, mas também referencia conformidade com portarias existentes.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: sim
- Ação Genérica: não

#### Auditoria 19511, Constatação Nº 677194

**Finalidade**: Verificar regularidade de recebimento, armazenamento, saída, dispensação e utilização das OPME

**Constatação**: O recebimento de compras de OPME adquiridas pelo Hospital Federal da Lagoa - HFL superior a R\$ 80.000,00 está em desacordo com a portaria e a legislação vigente.

**Recomendação**: Adotar medidas que assegurem o cumprimento dos normativos internos no que se refere ao recebimento e atestos das OPME, bem como promover a atualização desses instrumentos normativos de acordo com o preconizado no inciso II, art. 140 da Lei nº 14.133, de 1º/04/2021.

**Análise Codificação**: A recomendação sugere duas ações principais: (1) adotar medidas para assegurar o cumprimento dos normativos internos sobre recebimento e atestos de OPME, e (2) promover a atualização desses instrumentos normativos conforme a Lei nº 14.133/2021. Em relação ao critério 'Causa Identificada', a recomendação não explicita claramente a causa do desacordo (ex.: falta de capacitação, falhas processuais), mas a ação de atualizar normativos sugere que a causa pode ser a inadequação ou desatualização das normas internas. Para 'Ação Proposta', a recomendação apresenta ações genéricas ('adotar medidas', 'promover a atualização') que visam prevenir a reincidência, mas sem especificar ações concretas. Quanto aos 'Efeitos Duradouros', a atualização normativa pode ter efeitos prolongados, independente de mudanças de atores, pois altera a base regulatória. No critério 'Ação Genérica', a recomendação se baseia em sugerir o cumprimento e atualização de normativos legais existentes, sem propor ações específicas para tratar a causa raiz do não cumprimento.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: sim
- Ação Genérica: sim

#### Auditoria 19538, Constatação Nº 675893

**Finalidade**: Avaliar a gestão da SMS quanto aos indicadores de desempenho do programa Previne Brasil.

**Constatação**: Os dados referentes ao exame de Sifilis e HIV em gestantes do indicador 2 apresentados no SISAB não são equivalentes aos registrados nos demais sistemas de registro dos procedimentos.

**Recomendação**: 1. Efetivar a informatização das UBS do município, viabilizando o uso do Prontuário Eletrônico nos ambientes de atendimento ao cidadão, garantindo o devido preenchimento das informações de saúde dos usuários da APS e o envio adequado de dados ao Ministério da Saúde, de acordo com o disposto na Nota Técnica nº 21/2019- CGIAP/DESF/SAPS/MS, que define o processo de informatização das unidades de Atenção Primária à Saúde; 2. Registrar no SISAB, por competência, os dados relacionados ao indicador nº 2, referentes à realização de exames para detecção de Sífilis e HIV nas gestantes, regularmente, até o 10º dia útil subsequente a cada competência, de acordo com o preconizado na Nota Técnica nº 14/2022-SAPS/MS.

**Análise Codificação**: A recomendação aborda duas ações distintas. A primeira ação propõe a informatização das UBS e implementação do Prontuário Eletrônico, o que sugere uma tentativa de tratar a causa raiz da discrepância de dados (falta de informatização adequada), com potencial para evitar futuras ocorrências e com efeitos duradouros, mas não identifica explicitamente a causa. A segunda ação é corretiva, focando apenas no registro pontual dos dados no SISAB, sem abordar causas subjacentes. No entanto, a primeira ação, embora genérica ao citar conformidade com nota técnica, propõe uma mudança estrutural. Considerando o conjunto, a recomendação tem elementos de ambas as abordagens, mas a ênfase na informatização indica um foco parcial na causa, embora não totalmente desenvolvido.

- Causa Identificada: parcialmente
- Ação Proposta: sim
- Efeitos Duradouros: sim
- Ação Genérica: sim

#### Auditoria 19612, Constatação Nº 674988

> **Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena
>
> **Constatação**: Impropriedades relacionadas aos relatórios mensais de acompanhamento do Eixo Controle Social no Transferegov.
>
> **Recomendação**: Determinar às unidades de acompanhamento que elaborem relatórios mensais com base nas informações fidedignas relacionadas nos mapas de produção apresentados; e adotando medidas de natureza preventiva ou corretiva na hipótese do não cumprimento do disposto no objeto do convênio e/ou Plano de Ação, atendendo à Portaria de Consolidação Sesai/MS nº 1 /2020, especificamente os §§3º e 4º do art. 4º; inciso VI do art. 11; inciso V e parágrafo único do art. 12; e incisos I e II do art. 14.
>
> **Análise Codificação**: A recomendação aborda a elaboração de relatórios mensais com base em informações fidedignas e a adoção de medidas preventivas ou corretivas em caso de descumprimento do convênio, referenciando normas específicas. No critério 'Causa Identificada', a recomendação não explicita claramente a causa das impropriedades nos relatórios, mas a ação proposta sugere que a causa pode estar relacionada à falta de base em informações fidedignas ou à ausência de medidas para garantir o cumprimento normativo. No critério 'Ação Proposta', a recomendação sugere ações concretas (elaborar relatórios com base fidedigna e adotar medidas preventivas/corretivas), embora parte dela se restrinja ao cumprimento de normativos existentes. No critério 'Efeitos Duradouros', as ações propostas, como a elaboração sistemática de relatórios e a adoção de medidas, podem perdurar além de mudanças de atores, indicando potencial para efeitos duradouros. No critério 'Ação Genérica', a recomendação inclui elementos genéricos ao sugerir o atendimento a portarias específicas, mas também propõe ações mais direcionadas, como a elaboração de relatórios com base fidedigna.
>
> Causa Identificada: parcialmente
>
> Ação Proposta: sim
>
> Efeitos Duradouros: sim
>
> Ação Genérica: sim

#### Auditoria 19820, Constatação Nº 694718

> **Finalidade**: Auditoria PNSMAD - 2024
>
> **Constatação**: As Unidades de Saúde na Atenção Primária não realizam acolhimento de casos de urgência e emergência de saúde mental.
>
> **Recomendação**: A Gestão da SMS de Maceió deve estabelecer os fluxos de referência e contra-referência do paciente para atendimentos de urgência e emergência, em relação aos leitos hospitalares e atendimentos nos Centros de Atenção Psicosocial (CAPS). Organizar os serviços de transportes e equipes especializadas, para a condução dos pacientes em crise; e de vagas para consultas especializadas em psiquiatria; realizar o mapeamento das unidades de saúde da Atenção Primária que encontram barreiras para o encaminhamento dos pacientes para a análise dos profissionais psiquiatras; estabelecer os fluxos para o SAMU, quando acionado. Cumprir a Portaria de Consolidação nº 2 de 28/09/2017, Anexo 1 do Anexo XXII, Capítulo I, Itens 3.3, 4.1, VI, 4.2, III;Portaria de Consolidação nº 3, de 28/09/2017, Anexo V, Art.6º § 1º t; e Lei nº 10.216, de 6/04/2001.
>
> **Análise Codificação**: A recomendação aborda múltiplas ações para estruturar fluxos e serviços de saúde mental, incluindo estabelecimento de fluxos de referência, organização de transporte e equipes especializadas, mapeamento de barreiras e cumprimento de normativos legais. No critério 'Causa Identificada', a recomendação não explicita diretamente a causa da não realização do acolhimento, mas ações como mapear barreiras e organizar serviços sugerem uma tentativa de abordar causas subjacentes, como falta de estrutura ou fluxos definidos. No critério 'Ação Proposta', a recomendação apresenta sugestões claras para mitigar riscos de novas ocorrências, como estabelecer fluxos e organizar serviços. No critério 'Efeitos Duradouros', as ações propostas, como estabelecer fluxos e mapear barreiras, têm potencial para criar mudanças institucionais que persistem além de mudanças de atores, indicando efeitos duradouros. No critério 'Ação Genérica', parte da recomendação se restringe a sugerir o cumprimento de normativos legais existentes, o que caracteriza uma ação genérica.
>
> Causa Identificada: parcialmente
>
> Ação Proposta: sim
>
> Efeitos Duradouros: sim
>
> Ação Genérica: sim

#### Auditoria 19847, Constatação Nº 703089

> **Finalidade**: Verif. a regular. no faturamento da Autorização de Procedimento Ambulatorial Radioterapia.
>
> **Constatação**: Não foi possível comprovar o efetivo monitoramento e o cumprimento das metas de radioterapia pactuadas nos contratos firmados entre a SES/RS e o HSVP, no período auditado
>
> **Recomendação**: Integrar sistematicamente os relatórios da CAC aos processos de pagamento, como subsídio à verificação do cumprimento das metas; Incluir, nos processos de pagamento, documentos comprobatórios da produção e comparativos entre metas pactuadas e resultados alcançados; Aprimorar os controles operacionais e documentais relativos à gestão e monitoramento dos contratos de serviços de alta complexidade; Revisar e fortalecer os controles internos, garantindo a rastreabilidade da produção assistencial; Adequar os procedimentos de liquidação da despesa às exigências legais, garantindo a presença de documentos comprobatórios nos pagamentos realizados; Buscar atingir, enfim, a conformidade com os arts. 62 e 63 da Lei nº 4.320/1964, que exigem liquidação da despesa com base em documentação comprobatória da execução.
>
> **Análise Codificação**: A recomendação aborda a constatação de falta de monitoramento e cumprimento de metas de radioterapia, propondo ações como integração de relatórios, inclusão de documentos comprobatórios, aprimoramento de controles, revisão de controles internos, adequação de procedimentos de liquidação e busca de conformidade legal. Em relação ao critério 'Causa Identificada', a recomendação não explicita claramente a causa raiz da falta de monitoramento, mas as ações propostas sugerem causas subjacentes, como deficiências em controles e processos. Para 'Ação Proposta', as sugestões são direcionadas a mitigar riscos de reocorrência, como aprimorar controles. Quanto a 'Efeitos Duradouros', as ações visam alterações institucionais, como revisão de controles internos, que podem persistir com mudanças de atores. No critério 'Ação Genérica', parte da recomendação se restringe a sugerir conformidade com leis existentes, como a Lei nº 4.320/1964, indicando um elemento genérico.
>
> Causa Identificada: parcialmente
>
> Ação Proposta: sim
>
> Efeitos Duradouros: sim
>
> Ação Genérica: sim

#### Auditoria 19486, Constatação Nº 682194

> **Finalidade**: Avaliar os indicadores de desempenho do programa Previne Brasil no município de João Pessoa
>
> **Constatação**: A Secretaria Municipal de Saúde de João Pessoa/PB, em 2022, não adotou as ações propostas no "Documento Orientador", como forma de atingir a meta para o Indicador nº 1 Proporção de gestantes com pelo menos 6 (seis) consultas pré-natal realizadas, sendo a primeira até a 12ª semana de gestação.
>
> **Recomendação**: A SMS deve desenvolver ações para melhoria dos índices dos Indicadores conforme o Nota Técnica nº 13/2022 - SAPS/MS e Documento Orientador, dentre elas estão: Promover educação continuada e treinamento dos profissionais de saúde; Garantir insumos, materiais e equipamentos em boas condições de trabalho; Implantar protocolo para as ações de pré-natal e monitoramento da conformidade das práticas das eSF e eAP, em relação aos parâmetros de qualidade estabelecidos, inclusive no que diz respeito à humanização desse tipo de atendimento; Busca ativa das gestantes na área de abrangência da equipe, por meio de visitas domiciliares regulares, para cadastramento e início precoce do pré-natal, flexibilização de horários de atendimentos e lembrete de consultas agendadas.
>
> **Análise Codificação**: A recomendação identifica a causa da baixa cobertura pré-natal como sendo a não adoção de ações específicas do Documento Orientador, propondo medidas como educação continuada, garantia de insumos, implantação de protocolos e busca ativa. Essas ações visam prevenir a reocorrência do problema através de mudanças estruturais nos processos de trabalho. Embora algumas medidas possam ter efeitos duradouros (como protocolos implantados), outras dependem da continuidade de ações específicas por atores envolvidos. A recomendação vai além do simples cumprimento normativo ao detalhar ações concretas para implementação.
>
> Causa Identificada: sim
>
> Ação Proposta: sim
>
> Efeitos Duradouros: parcialmente
>
> Ação Genérica: não

#### Auditoria 19590, Constatação Nº 684472

> **Finalidade**: Verificar a implementação da Pol. Nac. ao Portador de Doença Ren. Crônica, nos estágios 4 e 5 em TRS
>
> **Constatação**: O serviço de hemodiálise do Sistema de Assistência Social e de Saúde (SAS) não mantém os registros verificados atualizados no prontuário.
>
> **Recomendação**: Objetivando-se a adequação das lacunas identificadas pela equipe de auditoria, recomenda-se: -promover a sensibilização dos profissionais de saúde do Setor de Hemodiálise do Serviço de Assistência Social e de Saúde, por meio de palestras e ou oficinas, com vistas à fomentar um cultura organizacional que preze pela importância dos registros dos pacientes enquanto informações cruciais ao cuidado integral dos pacientes com DRC; -registrar, seja de forma física ou informatizada, os atendimentos, os resultados dos exames realizados e os indicadores da efetividade dialítica nos prontuários dos pacientes, mantendo-os atualizados. Tais indicações são importantes para a consolidação do disposto no inciso XI, do art. 67, Seção III, Capítulo III, Anexo IV da Portaria de Consolidação GM/MS n.° 3, de 28 de setembro de 2017.
>
> **Análise Codificação**: A recomendação aborda a constatação de prontuários desatualizados no serviço de hemodiálise. No critério 'Causa Identificada', a recomendação sugere sensibilização dos profissionais, o que implica reconhecimento de que a causa subjacente é cultural/educacional (falta de valorização dos registros), portanto a causa está identificada. No critério 'Ação Proposta', há sugestões específicas (palestras/oficinas e registro sistemático) que visam mitigar a reincidência, atendendo ao critério. No critério 'Efeitos Duradouros', a sensibilização e mudança cultural podem perdurar além dos atores atuais, mas a ação de registro contínuo depende da adesão consistente, sendo parcialmente duradoura. No critério 'Ação Genérica', a recomendação vai além do mero cumprimento normativo ao propor ações concretas (sensibilização e método de registro), não se restringindo a citar a portaria existente.
>
> Causa Identificada: sim
>
> Ação Proposta: sim
>
> Efeitos Duradouros: parcialmente
>
> Ação Genérica: não

#### Auditoria 19735, Constatação Nº 693821

> **Finalidade**: Verificar irregularidades na gestão e no sistema de sobreaviso dos Médicos Vinculados ao Hospital
>
> **Constatação**: A fiscalização do contrato não está sendo realizada pelas instâncias competentes conforme a legislação vigente, verificando o cumprimento das metas qualitativas e quantitativas.
>
> **Recomendação**: É fundamental que a Secretaria Municipal de Saúde implemente uma fiscalização efetiva e contínua do contrato de gestão com o Hospital Santa Cruz de Canoinhas, conforme as diretrizes legais estabelecidas pela Lei nº 8080/1990, Lei nº 8.142/90, Lei 8.666/1993, Lei nº 14.133/2021, e as portarias de consolidação aplicáveis. Para tanto, a fiscalização deve ser descentralizada, com uma clara divisão de responsabilidades entre os setores de auditoria, controle e pagamento, garantindo o cumprimento das metas qualitativas e quantitativas estabelecidas no contrato. Além disso, é imprescindível que a Secretaria de Saúde, em conjunto com o hospital, desenvolva e execute um plano de capacitação contínua para todos os envolvidos na fiscalização, incluindo o Conselho Municipal de Saúde e os profissionais responsáveis pela auditoria e monitoramento. A capacitação deve focar na aplicação prática da legislação vigente e nas ferramentas de controle de qualidade, com ênfase em garantir independência e transparência nos processos de fiscalização. A fiscalização deve ser conduzida com base em critérios objetivos, assegurando que todos os relatórios de desempenho e resultados sejam analisados de maneira independente e transparente, de modo que qualquer não conformidade seja prontamente identificada e corrigida.
>
> **Análise Codificação**: A recomendação identifica a causa da fiscalização inadequada como sendo a falta de uma estrutura organizada e capacitação dos envolvidos, propondo ações como descentralização da fiscalização, divisão de responsabilidades e capacitação contínua. Essas ações visam prevenir a reincidência da condição ao fortalecer processos institucionais. No entanto, a recomendação também inclui elementos genéricos, como a sugestão de cumprir a legislação vigente, e embora promova mudanças estruturais, parte da ação proposta depende da atuação específica dos atores atuais, limitando parcialmente os efeitos duradouros.
>
> Causa Identificada: sim
>
> Ação Proposta: sim
>
> Efeitos Duradouros: parcialmente
>
> Ação Genérica: sim

#### Auditoria 19780, Constatação Nº 692590

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: A Rede de Frio é um componente do PNI municipal, porém não foi possível identificar a sua estruturação no âmbito da Secretaria Municipal de Saúde de Lagarto/SE.
>
> **Recomendação**: Providenciar a formalização da CMRF na estrutura administrativa da SMS de Lagarto/SE, com as atribuições, responsabilidades e competências dos órgãos que a compõem, em conformidade com o artigo 9º da RDC nº 63/2011. Adotar e assegurar o controle de frequência dos profissionais, para assegurar a transparência e regularidade no cumprimento da jornada de trabalho, em conformidade com o artigo 7º da RDC nº 63/2011. Atualizar e manter atualizado os dados junto ao Cadastro Nacional de Estabelecimentos de Saúde, conforme orienta o artigo 13, da Seção III, Capítulo II da Resolução - RDC Nº 63, de 25/11/2011.
>
> **Análise Codificação**: A recomendação aborda a falta de estruturação formal da Cadeia de Frio na SMS de Lagarto/SE, identificando implicitamente a causa como a ausência de formalização e controles adequados. A ação proposta inclui formalizar a CMRF, implementar controle de frequência e atualizar dados no CNES, visando prevenir a reincidência da condição. No entanto, os efeitos são duradouros apenas parcialmente, pois dependem da manutenção contínua, e a ação é genérica, pois se limita a cumprir normativos existentes sem propor soluções inovadoras para as causas subjacentes.
>
> Causa Identificada: sim
>
> Ação Proposta: sim
>
> Efeitos Duradouros: parcialmente
>
> Ação Genérica: sim

#### Auditoria 19786, Constatação Nº 694518

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: O processo de armazenamento dos imunobiológicos não é realizado de acordo com as orientações preconizadas pelo PNI.
>
> **Recomendação**: Adotar checklists relacionadas a etapa de armazenamento, em cumprimento ao Art. 51, Seção VIII, Capítulo II da Resolução - RDC n.º 63, de 25/11/2011; adotar procedimentos padronizados (POP's) das etapas do ciclo logístico, em cumprimento ao Art. 51, Seção VIII, Capítulo II da Resolução - RDC n.º 63, de 25/11/2011; realizar treinamentos com todos os colaboradores responsáveis pelas etapas, em cumprimento ao artigo n.º 51, Seção VIII, Capítulo II da Resolução - RDC n.º 63, de 25/11/2011; contratar empresa responsável pela calibração dos equipamentos e qualificação térmica dos ambientes, em conformidade com o artigo n.º 23, da Seção III, Capítulo II, da Resolução - RDC nº 63, de 25/11/2011 e artigo n.º 43 da RDC 430 e realizar inventário imediatamente de todos os itens constantes em estoque, e, definir prazos para a realização de inventários periódicos além do anual, em cumprimento ao artigo n.º 55 da RDC 63.
>
> **Análise Codificação**: A recomendação propõe múltiplas ações para corrigir a condição identificada de armazenamento inadequado de imunobiológicos, incluindo adoção de checklists, POPs, treinamentos, contratação de serviços de calibração e realização de inventários. Embora essas ações possam abordar causas subjacentes, como falta de procedimentos padronizados e capacitação, a recomendação se baseia principalmente no cumprimento de normativos legais existentes (RDC n.º 63/2011 e RDC 430). As ações propostas são genéricas no sentido de reiterar obrigações legais preexistentes, e não especificam medidas inovadoras ou personalizadas para evitar a recorrência além do que a norma já exige. Quanto aos efeitos duradouros, a implementação de POPs e treinamentos pode criar estruturas permanentes, mas a dependência de conformidade com leis específicas limita a perpetuidade independente de mudanças normativas. No critério 'Causa Identificada', a recomendação inferiu causas como falta de procedimentos e treinamento ao propor ações correlatas. Para 'Ação Proposta', há sugestões claras de medidas. Em 'Efeitos Duradouros', algumas ações (como POPs) podem perdurar, mas outras (como inventários) são contingentes à adesão contínua. Em 'Ação Genérica', a recomendação se restringe a cumprir normativos existentes, sem propor soluções além deles.
>
> Causa Identificada: sim
>
> Ação Proposta: sim
>
> Efeitos Duradouros: parcialmente
>
> Ação Genérica: sim

#### Auditoria 19809, Constatação Nº 694580

> **Finalidade**: Verificar se a Atenção Primária à Saúde está exercendo as atribuições de coordenadora da RAPS
>
> **Constatação**: As UBSs visitadas não compartilham os registros de pacientes em atendimento com transtorno mental com outros pontos da rede.
>
> **Recomendação**: Adotar as seguintes medidas visando atender o estabelecido no Item 6.2, Anexo I, da Portaria de Consolidação GM/MS nº 3, de 28 de setembro de 2017: - Instruir as equipes das UBSs para que os registros dos atendimentos em saúde mental no Sistema de Informação e- SUS (prontuário eletrônico) sejam realizados de forma detalhada, com anotações de todas as ações realizadas pelos profissionais das UBSs, bem como dos encaminhamentos realizados para outros pontos da rede; - Estabelecer a comunicação entres os diversos pontos de atenção da RAPS, preferencialmente por meio de sistemas unificados de registro, compartilhados entre as unidades que compõem a RAPS, de modo a garantir a referência e contrarreferência; e - Incluir profissionais de outros pontos de atenção da RAPS na construção do Matriciamento e Projeto Terapêutico Singular - PTS dos pacientes de saúde mental.
>
> **Análise Codificação**: A recomendação aborda a causa identificada de falta de comunicação e registro inadequado, propondo ações específicas como instrução detalhada das equipes, estabelecimento de sistemas unificados de comunicação e inclusão de profissionais no matriciamento. Embora algumas ações tenham efeitos duradouros, como sistemas unificados, outras são mais genéricas ao sugerir cumprimento de normativo existente. A ação proposta visa mitigar riscos de novas ocorrências, mas nem todas as medidas garantem efeitos permanentes independentemente de mudanças de atores.
>
> Causa Identificada: sim
>
> Ação Proposta: sim
>
> Efeitos Duradouros: parcialmente
>
> Ação Genérica: sim
