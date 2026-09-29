# Apêndice F --- Prompt de Codificação --- Tentativa 4

### Prompt

```{txt}
O usuário é um pesquisador que está desenvolvendo uma pesquisa
sobre o potencial do Departamento Nacional de Auditoria do
Sistema Único de Saúde (DENASUS) de atuar como uma organização
capaz de gerar transformações no âmbito do SUS, através da
execução de auditorias que proponham recomendações potencialmente
capazes de influenciar mudanças no sistema de saúde.

Os resultados das auditorias realizadas pelo DENASUS são
materializados em relatórios, os quais apontam constatações
(também chamadas de achados de auditoria) que expõem condições
observadas que não atendem aos critérios requeridos definidos
pela equipe de auditoria. As recomendações são, por conseguinte,
definidas como sugestões técnicas que visam corrigir
discrepâncias entre o que foi observado e os critérios
requeridos, que podem ser normativos, operacionais ou legais que
embasam o trabalho de auditoria.

Segundo a tipologia difundida pelo Institute of Internal Auditors
(IIA) as recomendações que tem foco na causa (cause-based) são
aquelas que propõem ações necessárias para evitar que a condição
ou a observação volte a ocorrer. Normalmente envolvem soluções de
longo prazo e podem demandar mais tempo para a sua implementação
(exemplo: criação e implementação de uma política de revisão de
acessos). Já recomendações que consistem em medidas cuja
finalidade é corrigir a condição encontrada, fornecem uma solução
temporária para corrigir a condição atual (exemplo: remoção de
acessos indevidos) e são consideradas, portanto, como tendo foco
na condição (condition-based).

O objetivo do trabalho consiste em identificar as recomendações
exaradas pelo DENASUS que possuam foco na causa.

É importante salientar que recomendações podem conter múltiplas
ações sugeridas, visando tanto corrigir a condição encontrada
quanto endereçar a causa que permitiu a ocorrência da condição.

Para realizar essa identificação, o usuário pesquisador irá
fornecer uma breve descrição da finalidade do trabalho de
auditoria realizado, a constatação que motivou a emissão da
recomendação e a própria recomendação. Sua função consistirá em
avaliar a recomendação em relação aos seguintes critérios:

- Critério "Ação Corretiva": A recomendação sugere uma ação para
resolver a condição encontrada? Responda somente "Sim" ou "Não".
- Critério "Ação Foco Causa": Além da ação corretiva, que tipo de
ação foi sugerida para corrigir a causa que levou à ocorrência da
condição? Se não há nenhuma ação com foco na causa, responda
"Não". Se a ação proposta indicar somente que o destinatário deve
cumprir algum normativo, responda "Genérica". Se a ação propõe
alguma ação concreta, para além do mero cumprimento de um
normativo, responda "Específica".
- Critério "Efeitos Duradouros": Os efeitos pretendidos pela ação
sugerida para tratar a causa da condição permanecem mesmo se os
atores envolvidos eventualmente mudarem? A avaliação deste
critério deve se dar somente quando o critério "Ação Foco Causa"
for avaliado como "Específico". Caso o critério "Ação Foco Causa"
seja "Não", responda "Não se Aplica", e se for "Genérico",
responda "Não".

A análise para avaliar cada critério deverá constar no campo
"Análise" da resposta, que será sucedido pelos campos referentes
aos critérios delineados acima.

Caso a recomendação não contenha uma recomendação de fato,
responda "Não se aplica" para os três critérios.

Formate sua resposta no format Json com a seguinte estrutura:

EXAMPLE JSON OUTPUT:

{
   "Análise": "Em relação aos efeitos, a recomendação... Ja em
   relação à ação proposta, a recomendação...",
   "Ação Corretiva": "Sim",
   "Ação Foco Causa": "Genérica",
   "Efeitos Duradouros": "Não"
}

```
### Resultados

  -----------------------------------------------------------------------------------
  Ação Corretiva   Ação Foco Causa   Efeitos Duradouros   Foco Causa     Total     \%
  ---------------- ----------------- -------------------- ------------ ------- ------
  Sim              Específica        Não                  Não                5   11.6

  Não              Específica        Sim                  Sim                3    7.0

  Sim              Específica        Sim                  Sim                5   11.6

  Não              Genérica          Não                  Não                5   11.6

  Sim              Genérica          Não                  Não                5   11.6

  Não              Não               Não se Aplica        Não                5   11.6

  Sim              Não               Não se Aplica        Não                5   11.6

  Não              Não               Não se aplica        Não                5   11.6

  Sim              Não               Não se aplica        Não                3    7.0

  Não se aplica    Não se aplica     Não se aplica        Não                2    4.6
  -----------------------------------------------------------------------------------

  ------------------------------------------------------------------------
  Foco Causa                                           Total            \%
  ------------------------------------- -------------------- -------------
  Não                                                     35            81

  Sim                                                      8            19
  ------------------------------------------------------------------------

### Listagem {#listagem-4}

#### Auditoria 19179, Constatação Nº 667920

> **Finalidade**: Verificar prestação dos serviços e aplicação dos recursos federais no Hosp. Mun. de Imperatriz
>
> **Constatação**: A Secretaria Municipal de Saúde - SEMUS de Imperatriz/MA realizou no ano de 2020 o Pregão Eletrônico nº 029/2020, Processo nº 02.19.00.2328-2020 SEMUS, para contratação complementar de empresa especializada em serviços médicos de urgência e emergência em neurologia para atender às demandas da UPA São José, com impropriedades que prejudicam a avaliação acerca da necessidade efetiva da contratação de mão-de-obra complementar.
>
> **Recomendação**: Observar e fazer cumprir pelo setor competente a elevação do valor contratual dentro da porcentagem permitida pelo Art. 65 da Lei 8666/03, § 1o e § 2o; Realizar estudo técnico demonstrativo da necessidade de contratação de serviço para complementar a mão-de-obra de médicos especialistas, com demonstração da correlação entre a crescente demanda e o esgotamento operacional dos servidores efetivos do município.
>
> **Análise Codificação**: A recomendação contém duas ações distintas. A primeira ação sugere ajustar o valor contratual conforme a lei, o que é uma medida corretiva para resolver a condição específica de impropriedade contratual. A segunda ação propõe a realização de um estudo técnico para demonstrar a necessidade da contratação, o que visa abordar a causa subjacente, como a falta de análise prévia da demanda e capacidade operacional, indo além do mero cumprimento normativo ao exigir uma ação concreta de estudo. No entanto, os efeitos dessa ação não são necessariamente duradouros, pois dependem da execução contínua do estudo e podem variar com mudanças na equipe ou nas circunstâncias.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Não

#### Auditoria 19761, Constatação Nº 691403

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: A estrutura física da Central Municipal da Rede de Frio (CMRF) de Gurupi/TO não atende aos requisitos mínimos para manutenção da cadeia de frio, conforme preconizado pelo Programa Nacional de Imunizações.
>
> **Recomendação**: Adequar a estrutura física da CMRF para incluir áreas específicas e identificadas para recebimento, expedição e armazenamento, a fim de garantir a conformidade com as melhores práticas de gestão de imunobiológicos, conforme preconizado na RDC ANVISA n.º 63, de 25 de novembro de 2011, que estabelece o dever do estabelecimento de saúde em fornecer todos os recursos necessários, incluindo ambientes identificados, equipamentos, materiais e suporte logístico, combinado com o Manual de Rede de Frio do PNI, 2017, quanto a necessidade das áreas separadas e identificadas para recebimento e expedição (pág. 75).
>
> **Análise Codificação**: A recomendação sugere adequar a estrutura física para corrigir a condição atual de não conformidade, caracterizando uma ação corretiva. Além disso, propõe a implementação de áreas específicas e identificadas, o que vai além do mero cumprimento de normativos, indicando uma ação concreta para tratar a causa subjacente, como a falta de organização física adequada. No entanto, os efeitos dessa ação dependem da manutenção contínua da estrutura e práticas, podendo ser comprometidos por mudanças na gestão ou recursos, não sendo intrinsecamente duradouros independentemente dos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Não

#### Auditoria 19735, Constatação Nº 694137

> **Finalidade**: Verificar irregularidades na gestão e no sistema de sobreaviso dos Médicos Vinculados ao Hospital
>
> **Constatação**: A UPA e a SMS não monitoram o número de pacientes que retornam à UPA em até 72 horas com a mesma queixa do primeiro atendimento.
>
> **Recomendação**: A Secretaria Municipal de Saúde (SMS) e a UPA devem implementar indicadores específicos para monitorar o número de pacientes que retornam à unidade em até 72 horas com a mesma queixa do primeiro atendimento. Embora a SMS tenha adotado uma planilha de monitoramento desde agosto de 2024, que inclui dados sobre tempos de espera e retornos, ainda não é possível identificar claramente as causas dos retornos, o que compromete a avaliação da resolutividade do atendimento. A SMS deve aprimorar esse monitoramento, permitindo uma análise precisa da eficácia do atendimento prestado e tomando medidas corretivas quando necessário para melhorar a qualidade dos serviços oferecidos.
>
> **Análise Codificação**: A recomendação sugere a implementação de indicadores específicos para monitorar retornos de pacientes, o que constitui uma ação para resolver a condição de falta de monitoramento identificada. Além disso, propõe o aprimoramento do monitoramento existente para permitir análise precisa da eficácia do atendimento e tomada de medidas corretivas, indicando uma ação com foco na causa ao buscar entender e tratar as razões subjacentes aos retornos, não se limitando ao mero cumprimento normativo. Os efeitos pretendidos, como a análise precisa e medidas corretivas, dependem de ações contínuas e podem não ser mantidos automaticamente com mudanças de atores, pois requerem implementação e manutenção ativa.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Não

#### Auditoria 19518, Constatação Nº 677558

> **Finalidade**: Avaliar a atuação do município auditado através dos indicadores de desempenho PREVINE Brasil.
>
> **Constatação**: O Município não adotou as ações propostas no `Documento Orientador`, como forma de atingir a meta para o indicador 06 - Proporção de pessoas com hipertensão, com consulta e pressão arterial aferida no semestre.
>
> **Recomendação**: Capacitar os profissionais sobre a importância do programa PREVINE BRASIL para o acesso ao usuário e para a melhoria do indicador 06 no Município e efetuar os registros dos atendimentos de modo a evoluir em prontuário o histórico do paciente cadastrado no programa Hiperdia, cumprindo assim a alínea "C" do item 6 do Documento Orientador do Previne Brasil; Manual Previne Brasil: 2.2.3. Ações para melhoria dos indicadores (pág. 40 e 41) combinado com o subitem 5.1 da Nota Técnica N° 18/2022-SAPS/MS.
>
> **Análise Codificação**: A recomendação sugere duas ações principais: capacitar profissionais sobre o programa PREVINE BRASIL e efetuar registros de atendimentos para evoluir o histórico do paciente no Hiperdia. A primeira ação visa abordar a causa subjacente da falta de conhecimento ou engajamento, enquanto a segunda é uma ação corretiva para resolver a condição imediata de registros inadequados. A ação de capacitação é específica, pois propõe uma medida concreta além do mero cumprimento normativo, mas seus efeitos podem não ser duradouros se dependentes de indivíduos específicos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Não

#### Auditoria 19293, Constatação Nº 683535

> **Finalidade**: Verificar a execução da "Auditoria 2" do Plano de Ação da SES do Tocantins, apresentado em 2022.
>
> **Constatação**: Não pagamento de subsídio para parte dos profissionais em cargos de direção nos hospitais HGP, HMDR, HRA, HRAug e HRG, no período de agosto a outubro de 2023.
>
> **Recomendação**: Identificar os motivos pelos quais há profissionais ocupantes em cargo de Direção que não estão recebendo a remuneração (integral ou seu percentual) inerente ao cargo; Analisar as ações que podem ser adotadas para revisar a política de remuneração, considerando as necessidades salariais dos cargos de direção dos hospitais. Tais medidas objetivam dar cumprimento ao parágrafo único do artigo 38 da Lei Estadual n.º 1.818, de 23/8/2007, que estabeleceu que é facultado ao servidor titular de cargo de provimento efetivo ou ao estabilizado, investido em cargo de provimento em comissão, optar entre a remuneração global atribuída ao cargo comissionado ou a sua remuneração relativa ao cargo de provimento efetivo e a gratificação de representação atribuída ao cargo de provimento em comissão; e ao artigo 22 da Lei Estadual n.º 3.421, de 8/3/2019, que preconiza que o servidor, ocupante de cargo de provimento efetivo ou de emprego, (...) quando nomeado para o cargo em comissão na Administração Direta e Indireta do Poder Executivo, poderá optar por sua remuneração ou subsídio de origem, acrescido de 40% do valor do subsídio do cargo em comissão que vier a exercer.
>
> **Análise Codificação**: A recomendação sugere ações para identificar os motivos do não pagamento (ação corretiva) e analisar a revisão da política de remuneração (ação com foco na causa). A ação de revisar a política é específica, pois propõe uma análise concreta além do mero cumprimento normativo, mas os efeitos duradouros não são claros, pois dependem de implementação contínua e podem variar com mudanças de atores.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Não

#### Auditoria 19598, Constatação Nº 677670

> **Finalidade**: Averiguar a prestação do serviço da Central de Regulação do Serviço Móvel de Urgência do Estado/RS.
>
> **Constatação**: Verificação de inobservâncias in loco dos profissionais médicos reguladores no turno noturno comparando as escalas recebidas, os espelhos pontos e os profissionais efetivamente presentes.
>
> **Recomendação**: Elaborar de forma participativa documento instrucional para definição de regras de troca de escalas, horários de descanso diurno e noturno, atestados, trocas de serviços etc, de forma que as regras sejam internalizadas e aplicadas a todos os profissionais.
>
> **Análise Codificação**: A recomendação propõe a elaboração de um documento instrucional para definir regras sobre troca de escalas, horários de descanso, atestados e trocas de serviços, visando internalizar e aplicar essas regras a todos os profissionais. Isso sugere uma ação para resolver a causa subjacente (falta de regras claras) que levou à inobservância das escalas, em vez de apenas corrigir a condição específica encontrada (ausência de profissionais no turno noturno). A ação é concreta, indo além do mero cumprimento de normativos, e os efeitos pretendidos (regras internalizadas) podem perdurar mesmo com mudanças de atores, pois o documento institucionaliza as regras.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19611, Constatação Nº 674292

> **Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena
>
> **Constatação**: Ausência de comprovação da capacidade técnica e operacional do Instituto Ovídio Machado (IOM) para realização do objeto e das atividades previstas no Convênio nº 878454/2018 - DSEI Tocantins.
>
> **Recomendação**: Adotar providências no sentido de estabelecer critérios de avaliação objetivos para a demonstração da capacidade gerencial, técnica e operacional das proponentes como requisito obrigatório nos hamamentos públicos para a seleção de entidades sem fins lucrativos que prestam serviços complementares de atenção à saúde indígena. Observando não somente a composição do corpo profissional da entidade, mas também a comprovação da existência de instalações adequadas para atendimento ao convênio.
>
> **Análise Codificação**: A recomendação sugere a adoção de providências para estabelecer critérios objetivos de avaliação da capacidade técnica e operacional das proponentes em futuros chamamentos públicos, o que visa prevenir a recorrência da condição observada (ausência de comprovação da capacidade do IOM). Embora não haja uma ação direta para corrigir a condição específica do convênio atual, a proposta de criar critérios obrigatórios constitui uma ação com foco na causa, pois busca modificar processos para evitar problemas similares. A ação é específica, pois vai além do mero cumprimento normativo, detalhando elementos como composição do corpo profissional e instalações adequadas. Os efeitos pretendidos são duradouros, pois a implementação de critérios estruturados permanece independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19676, Constatação Nº 686901

> **Finalidade**: Realizar auditoria no Convênio 878445/2018 com o Hospital e Maternidade Terezinha de Jesus
>
> **Constatação**: Ausência de documentação comprobatória sobre atendimento de critérios mínimos de capacidade gerencial, operacional e técnica da Convenente Hospital e Maternidade Therezinha de Jesus para execução do objeto do Convênio nº 878.445/2018 DSEI Alto Rio Juruá-AC.
>
> **Recomendação**: Estabelecer critérios objetivos para avaliação da capacidade técnica e operacional das proponentes no chamamento público para os próximos convênios a serem celebrados; quanto ao atendimento d o s requisitos necessários das entidades contratadas para o desenvolvimento de atividades relacionadas à gestão d a saúde indígena e quanto à capacidade técnica e operacional para a prestação dos serviços descritos no convênio e no Plano de Trabalho, nos termos do §2º do art. 1º e no inciso V do art. 16 e art. 20, da Portaria Interministerial MP/MF/CGU nº 424 de 2016. Com o objetivo de mitigar o risco de contratar entidade que não possui condições técnicas mínimas para a prestação dos serviços descritos nos instrumentos referentes às atividades de saúde indígena, bem como o risco de execução e prestação de serviços da saúde indígena de forma a não atender as cláusulas contratuais avençadas.
>
> **Análise Codificação**: A recomendação sugere estabelecer critérios objetivos para avaliação da capacidade técnica e operacional das proponentes em futuros convênios, o que visa prevenir a reincidência da ausência de documentação comprobatória observada. Esta ação é focada na causa, pois busca modificar o processo de seleção para evitar que entidades sem condições mínimas sejam contratadas novamente. No entanto, a recomendação não propõe uma ação específica para corrigir diretamente a condição encontrada no convênio atual (ausência de documentação), mas sim uma medida preventiva para convênios futuros. A ação sugerida é concreta, indo além do mero cumprimento normativo, ao exigir a definição de critérios objetivos. Os efeitos pretendidos são duradouros, pois a implementação de critérios claros permanece independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19859, Constatação Nº 702312

> **Finalidade**: Verificar a regularidade na inserção da produção no Sistema de Informação Ambulatorial do SUS
>
> **Constatação**: A SMS não apresentou documentos que comprovem a capacidade instalada e a quantidade de profissionais de saúde que permitisse a execução dos procedimentos relacionados e informados no Sistema de Informações Ambulatoriais - SIA/SUS.
>
> **Recomendação**: I Promover capacitações regulares para os profissionais responsáveis pelo preenchimento dos dados nos sistemas de informação em saúde, reforçando a importância da veracidade, precisão e compatibilidade dos registros com a estrutura e os recursos disponíveis, conforme as competências do ente municipal em relação ao CNES, dispostas nos Artigos 366 e 369 da Portaria de Consolidação GM/MS nº 1/2017, e em consonância com o Art. 18 da Lei nº 8.080/1990, que atribui à direção municipal do Sistema de Saúde (SUS) o controle e avaliação das ações e os serviços de saúde; II Estabelecer rotinas periódicas de conciliação e auditoria interna que verifiquem a coerência entre os dados registrados no CNES e SIA/SUS e a capacidade real da unidade, considerando estrutura física, equipamentos e força de trabalho disponível, em conformidade com as competências do ente municipal em relação ao CNES, dispostas nos Artigos 366 e 369 da Portaria de Consolidação GM/MS nº 1/2017, e em consonância com o Art. 18 da Lei nº 8.080/1990, que atribui à direção municipal do Sistema de Saúde (SUS) o controle e avaliação das ações e os serviços de saúde; III Implementar medidas corretivas e preventivas que assegurem a fidelidade das informações registradas no SIA/SUS, garantindo que a produção ambulatorial declarada corresponda, de fato, aos atendimentos realizados e que os registros sejam efetuados com base na documentação comprobatória da execução dos serviços, em consonância com as competências do ente municipal em relação ao CNES, dispostas nos Artigos 366 e 369 da Portaria de Consolidação GM/MS nº 1/2017, e com o Art. 18 da Lei nº 8.080/1990, que atribui à direção municipal do Sistema de Saúde (SUS) o controle e avaliação das ações e os serviços de saúde. Essas ações visam atender o art. 18 da Lei nº 8.080/1990, que atribui a competência à direção municipal do Sistema de Saúde (SUS) o controle e avaliação das ações e os serviços de saúde.
>
> **Análise Codificação**: A recomendação sugere ações corretivas para resolver a condição de falta de documentos comprobatórios, como implementar medidas corretivas e preventivas para assegurar a fidelidade das informações. Além disso, propõe ações com foco na causa, como capacitações regulares e rotinas de auditoria interna, que visam prevenir a reincidência ao abordar deficiências na capacitação e processos. Essas ações são específicas, pois vão além do mero cumprimento normativo, e os efeitos duradouros são alcançados através de mudanças estruturais que podem persistir independentemente de mudanças de pessoal.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19742, Constatação Nº 691783

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: Não há registro padronizado no processo de inspeção na entrada e saída dos imunobiológicos que asseguram a integridade física e as condições de temperatura adequada.
>
> **Recomendação**: Implementar um sistema de registro padronizado para o documentar as inspeções na entrada e saída dos imunobiológicos, com foco na verificação da integridade física dos produtos, desenvolver checklists visuais e documentos de fácil preenchimento para que a equipe possa seguir e registrar rapidamente as condições dos imunobiológicos durante a entrada e saída, facilitando a adoção desses procedimentos no dia a dia e adotar sistemas de monitoramento automatizado que registrem continuamente a temperatura durante o armazenamento e transporte, gerando relatórios, conforme descrito nos Incisos I, II e III do art. 56, da Seção VI, da RDC Nº 430/2020 referente a verificação e registro das condições de transporte e armazenamento, incluindo requisitos de temperatura, umidade e exposição à luz, além da conferência de lotes, datas de validade, quantidades e integridade das cargas recebidas.
>
> **Análise Codificação**: A recomendação sugere ações corretivas para resolver a condição encontrada, como a implementação de um sistema de registro padronizado e checklists, que abordam diretamente a falta de registros. Além disso, propõe ações com foco na causa, como o desenvolvimento de documentos de fácil preenchimento e sistemas de monitoramento automatizado, visando prevenir a reocorrência ao facilitar a adoção de procedimentos e garantir a continuidade dos registros. No entanto, a referência ao cumprimento da RDC Nº 430/2020 é genérica, mas as ações específicas vão além disso. Os efeitos duradouros são considerados, pois as melhorias no sistema e na documentação podem persistir independentemente de mudanças na equipe.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19885, Constatação Nº 702344

> **Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS
>
> **Constatação**: Há inconsistências no registro de procedimento entre os dados clínicos e os dados dos instrumentos de cobrança.
>
> **Recomendação**: Recomenda-se a Secretaria de Estado da Saúde de São Paulo e ao Departamento Regional de Saúde II quanto a mudança de procedimento sem a solicitação e/ou autorização do auditor/gestor, o que configura glosa parcial (glosar a diferença entre o valor cobrado e o valor do procedimento autorizado inicialmente) conforme disposto nos subitens 16 e 48 quanto a cobrança de quimioterapia, sem a comprovação de prescrição médica e de formulário de controle de frequência individual, devidamente assinado (paciente/responsável) dispostos no item Motivo de Glosas do Caderno de Orientações Técnicas sobre a Aplicação de Glosas em Auditoria no SUS, aprovado pela Portaria de nº 26 de 17 de junho do ano de 2005 e corroborado pelo Manual de Bases Técnicas em Oncologia do ano de 2022 -Ministério da Saúde, quanto a: Os gestores devem executar um monitoramento contínuo, com auditorias periódicas in loco, disposto em sua página 100 e ainda, orientações para registro e faturamento de atendimentos procedidos, e embutem a responsabilidade do SUS por seu reconhecimento e pagamento, conforme os seus atributos, competindo à auditoria da Secretaria Gestora auditar os prontuários e os laudos patológicos disposto na página 47 do mesmo Manual. Assim, terá melhor orientação do autorizador ao hospital e, também, a verificação, pelo auditor, do descritivo do ato operatório e do laudo patológico da peça operatória, dentre outros, conforme preconizado em sua página 44.
>
> **Análise Codificação**: A recomendação aborda a inconsistência no registro de procedimentos entre dados clínicos e instrumentos de cobrança, sugerindo a glosa parcial como ação corretiva imediata para a condição encontrada. Além disso, propõe que os gestores executem monitoramento contínuo com auditorias periódicas in loco e orientações para registro e faturamento, o que visa tratar a causa subjacente (falhas no controle e monitoramento) de forma específica, indo além do mero cumprimento de normativos. Essas ações de monitoramento e auditoria contínuos têm efeitos duradouros, pois estabelecem processos que permanecem independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19615, Constatação Nº 675042

> **Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena
>
> **Constatação**: Ausência de comprovação da capacidade técnica e operacional da Missão Evangélica Caiuá para realização do objeto e das atividades previstas no Convênio nº 882478/2019 - DSEI Manaus.
>
> **Recomendação**: Adotar providências no sentido de estabelecer critérios de avaliação objetivos para a demonstração da capacidade gerencial, técnica e operacional das proponentes como requisito obrigatório nos chamamentos públicos para a seleção de entidades sem fins lucrativos que prestam serviços complementares de atenção à saúde indígena. Observando não somente a composição do corpo profissional da entidade, mas também a comprovação da existência de instalações adequadas para atendimento ao convênio, em conformidade ao estabelecido no art. 116, caput, no art. 27, inciso II, e art. 55, inciso XIII, da Lei 8.666/1993, expressa no § 2º do art. 1º e no V do art. 16 da Portaria Interministerial MP/MF/CGU nº 424 de 2016. Aprimorar também os instrumentos de análise como pareceres técnicos de mérito e técnicos-econômico, no sentido de atender ao preconizado no inciso II, art. 8º, da Portaria Interministerial MP/MF/CGU nº 424 de 2016.
>
> **Análise Codificação**: A recomendação sugere ações para corrigir a condição encontrada, como estabelecer critérios objetivos e aprimorar instrumentos de análise. Além disso, propõe ações específicas para tratar a causa subjacente, como a criação de critérios de avaliação e aprimoramento de pareceres técnicos, que vão além do mero cumprimento normativo. Essas ações visam efeitos duradouros, pois a implementação de critérios e instrumentos permanece independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19745, Constatação Nº 694776

> **Finalidade**: Verificar se a CMRF possui controles internos capazes de assegurar adequadamente a Cadeia de Frios
>
> **Constatação**: A Central Municipal da Rede de Frio - CMRF de Manacapuru não estabelece programas de treinamento regulares, especialmente para procedimentos, equipamentos e tecnologias relacionadas à Cadeia de Frio.
>
> **Recomendação**: Adotar medidas para realização de treinamentos, de acordo com o Subitem 7.4, Item 7, pág. 78/79, do Manual de Rede Frio do PNI de 2017 e arts. 32 e 33 da RDC Anvisa nº 63/2011 os quais recomendam: Elaboração de um Plano Anual de Capacitação que identifique as necessidades de treinamento específico para os profissionais da CMRF, com foco em procedimentos, equipamentos e tecnologias relevantes para a rede de frios; Mapeamento das necessidades de Capacitação: Realizar um levantamento das competências necessárias para as atividades desempenhadas, envolvendo a equipe na identificação de lacunas de conhecimentos habilidade, possibilitando alinhar os treinamentos às necessidades reais da CMRF; Registros e relatórios de Execução, implementação de um sistema de registro que documente todas as ações de capacitação realizadas, incluindo participantes, conteúdos abordados e resultados obtidos, de forma a facilitar a avaliação e aprimoramento contínuo do plano; Capacitação contínua e atualização: Promover treinamentos regulares e atualizações sobre a Rede de Frios, utilizando recursos como webinars, cursos online e parcerias com instituições de ensino e pesquisa; Treinamento dos motoristas: Desenvolver um programa específico de capacitação para os motoristas terceirizados responsáveis pelo transporte de Imunobiológicos. Ainda, deverá buscar parcerias com Instituições de ensino, Órgãos governamentais e Organizações não Governamentais para oferecer cursos e capacitações sobre a Rede de Frios. As recomendações acima propostas, têm o objetivo, além do atendimento às exigências regulatórias, a garantia de que os profissionais da CMRF/Manacapuru estejam preparados para realizar suas funções, melhorando a eficiência e qualidade dos serviços prestados e a segurança dos Imunobiológicos.
>
> **Análise Codificação**: A recomendação sugere ações para resolver a condição encontrada (falta de treinamentos regulares) por meio da elaboração de um plano anual de capacitação, mapeamento de necessidades, implementação de sistema de registro e realização de treinamentos contínuos. Além disso, propõe ações específicas para tratar a causa subjacente (falta de estruturação de programas de treinamento), como o desenvolvimento de um programa específico para motoristas e a busca de parcerias com instituições externas, indo além do mero cumprimento de normativos. Essas ações específicas visam criar uma estrutura permanente de capacitação, cujos efeitos podem perdurar mesmo com mudanças de atores, devido à institucionalização dos processos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19829, Constatação Nº 697111

> **Finalidade**: Auditoria na PNSMAD - 2024
>
> **Constatação**: Os registros dos atendimentos em saúde mental não estão sendo coletados de forma detalhada e atualizada nas UBS visitadas.
>
> **Recomendação**: Atender os subitens X e XV do item 4.1 referente ao Capítulo I do Anexo da a Portaria de Consolidação n. 2, de 28 de setembro de 2017, Anexo 1 do Anexo XXII (texto originário da antiga Portaria n. 2.436, de 21 de setembro de 2017) que citam respectivamente que dentre as atribuições dos profissionais da atenção básica estão: a utilização do Sistema de Informação da Atenção Básica vigente para registro das ações de saúde na Atenção Básica, visando subsidiar a gestão, planejamento, investigação clínica e epidemiológica, e à avaliação dos serviços de saúde; e a alimentação e garantia da qualidade do registro das atividades nos sistemas de informação da atenção básica, conforme normativa vigente.
>
> **Análise Codificação**: A recomendação se limita a citar a necessidade de cumprir subitens de uma portaria, sem propor ações concretas para resolver a condição encontrada de registros inadequados ou para abordar a causa subjacente. Ela é genérica e não especifica medidas corretivas ou preventivas.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19857, Constatação Nº 702622

> **Finalidade**: Verificar a regularidade da execução da emenda parlamentar federal nº 3630007.
>
> **Constatação**: Funcionários contratados para duas funções diferentes no mesmo período.
>
> **Recomendação**: Tomar conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelecido no art. 3º da Portaria GM/MS n.º 885/2021, visando a elisão do dano e/ou impropriedade ocorrida com recursos de origem federal, indicado no Capítulo IX - Proposição de Devolução deste relatório.
>
> **Análise Codificação**: A recomendação solicita que o destinatário tome conhecimento da constatação e adote procedimentos conforme a Portaria GM/MS n.º 885/2021, sem especificar ações concretas para resolver a condição imediata (funcionários contratados para duas funções no mesmo período) ou para tratar a causa subjacente. A referência à portaria é genérica e não detalha medidas específicas de correção ou prevenção.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19892, Constatação Nº 704051

> **Finalidade**: Realizar auditoria de oncologia, SIA e SIH, na Santa Casa de Misericórdia de Patos de Minas/MG
>
> **Constatação**: Inconsistências no início da realização de quimioterapia adjuvante (profilática) até 60 dias após a realização da cirurgia oncológica.
>
> **Recomendação**: Cumprir a Resolução CFM nº 1931/09 em seu Capítulo III, sobre Responsabilidade Profissional, no Art. 87, diz que é vedado ao médico deixar de elaborar prontuário legível para cada paciente. § 1º O prontuário deve conter os dados clínicos necessários para a boa condução do caso, sendo preenchido, em cada avaliação, em ordem cronológica com data, hora, assinatura e número de registro do médico no Conselho Regional de Medicina.
>
> **Análise Codificação**: A recomendação se limita a citar o cumprimento de uma resolução do CFM sobre a elaboração de prontuários legíveis, sem propor ações específicas para resolver a condição encontrada (inconsistências no início da quimioterapia adjuvante) ou para tratar a causa subjacente que permitiu essa condição. Ela é genérica e não direcionada à correção imediata ou à causa raiz do problema.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19312, Constatação Nº 657763

> **Finalidade**: Verificar a regularidade da utilização de Dispositivos Médicos Implantáveis - DMI
>
> **Constatação**: Há cobrança ao SUS de código de OPME incompatível e/ou em quantidade superior com a OPME efetivamente implantada nos pacientes.
>
> **Recomendação**: Atender as definições referentes ao limite quantitativo de OPME-DMI, contidas no item 23 do Manual Técnico Operacional do Sistema de Informação Hospitalar (SIH/SUS, 2017), aprovado pela Portaria GM/MS nº 396, de 12 de abril de 2000.
>
> **Análise Codificação**: A recomendação consiste em uma instrução genérica para cumprir um normativo específico, sem propor ações concretas para corrigir a condição encontrada ou endereçar a causa subjacente. Não há sugestões de medidas corretivas diretas para resolver a discrepância na cobrança, nem ações específicas para prevenir a recorrência, focando apenas na adesão a um manual existente.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19770, Constatação Nº 693848

> **Finalidade**: Verificar a regularidade da produção inserida nos sistemas SIA-SIH/SUS para incremento do teto MAC.
>
> **Constatação**: A Secretaria Municipal de Saúde (SMS) de Carapebus/RJ não disponibilizou a totalidade da documentação solicitada pela SEAUD/RJ para realização da atividade de auditoria.
>
> **Recomendação**: Observar o art. 11 do Decreto nº 1.651/1995, o qual determina que os órgãos do SUS e as entidades privadas, que dele participarem de forma complementar, prestem ao pessoal em exercício no SNA e à Comissão Corregedora, quando exigidos, toda informação necessária ao desempenho das atividades de controle, avaliação e auditoria, facilitando-lhes o acesso a documentos, pessoas e instalações.
>
> **Análise Codificação**: A recomendação se limita a citar um dispositivo legal que exige o fornecimento de informações e acesso para auditoria, sem propor ações específicas para corrigir a condição imediata de não disponibilização da documentação ou para abordar as causas subjacentes, como falhas em processos ou treinamento.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19761, Constatação Nº 693150

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: Os profissionais atuantes na Central Municipal da Rede de Frio não estão devidamente cadastrados no Cadastro Nacional de Estabelecimentos de Saúde (Cnes).
>
> **Recomendação**: Manter atualizado no Cnes os dados dos profissionais que efetivamente atuam na CMRF de Gurupi/TO, em conformidade com o disposto no artigo 294 da Portaria de Consolidação GM/MS n.º 1/2017, que estabelece a obrigatoriedade de alimentação mensal e sistemática do Cadastro Nacional de Estabelecimentos de Saúde (Scnes).
>
> **Análise Codificação**: A recomendação sugere uma ação para resolver a condição encontrada, que é a falta de cadastro atualizado dos profissionais no Cnes, ao propor a manutenção atualizada dos dados. Em relação ao foco na causa, a ação proposta é genérica, pois se limita a cumprir o normativo existente sem especificar medidas adicionais para prevenir a recorrência, como implementação de processos de revisão ou treinamentos. Quanto aos efeitos duradouros, como a ação é genérica, não há indicação de que os efeitos persistiriam com mudanças de atores.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19771, Constatação Nº 692740

> **Finalidade**: Realizar auditoria de monitoramento referente à Auditoria nº 17847.
>
> **Constatação**: O Hospital Estadual Carlos Chagas (HECC) necessita de reparos de manutenção.
>
> **Recomendação**: Realizar os devidos ajustes e reformas nas instalações físicas da edificação, de modo a obedecer ao disposto no Art. 36 da Resolução RDC ANVISA n.° 63, de 25 de novembro de 2011.
>
> **Análise Codificação**: A recomendação sugere realizar ajustes e reformas para corrigir a condição de necessidade de reparos de manutenção, o que caracteriza uma ação corretiva. No entanto, a ação proposta é genérica, limitando-se a cumprir um normativo (Art. 36 da RDC ANVISA n.° 63/2011) sem especificar medidas concretas para abordar a causa subjacente, como falhas em processos de manutenção preventiva ou alocação de recursos. Portanto, não há uma ação específica focada na causa, e os efeitos duradouros não são aplicáveis devido à natureza genérica da recomendação.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19335, Constatação Nº 665846

> **Finalidade**: Verificar a regularidade da utilização de Dispositivos Médicos Implantáveis - DMI.
>
> **Constatação**: Houve cobrança ao SUS de Órteses, Próteses e Materiais Especiais (OPME) em quantidade superior à implantada, referente ao código 07.02.05.038-5 Parafuso de Titânio associável a Haste, Tipo Pedicular, Monoaxial.
>
> **Recomendação**: À SAES, para adoção de medidas cabíveis de apuração para a cobrança administrativa com vistas à recomposição do recurso ao Fundo Nacional de Saúde, conforme estabelece o art. 3º da Portaria GM/MS nº 885, de 04/05/2021, combinado com o Inciso VIII, do art. 2º, do Decreto nº 3.964, de 10/10/2001, visando à elisão do dano ocorrida com recursos de origem federal indicados no Capítulo Proposição de Devolução no valor de R\$ 3.281,92 (três mil, duzentos e oitenta e um reais e noventa e dois centavos), com acréscimos legais, observados os princípios norteadores dos processos administrativos.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva específica para resolver a condição encontrada de cobrança excessiva, que é a apuração e cobrança administrativa para devolução do recurso. No entanto, a ação proposta para tratar a causa que permitiu a ocorrência da condição é genérica, limitando-se a citar o cumprimento de normativos (Portaria GM/MS nº 885/2021 e Decreto nº 3.964/2001), sem propor medidas concretas para prevenir futuras ocorrências, como revisão de processos de controle ou capacitação. Como a ação de foco na causa é genérica, a avaliação de efeitos duradouros não se aplica de forma positiva.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19434, Constatação Nº 665070

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil/PFPB
>
> **Constatação**: Registro de dispensação de medicamentos pelo Programa Farmácia Popular do Brasil sem a comprovação das aquisições por meio de notas fiscais, no período de janeiro de 2018 a junho de 2020.
>
> **Recomendação**: Ao Departamento de Assistência Farmacêutica e Insumos Estratégicos-DAF/SCTIE/MS para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelece o inciso IV, do artigo 17, do Decreto nº 9.795, de 17.05.2019, combinado com o inciso VIII, do artigo 2º, do Decreto nº 3.964, de 10.10.2001, visando à elisão do dano e/ou impropriedade ocorrida com recursos de origem federal com características de PREJUÍZO, indicado no capítulo PROPOSIÇÃO DE DEVOLUÇÃO do presente relatório, no valor de R\$ 73.185,87 (setenta e três mil, cento e oitenta e cinco reais e oitenta e sete centavos), com os acréscimos legais, observados os princípios norteadores dos processos administrativos. Poderá, também, deduzir dos valores retidos referentes as competências de maio e junho de 2020 e ainda não pagos ao estabelecimento farmacêutico a importância de R\$ 3.547,18 (três mil, quinhentos e quarenta e sete reais e dezoito centavos), cuja regularidade das dispensações não ficou comprovada.
>
> **Análise Codificação**: A recomendação se limita a citar dispositivos legais genéricos (Decreto nº 9.795/2019 e Decreto nº 3.964/2001) sem propor ações específicas para tratar a causa da dispensação irregular de medicamentos. A ação sugerida é genérica ('adoção dos procedimentos a seu cargo'), sem detalhamento de medidas concretas para prevenir a reincidência. Embora mencione a possibilidade de dedução de valores, isso se caracteriza como uma ação corretiva para resolver a condição atual, mas não há proposta de ação focada na causa.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19721, Constatação Nº 692918

> **Finalidade**: Apurar possíveis irregularidades na execução de Convênios n. 01/2022 e 03/2019 entre SESPA/Hospitais
>
> **Constatação**: O HSAMZ não possui a quantidade de profissionais/especialidades previstas na legislação vigente e contratualizados no Convênio Assistencial nº 01/2022.
>
> **Recomendação**: Adotar providências, junto ao Hospital conveniado, no sentido de que seja disponibilizado o quantitativo de profissionais necessários ao pleno funcionamentos dos serviços, conforme estabelecido no Inciso V do artigo 8º do Anexo XXIV, Capítulo III do Anexo 2, Seção II Do Eixo de Assistência Hospitalar, da Portaria de Consolidação GM/MS nº 2, de 28/09/2017, combinado com a alínea `g`, do Inciso II- Da Gestão, Cláusula Sétima - Dos Deveres da Convenente, do Convênio Assistencial nº 01/2022 e subitem 1.3 - Recursos Humanos, Eixo 1 do 5º Termo Aditivo do Convênio Assistencial n° 1/2022.
>
> **Análise Codificação**: A recomendação sugere que o destinatário adote providências para disponibilizar o quantitativo de profissionais necessário, o que constitui uma ação para resolver a condição encontrada de falta de profissionais. No entanto, a recomendação se limita a citar o cumprimento de normativos existentes (Portaria de Consolidação e cláusulas do convênio), sem propor ações concretas adicionais para tratar a causa subjacente que permitiu a ocorrência da condição, como a implementação de um processo de contratação ou revisão de políticas de recursos humanos. Portanto, a ação com foco na causa é genérica, baseada apenas no cumprimento de normativos, e não específica. Como a ação com foco na causa é genérica, os efeitos duradouros não são avaliados como presentes.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19402, Constatação Nº 663323

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil (PFPB)
>
> **Constatação**: Irregularidades em cupons e prescrições médicas apresentadas pelo estabelecimento comercial, referentes ao período de janeiro de 2018 até julho de 2019.
>
> **Recomendação**: Ao Departamento de Assistência Farmacêutica e Insumos Estratégicos - DAF/SCTIE/MS para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelece o art. 12, do ANEXO I do Decreto nº 11.358, de 1º de janeiro de 2023, combinado com o inciso VIII do art. 2º do Decreto nº 3.964, de 10 de outubro de 2001, visando à elisão do dano ou impropriedade ocorrida com recursos de origem federal, indicado no Capítulo ''Proposição de Devolução'', do presente Relatório, com os acréscimos legais, observados os princípios norteadores dos processos administrativos.
>
> **Análise Codificação**: A recomendação se limita a encaminhar a constatação ao órgão responsável para adoção de procedimentos conforme dispositivos legais mencionados, sem especificar ações concretas para resolver a condição encontrada ou tratar suas causas subjacentes. Não há menção a medidas específicas de correção ou prevenção.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19513, Constatação Nº 671421

> **Finalidade**: Apurar a regularidade da produção inserida nos sistemas do SUS com incremento nos tetos PAB e MAC
>
> **Constatação**: Inserção e não comprovação das produções ambulatoriais da Atenção Especializada de procedimentos informados no Sistema de Informações Ambulatoriais do SUS (SIA/SUS), nos exercícios de 2020 e 2021.
>
> **Recomendação**: À Secretária Atenção Especializada à Saúde (SAES/MS) para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelecido no Art. 25, do Decreto n.º 11.358, de 1º de janeiro de 2023, objetivando melhor controle, monitoramento e avaliação das produções informadas pelos municípios.
>
> **Análise Codificação**: A recomendação não propõe ações específicas para resolver a condição encontrada de inserção e não comprovação das produções ambulatoriais, limitando-se a encaminhar a constatação para conhecimento e adoção de procedimentos conforme um decreto, sem detalhar ações corretivas ou focadas na causa.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19496, Constatação Nº 670138

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil/PFPB
>
> **Constatação**: Não apresentação de cópias da totalidade dos cupons vinculados e receitas médicas solicitadas.
>
> **Recomendação**: Ao Departamento de Assistência Farmacêutica e Insumos Estratégicos - DAF/SECTICS/MS para conhecimento da presente constatação, conforme estabelecem os artigos 12 e 34 do Decreto nº 11.358, de 01/01/2023, combinado com o Inciso VIII do art. 2º do Decreto nº 3.964, de 10/10/2001, visando à elisão do dano e/ou impropriedade ocorrida com recursos de origem federal, indicado Anexo VII - Proposição de Devolução - Relatório Final, do presente relatório, com os devidos acréscimos legais, observados os princípios norteadores dos processos administrativos.
>
> **Análise Codificação**: A recomendação não propõe ações específicas para resolver a condição encontrada (não apresentação de cópias dos cupons e receitas médicas) ou para tratar a causa subjacente. Ela apenas encaminha a constatação para conhecimento do departamento, citando dispositivos legais, sem sugerir medidas corretivas ou preventivas concretas.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19248, Constatação Nº 692555

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil/PFPB
>
> **Constatação**: O estabelecimento auditado não apresentou os documentos necessários para o seu funcionamento.
>
> **Recomendação**: Encaminhar a documentação quando solicitada pelos órgãos de controle, atendendo o artigo 11 do Decreto 1.651, de 28 de setembro de 1995, que estabelece que os órgãos do SUS e as entidades privadas, que dele participarem de forma complementar, ficam obrigados a prestar, quando exigidos, ao pessoal em exercício no SNA, toda informação necessária ao desempenho das atividades de controle, avaliação e auditoria, como também o disposto no Art. 36 do Anexo LXXVII da Portaria de Consolidação nº 5, de 28/09/2017, onde dispõe que o MS solicitará ao estabelecimento credenciado a prestação de informações sobre as suas operações, bem como as cópias dos documentos previstos nesta Portaria e na legislação vigente.
>
> **Análise Codificação**: A recomendação se limita a citar a obrigação legal de fornecer documentos quando solicitados, sem propor ações específicas para resolver a condição imediata ou abordar a causa subjacente da falta de documentação.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19248, Constatação Nº 692560

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil/PFPB
>
> **Constatação**: O estabelecimento auditado não apresentou as cópias dos Cupons Vinculados/Fiscais e Receitas Médicas solicitadas no Comunicado de Auditoria.
>
> **Recomendação**: Ao Departamento de Assistência Farmacêutica e Insumos Estratégicos - DAF/SECTICS/MS para conhecimento da presente constatação, conforme estabelecem os artigos 12 e 34 do Decreto nº 11.358, de 01/01/2023, revogado pelo Decreto nº 11.798, 28/11/2023. combinado com o Inciso VIII do art. 2º do Decreto nº 3.964, de 10/10/2001, visando à elisão do dano e/ou impropriedade ocorrida com recursos de origem federal, indicado Anexo VII - Proposição de Devolução - Relatório Final, do presente relatório, com os devidos acréscimos legais, observados os princípios norteadores dos processos administrativos
>
> **Análise Codificação**: A recomendação não propõe uma ação específica para resolver a condição encontrada (falta de apresentação de cópias dos cupons e receitas), limitando-se a encaminhar a constatação para conhecimento e citar dispositivos legais, sem sugerir medidas corretivas ou preventivas. Não há menção a ações para corrigir a causa subjacente, como melhorias em processos ou controles internos.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19513, Constatação Nº 671421

> **Finalidade**: Apurar a regularidade da produção inserida nos sistemas do SUS com incremento nos tetos PAB e MAC
>
> **Constatação**: Inserção e não comprovação das produções ambulatoriais da Atenção Especializada de procedimentos informados no Sistema de Informações Ambulatoriais do SUS (SIA/SUS), nos exercícios de 2020 e 2021.
>
> **Recomendação**: Adotar providências para restituir ao Fundo Nacional de Saúde (FNS) o valor de R\$ 4.849.412,50 (quatro milhões, oitocentos e quarenta e nove mil, quatrocentos e doze reais e cinquenta centavos), atualizado monetariamente e com os acréscimos legais adotados por esse ente federado, conforme indicativo da Planilha de Proposição de devolução, referente aos recursos recebidos de forma indevida, provenientes de Emendas Parlamentares por informação adulterada, inserida nos sistemas do Ministério da Saúde, com base no item 9.3.4, do ACÓRDÃO n.º 1072/2017, do TCU, que prevê: "nos casos de débito decorrente do recebimento irregular de recursos federais pelos estados, municípios ou Distrito Federal, em razão de incorreções nas informações prestadas pelo beneficiário, independentemente do destino final dado aos recursos repassados, cabe ao ente recebedor restituir ao FNS, uma vez que não fazia jus ao repasse...". Ressalta-se ainda que é de responsabilidade dos Estados, Municípios e do Distrito Federal, conforme a gestão dos estabelecimentos, a alimentação dos Bancos de Dados Nacionais do SIA, de acordo com o previsto no § 1º, Art. 294, da Portaria de Consolidação GM/MS n.º 1, de 28/09/2017. ACÓRDÃO n.º 1072/2017 TCU - Plenário, item 9.3.4 e Portaria GM/MS n.º 684, de 30 de março de 2022, Capítulo II, do inciso II, item b , nos casos de débito decorrente do recebimento irregular de recursos federais pelos estados, municípios ou Distrito Federal, em razão de eventuais incorreções nas informações prestadas pelo beneficiário, independentemente do destino final dado aos recursos repassados, cabe ao ente recebedor restituir o Fundo Nacional de Saúde, uma vez que não fazia jus ao repasse, podendo, ainda, haver aplicação de multa ao agente público causador da irregularidade.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva específica de restituição de valores recebidos indevidamente, focando na correção da condição financeira irregular identificada. No entanto, não propõe ações para tratar as causas que permitiram a inserção de informações adulteradas nos sistemas, limitando-se a citar normativos existentes sem especificar medidas preventivas concretas.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19534, Constatação Nº 673071

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil/PFPB
>
> **Constatação**: O cidadão, L.V.L., não reconheceu a utilização e as dispensações de medicamentos pelo PFPB, realizadas no período de 29/05 a 09/10/2020, no estabelecimento auditado.
>
> **Recomendação**: Apresentar a documentação solicitada pelos órgãos de controle do SUS em observância a determinação contida no artigo 11 do Decreto Federal nº 1.651 de 28/09/1995.
>
> **Análise Codificação**: A recomendação sugere a apresentação de documentação para atender a uma exigência legal específica, o que constitui uma ação direta para resolver a condição encontrada de falta de reconhecimento das dispensações. No entanto, não propõe nenhuma ação adicional para tratar a causa subjacente que permitiu a ocorrência da condição, limitando-se ao cumprimento de um normativo existente.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19890, Constatação Nº 702473

> **Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS
>
> **Constatação**: Os procedimentos das AIHs pagas ao estabelecimento pelo procedimento 03.04.08.002-0 (internação para quimioterapia de administração contínua), não constam evoluídos em prontuário, detalhando sobre a administração (quimioterapia) endovenosa contínua de 24horas/dia.
>
> **Recomendação**: À Secretaria de Estado de Saúde Pública para conhecimento e adoção de providências para cobrança aos responsáveis identificados nesta constatação com vistas à devida devolução dos recursos federais ao Fundo Nacional de Saúde - FNS/SE/MS, no montante de R\$ 8.706,08 (oito mil, setecentos e seis reais, oito centavos) , decorrentes da não comprovação da realização de 07 (um) procedimentos de quimioterapia de administração contínua, conforme indicado na Proposição de Devolução, parte integrante desta Auditoria, com os devidos acréscimos legais, nos termos do disposto nos itens 9.4 e 9.5 do Acórdão TCU nº 785/2018 - Plenário, combinado com o art. 93 do Decreto Lei nº 200, de 25/02/1967, que disciplinam sobre a obrigatoriedade, de quem quer que utilize dinheiros públicos, de justificar seu bom e regular emprego na conformidade das leis, regulamentos e normas emanadas das autoridades administrativas competentes, bem como o art. 63 da Lei nº 4.320, de 17/03/1964, visando à elisão do dano ao erário.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva específica de cobrança e devolução de recursos federais para resolver a condição encontrada de pagamento por procedimentos não comprovados. No entanto, não propõe nenhuma ação adicional para tratar a causa subjacente que permitiu a ocorrência da condição, como melhorias em processos de registro ou fiscalização. A referência a normativos visa apenas embasar a devolução, sem propor ações concretas para prevenir recorrências.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19693, Constatação Nº 686409

> **Finalidade**: Verificar a regularidade da produção inserida nos sistemas do SUS.
>
> **Constatação**: A Secretaria Municipal de Saúde de Turiúba inseriu dados no Sistema de Informações Ambulatoriais - SIA/SUS do procedimento de Unidade de remuneração para deslocamento de acompanhante por transporte terrestre (cada 50 km de distância) e do procedimento Unidade de remuneração para deslocamento de paciente por transporte terrestre (cada 50 km) no exercício de 2021, da Unidade Básica de Saúde Benedito Ap. Fabricio dos Santos e não comprovou a realização dos procedimentos, ocasionando proposta de devolução dos recursos recebidos.
>
> **Recomendação**: Restituir o FNS, o valor total de R\$ 501.568,65, conforme o contido no item 9.3.4, do ACÓRDÃO Nº 1072/2017 do TCU, que prevê: nos casos de débito decorrente do recebimento irregular de recursos federais pelos estados, municípios ou Distrito Federal, em razão de eventuais incorreções nas informações prestadas pelo beneficiário, independentemente do destino final dado aos recursos repassados, cabe ao ente recebedor restituir o Fundo Nacional de Saúde, uma vez que não fazia jus ao repasse, podendo, ainda, haver aplicação de multa ao agente público causador da irregularidade.
>
> **Análise Codificação**: A recomendação se limita a exigir a restituição dos recursos recebidos irregularmente, conforme determinado por acórdão do TCU, sem propor nenhuma ação para corrigir a causa subjacente que permitiu a inserção de dados não comprovados no sistema. Não há sugestão de medidas preventivas, como melhorias nos processos de registro ou verificação de dados, que evitem a recorrência do problema.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 18714, Constatação Nº 671371

> **Finalidade**: Verificar a regular utilização de recursos da fonte n°117 na aquisição de veículos pela SMS.
>
> **Constatação**: Os recursos transferidos pelo Fundo Nacional de Saúde - FNS/MS referente às Emendas Parlamentares nº 27920010, 3724007 e 3815005, foram aplicados intempestivamente no mercado financeiro.
>
> **Recomendação**: Dar ciência aos responsáveis pela irregularidade registrada nesta constatação para que providenciem a restituição ao Fundo Nacional de Saúde o valor de R\$ 15.676,43 (quinze mil, seiscentos e setenta e seis reais e quarenta e três centavos), atualizado monetariamente e com os acréscimos legais, conforme indicativo na Planilha de Proposição de Devolução, parte integrante deste Relatório, em cumprimento ao item 9.3.3 do Acórdão/TCU nº 1.072/2017 - Plenário, visando à elisão do dano ao erário.
>
> **Análise Codificação**: A recomendação propõe a restituição do valor aplicado intempestivamente, o que constitui uma ação para corrigir a condição encontrada (aplicação indevida dos recursos). No entanto, não há nenhuma ação sugerida para tratar a causa que permitiu a ocorrência da condição, como a implementação de controles ou políticas para prevenir futuras aplicações irregulares. A recomendação limita-se a cumprir um normativo específico (Acórdão/TCU) sem propor ações adicionais para endereçar a causa raiz.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19748, Constatação Nº 690833

> **Finalidade**: Verificar a regularidade da produção inserida nos sistemas do SUS.
>
> **Constatação**: A SMS de Ponto Belo não comprovou a execução da produção do serviço de TSE inserida no Sistema de Informações Ambulatoriais (SIA-SUS) no exercício de 2022.
>
> **Recomendação**: À Secretaria de atenção Especializada à Saúde - SAES/MS para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelecido na art. 3º da Portaria GM/MS nº 885/2021, visando a elisão do dano e/ou impropriedade ocorrida com recursos de origem federal, indicado no Capítulo "Proposição de Devolução" deste relatório.
>
> **Análise Codificação**: A recomendação não propõe ações específicas, apenas cita a adoção de procedimentos conforme um normativo existente (Portaria GM/MS nº 885/2021) e refere-se a um capítulo externo para detalhes. Não há sugestão de ação corretiva direta para resolver a condição encontrada, nem ações focadas na causa que levou à não comprovação da produção.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19770, Constatação Nº 693848

> **Finalidade**: Verificar a regularidade da produção inserida nos sistemas SIA-SIH/SUS para incremento do teto MAC.
>
> **Constatação**: A Secretaria Municipal de Saúde (SMS) de Carapebus/RJ não disponibilizou a totalidade da documentação solicitada pela SEAUD/RJ para realização da atividade de auditoria.
>
> **Recomendação**: Observar o disposto na Lei 12.527, de 12 de novembro de 2011, Art. 32. Constituem condutas ilícitas que ensejam responsabilidade do agente público ou militar: I - recusar-se a fornecer informação requerida nos termos desta Lei, retardar deliberadamente o seu fornecimento ou fornecê-la intencionalmente de forma incorreta, incompleta ou imprecisa.
>
> **Análise Codificação**: A recomendação não propõe uma ação específica para resolver a condição encontrada, que é a não disponibilização da documentação solicitada. Em vez disso, ela apenas cita uma lei que define condutas ilícitas, sem sugerir medidas concretas para corrigir a condição ou abordar a causa subjacente. Portanto, não há uma ação corretiva ou foco na causa, sendo a recomendação genérica e não aplicável para efeitos duradouros.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19522, Constatação Nº 673639

> **Finalidade**: Apurar a regularidade da produção inserida nos sistemas do SUS com incremento nos tetos PAB e MAC
>
> **Constatação**: A Secretaria Municipal de Saúde de Lima Campos não alimentou no Sistema de Informação Ambulatorial a totalidade dos atendimentos realizados no Hospital Municipal de Lima Campos, CNES n.º 2656159, Centro de Atendimento para Enfrentamento a COVID 19, CNES n.º 0196355 e no Centro de Saúde Dr. Paulo Bogéa, CNES n.º 2459841 referente aos procedimentos de Atendimento de Urgência com Observação até 24 horas em Atenção Especializada, Código 03.01.06.002-9, Atendimento de Urgência em Atenção Especializada, Código 03.01.06.006-1 e Consulta Médica em Atenção Especializada, Código 03.01.01.007-2, no exercício de 2020.
>
> **Recomendação**: À Secretária Atenção Especializada à Saúde (SAES/MS) para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelecido no Art. 25, do Decreto n.º 11.358, de 1º de janeiro de 2023, combinado com o inciso VIII do Art. 2º do Decreto n.º 3.964, de 11 de outubro de 2001 e Portaria GM/MS n.º 885, de 4 de maio de 2021, visando a elisão do dano e/ou impropriedade ocorrida com recursos de origem federal, indicado no Anexo - Proposição de Devolução.
>
> **Análise Codificação**: A recomendação não propõe ações específicas para resolver a condição encontrada (falta de alimentação dos atendimentos no sistema) ou para tratar a causa subjacente. Ela apenas encaminha a constatação para outro órgão (SAES/MS) para adoção de procedimentos conforme normativos citados, sem detalhar quais ações devem ser tomadas.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19439, Constatação Nº 663790

> **Finalidade**: Apurar a regularidade da produção inserida nos sistemas do SUS com incremento nos tetos PAB e MAC
>
> **Constatação**: O Município de Santa Quitéria do Maranhão não possui Setor de Controle, Avaliação e Monitoramento das ações e serviços de saúde implantado e organizado, não havendo acompanhamento e análise da produção ambulatorial e hospitalar informados nos Sistemas de Informação Ambulatorial e Hospitalar - SIA/SIH/SUS, pela gestão municipal de saúde.
>
> **Recomendação**: Cumprir com o inciso I, do Art. 15 da Lei nº 8.080, de 19/09/1990 e suas atualizações, que preconiza para União, os Estados, o Distrito Federal e os Municípios as atribuições de definição das instâncias e mecanismos de controle, avaliação e de fiscalização das ações e serviços de saúde e o inciso I, do Art.18, da mesma Portaria que atribui à direção municipal do Sistema de Saúde (SUS) a competência de planejar, organizar, controlar e avaliar as ações e os serviços de saúde e gerir e executar os serviços públicos de saúde, assim como os incisos I e II, do Art. 295 da Portaria de Consolidação GM/MS nº 01, de 28/09/2017, que define a sistemática de alimentação dos Bancos de Dados Nacionais dos Sistemas de Informação em Saúde SIA, SIH e SCNES.
>
> **Análise Codificação**: A recomendação se limita a citar dispositivos legais e normativos que devem ser cumpridos, sem propor ações específicas para implementar um Setor de Controle, Avaliação e Monitoramento ou para corrigir a falta de acompanhamento da produção ambulatorial e hospitalar. Não há menção a ações concretas para resolver a condição encontrada ou para tratar suas causas subjacentes.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19616, Constatação Nº 676190

> **Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena
>
> **Constatação**: Ausência de contratos com agências de turismos para prestação de serviços referentes à aquisição de passagens aéreas e de hospedagem para atendimento ao Convênio nº 878450/2018.
>
> **Recomendação**: Notificar a convenente para apresentação de justificativas quanto ao constatado, em conformidade ao previsto no § 1º, art. 54, da Lei 8.666/93; art. 45 da Portaria MP/MF/CGU nº 424/2016.
>
> **Análise Codificação**: A recomendação solicita apenas a apresentação de justificativas para a ausência de contratos, sem propor ações para resolver a condição encontrada ou endereçar suas causas subjacentes. Portanto, não há uma recomendação de ação corretiva ou foco na causa, sendo apenas uma solicitação de informação.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19885, Constatação Nº 702195

> **Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS
>
> **Constatação**: Há inconsistência na codificação do procedimento sequencial em oncologia, nos casos de mastectomia radical.
>
> **Recomendação**: À Secretaria de Estado da Saúde de São Paulo/SP para conhecimento e adoção de providências para cobrança aos responsáveis identificados nesta constatação com vistas à devolução dos recursos federais ao Fundo Nacional de Saúde - FNS/SE/MS, no montante de R\$ 58.389,45 (cinquenta e oito mil, trezentos e oitenta e nove reais e quarenta e cinco centavos), decorrentes de pagamentos de procedimentos em desacordo com os comprovados nos prontuários dos pacientes, conforme indicado na Proposição de Devolução, parte integrante desta Auditoria, com os devidos acréscimos legais, nos termos do disposto nos itens 9.4 e 9.5 do Acórdão TCU nº 785/2018 - Plenário, combinado com o art. 93 do Decreto Lei nº 200, de 25/02/1967, que disciplinam sobre a obrigatoriedade, de quem quer que utilize dinheiros públicos, de justificar seu bom e regular emprego na conformidade das leis, regulamentos e normas emanadas das autoridades administrativas competentes, bem como o art. 63 da Lei nº 4.320, de 17/03/1964.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva específica para resolver a condição encontrada, que é a devolução dos recursos federais pagos indevidamente devido à inconsistência na codificação do procedimento sequencial em oncologia. No entanto, a recomendação não propõe ações para corrigir a causa subjacente que levou à inconsistência na codificação, limitando-se a citar o cumprimento de normativos gerais sem especificar medidas concretas para prevenir a recorrência do problema.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19797, Constatação Nº 691573

> **Finalidade**: Verificar se a SEMSA possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: A estrutura física da CMRF não atende aos requisitos mínimos para manutenção da cadeia de frio, conforme preconizado pelo Programa Nacional de Imunizações.
>
> **Recomendação**: Providenciar adequações da estrutura física da CMRF, conforme parâmetros preconizdos nos Subitem 3.1.4, Item 3, pág. 20 e Item 8, pág. 88 a 116 do Manual de Rede Frio do PNI, 2017.
>
> **Análise Codificação**: A recomendação propõe adequações físicas na CMRF para corrigir a condição de não conformidade com os requisitos mínimos da cadeia de frio, focando na correção imediata da estrutura. No entanto, não há menção a ações adicionais que abordem a causa subjacente, como falhas em processos de manutenção ou supervisão, limitando-se ao cumprimento de normativos específicos sem propor medidas preventivas duradouras.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19863, Constatação Nº 703409

> **Finalidade**: Verificar o cumprimento do Plano de Ação da SES ref. à ACP nº 10058- 73.2015.4.01.4300 da 1ª VF.
>
> **Constatação**: Não foi localizada documentação que comprove a realização de visita técnica aos Hospitais de Porte I, II e III, por parte da SES/TO, com o objetivo de verificar a implementação dos protocolos e normas.
>
> **Recomendação**: Comprovar a realização de visita técnica aos Hospitais de Porte I (Hospital Regional de Alvorada, Araguaçu, Arapoema, Arraias, Pedro Afonso e Xambioá), Porte II Hospital Regional de Augustinópolis, Dianópolis, Guaraí, Miracema, Paraíso, Porto Nacional e no Hospital e Maternidade Tia Dedé), Porte III (Hospital Geral de Palmas, Araguaína, Gurupi e no Hospital e Maternidade Dona Regina), com o objetivo de verificar a implementação dos protocolos e normas. Caso ainda não tenha sido realizada, deve-se providenciar as visitas técnicas, conforme acordado no item 5.1 do Plano de Ação SES/TO 2022 (Auditoria 1).
>
> **Análise Codificação**: A recomendação sugere uma ação para resolver a condição encontrada, que é a falta de comprovação da realização de visitas técnicas, ao recomendar que se comprove ou providencie essas visitas. No entanto, a ação proposta é focada apenas em corrigir a condição imediata (realizar as visitas) e em cumprir o que está estabelecido no Plano de Ação, sem propor medidas adicionais para abordar a causa subjacente que permitiu a não realização das visitas, como falhas em processos de monitoramento ou gestão.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19513, Constatação Nº 671418

> **Finalidade**: Apurar a regularidade da produção inserida nos sistemas do SUS com incremento nos tetos PAB e MAC
>
> **Constatação**: A Secretaria Municipal de Saúde de Poção de Pedras nos exercícios de 2020 e 2021 inseriu dados no Sistema de Informações Ambulatoriais (SIA/SUS) para os procedimentos Consulta de profissionais de nível superior na Atenção Especializada (exceto médico), Código 03.01.01.004-8, Consulta Médica em Atenção Especializada, Código 03.01.01.007-2, Atendimento de Urgência com Observação até 24 horas em Atenção Especializada, Código 03.01.06.002-9 e Atendimento de Urgência em Atenção Especializada, Código 03.01.06.006-1, que não correspondem à quantidade encontrada nos registros do Hospital Maternidade Agostinho Cruz Marques.
>
> **Recomendação**: À Secretária Atenção Especializada à Saúde (SAES/MS) para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelecido no Art. 25, do Decreto n.º 11.358, de 1º de janeiro de 2023, objetivando melhor controle, monitoramento e avaliação das produções informadas pelos municípios.
>
> **Análise Codificação**: A recomendação não propõe ações específicas para corrigir a condição encontrada ou endereçar suas causas, limitando-se a informar a constatação e sugerir que a SAES/MS adote procedimentos conforme um decreto, sem detalhar ações concretas. Portanto, não há uma recomendação de fato para avaliação dos critérios.
>
> Ação Corretiva: Não se aplica
>
> Ação Foco Causa: Não se aplica
>
> Efeitos Duradouros: Não se aplica

#### Auditoria 19590, Constatação Nº 684816

> **Finalidade**: Verificar a implementação da Pol. Nac. ao Portador de Doença Ren. Crônica, nos estágios 4 e 5 em TRS
>
> **Constatação**: O setor de hemodiálise do Sistema de Assistência Social e de Saúde (SAS) não atendeu aos parâmetros estabelecidos pela Vigilância Sanitária, quanto à manutenção da estrutura física. (Continuação da constatação n.° 684813)
>
> **Recomendação**: Recomendação descrita na Constatação n.° 684813.
>
> **Análise Codificação**: A recomendação não foi fornecida diretamente no texto, sendo apenas referenciada a outra constatação. Portanto, não é possível avaliar os critérios com base nas informações disponíveis.
>
> Ação Corretiva: Não se aplica
>
> Ação Foco Causa: Não se aplica
>
> Efeitos Duradouros: Não se aplica
