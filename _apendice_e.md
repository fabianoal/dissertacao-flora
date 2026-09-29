# Apêndice E --- Prompt de Codificação --- Tentativa 3

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

  ---------------------------------------------------------------------------------
  Ação Corretiva   Ação Foco Causa   Efeitos Duradouros   Foco Causa     Total   \%
  ---------------- ----------------- -------------------- ------------ ------- ----
  Não              Genérica          Não                  Não                4   10

  Sim              Específica        Sim                  Sim                7   18

  Sim              Genérica          Não                  Não               27   68

  Sim              Não               Não se Aplica        Não                2    5
  ---------------------------------------------------------------------------------

  ------------------------------------------------------------------------
  Foco Causa                                           Total            \%
  ------------------------------------- -------------------- -------------
  Não                                                     33            82

  Sim                                                      7            18
  ------------------------------------------------------------------------

### Listagem {#listagem-3}

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

#### Auditoria 19635, Constatação Nº 687559

> **Finalidade**: Verificar a regularidade na inserção da produção no Sistema de Informação Ambulatorial do SUS
>
> **Constatação**: Os instrumentos de gestão do SUS de Tutoia não demonstram justificativas para o aumento expressivo de procedimentos da Atenção Especializada que tiveram inserção de dados no Sistema de Informação Ambulatorial (SIA/SUS) superior em relação a produção efetivamente realizada nos exercícios 2021 e 2022.
>
> **Recomendação**: 1- Cumprir com o que estabelecem os Arts. 95, 96, 97 e 99, todos da Portaria de Consolidação GM/MS nº 1, de 28/9/2017, que preveem que os instrumentos para o planejamento no âmbito do SUS, o Plano de Saúde (PS), as Programações Anuais de Saúde (PAS) e o Relatório Anual de Gestão (RAG) que se interligam compondo um processo cíclico de planejamento para operacionalização integrada, solidária e sistêmica do SUS, onde o PS se configura como base para a execução, o acompanhamento, a avaliação da gestão do sistema de saúde e contempla todas as áreas da atenção à saúde, de modo a garantir a integralidade dessa atenção; que a PAS é o instrumento que operacionaliza as intenções expressas no Plano de Saúde e tem por objetivo anualizar as metas do Plano de Saúde e prever a alocação dos recursos orçamentários a serem executados; e que o RAG é o instrumento de gestão com elaboração anual que permite ao gestor apresentar os resultados alcançados com a execução da PAS e orienta eventuais redirecionamentos que se fizerem necessários no Plano de Saúde; 2- Realizar, de acordo com o previsto no §1º, Art. 30, da Lei Complementar nº 141, de 13/1/2012, processo de planejamento e orçamento de forma ascendente e partindo das necessidades de saúde da população, com base no perfil epidemiológico, demográfico e socioeconômico, para definir as metas anuais de atenção integral à saúde e estimar os respectivos custos.
>
> **Análise Codificação**: A recomendação propõe duas ações distintas: a primeira é genérica, focando no cumprimento de normativos existentes sem especificar ações concretas para além da adesão legal, o que não endereça diretamente a causa subjacente à falta de justificativas para o aumento de procedimentos. A segunda ação sugere realizar um processo de planejamento baseado em necessidades de saúde, o que pode ser visto como uma tentativa de abordar a causa raiz, mas ainda é genérica, pois não detalha etapas específicas como revisão de processos ou capacitação. Ambas as ações não garantem efeitos duradouros, pois dependem de conformidade contínua sem mudanças sistêmicas robustas.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19598, Constatação Nº 676938

> **Finalidade**: Averiguar a prestação do serviço da Central de Regulação do Serviço Móvel de Urgência do Estado/RS.
>
> **Constatação**: Foram realizados encaminhamentos de equipes para socorro SAMU 192 sem atendimento do chamado, através de ligação telefônica, pelo profissional regulador.
>
> **Recomendação**: Manter fluxos de atendimento descritos em POPs acessíveis a todos os profissionais.
>
> **Análise Codificação**: A recomendação sugere a manutenção de fluxos de atendimento descritos em POPs acessíveis, o que pode ser visto como uma ação para prevenir a repetição da condição de encaminhamentos sem atendimento, focando na causa subjacente de falta de procedimentos claros. No entanto, ela não propõe uma ação direta para corrigir a condição atual, como revisar ou corrigir os encaminhamentos já realizados. A ação é genérica, pois se limita a cumprir normativos existentes (POPs) sem detalhar ações específicas adicionais. Quanto aos efeitos duradouros, como a ação é genérica e não especifica mudanças estruturais, os efeitos podem não persistir com mudanças de atores.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19700, Constatação Nº 689138

> **Finalidade**: Verificar a implementação do PNCH quanto a efetiva prest. de serviços de at. integral à hanseníase
>
> **Constatação**: Os testes rápidos para avaliação de contatos para a hanseníase realizados nos serviços tipo I de São Luís não foram totalmente informados no Sistema de Informação Ambulatorial do SUS (SIA/SUS) no período auditado e não há registros de teste de biologia molecular para hanseníase.
>
> **Recomendação**: À Secretaria de Vigilância em Saúde e Ambiente (SVSA/MS) para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelecido no Inciso XI, do Art. 38, do Decreto n.º 11.798, de 28/11/2023, objetivando a organização e execução de atividades relativas à prevenção e ao controle de doenças, agravos e eventos de saúde pública relacionadas à vigilância em saúde.
>
> **Análise Codificação**: A recomendação limita-se a encaminhar a constatação para conhecimento da SVSA/MS e recomendar a adoção de procedimentos conforme estabelecido em normativo legal (Decreto n.º 11.798/2023), sem propor ações específicas para resolver a condição encontrada (subnotificação de testes rápidos e ausência de registros de teste molecular) ou para tratar a causa subjacente que permitiu essa ocorrência. A ação sugerida é genérica, focada no cumprimento de um normativo, sem detalhar medidas concretas.
>
> Ação Corretiva: Não
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19720, Constatação Nº 697031

> **Finalidade**: Verificar a regularidade da produção inserida nos sistemas do SUS em São José de Lagoa Tapada/PB.
>
> **Constatação**: Os instrumentos de gestão elaborados não contiveram informações que permitissem o monitoramento dos dados de produção ambulatorial executados e inseridos no Sistema de Informações Ambulatoriais (SIA-SUS).
>
> **Recomendação**: À SMS de São José da Lagoa Tapada/PB: Informatizar e padronizar a coleta de dados no Sistema de Informações Ambulatoriais - SIA/SUS, garantindo que todos os dados sejam registrados de maneira consistente e completa; Criação de mecanismos de acompanhamento e controle que permitam o monitoramento contínuo dos dados de produção ambulatorial, facilitando a identificação de tendências e a tomada de decisões baseadas em evidências; Capacitação das equipes de gestão e operação para assegurar que todos os envolvidos compreendam a importância do registro preciso dos dados e estejam aptos a utilizá-los de maneira eficaz; Auditorias regulares e revisões periódicas dos dados inseridos no sistema, para verificar a sua precisão e integridade, corrigindo eventuais falhas ou omissões de maneira proativa. Essas ações visam atender o art. 18 da Lei nº 8.080/1990, que atribui a competência à direção municipal do Sistema de Saúde (SUS) o controle e avaliação das ações e os serviços de saúde.
>
> **Análise Codificação**: A recomendação sugere ações para resolver a condição encontrada (informatizar e padronizar a coleta de dados) e também propõe ações específicas para tratar a causa subjacente, como a criação de mecanismos de acompanhamento, capacitação das equipes e auditorias regulares. Essas ações visam prevenir a reincidência da condição, indo além da mera correção imediata. Os efeitos pretendidos, como a padronização e os mecanismos de controle, têm potencial para permanecer mesmo com mudanças de atores, devido à institucionalização de processos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19735, Constatação Nº 693686

> **Finalidade**: Verificar irregularidades na gestão e no sistema de sobreaviso dos Médicos Vinculados ao Hospital
>
> **Constatação**: Existem pacientes atendidos na UPA que necessitam de internação e permanecem na unidade além das 24 horas, estando em desacordo com a legislação vigente.
>
> **Recomendação**: A Secretaria Municipal de Saúde (SMS) de Canoinhas deve tomar providências imediatas para corrigir a permanência de pacientes por mais de 24 horas na UPA, o que está em desacordo com a legislação vigente, especificamente com a Portaria de Consolidação nº 6/2017, que estabelece que a UPA pode manter pacientes em observação por até 24 horas, sendo necessário transferi-los para serviços de maior complexidade quando não houver resolução da queixa clínica. Primeiramente, a SMS deve implementar um registro formal e sistemático para monitorar a permanência de pacientes em urgência e emergência além das 24 horas. Isso inclui a criação de indicadores específicos para o tempo de permanência, a média de tempo de espera por leitos, e a avaliação contínua da resolução clínica dos pacientes. É fundamental também que a UPA adote indicadores de desempenho para monitorar o retorno de pacientes com a mesma condição e o encaminhamento adequado para internação em hospitais de referência, utilizando o sistema SISREG de forma eficiente para garantir a agilidade nas transferências. Além disso, a SMS deve estabelecer um processo para monitorar e avaliar o desempenho da unidade, incluindo tempos de espera por atendimento, classificação de risco, e a resolutividade do tratamento, correlacionando esses dados com os desfechos clínicos. A falta desses indicadores compromete a qualidade do atendimento e a gestão eficiente da UPA. Essas medidas são essenciais para garantir o cumprimento da normativa e a continuidade adequada do cuidado aos pacientes, evitando a permanência indevida na UPA e assegurando a adequação ao padrão de assistência exigido para unidades de urgência e emergência.
>
> **Análise Codificação**: A recomendação sugere ações corretivas imediatas para resolver a condição de permanência de pacientes além de 24 horas na UPA, como a implementação de registros formais e monitoramento. Além disso, propõe ações com foco na causa, como a criação de indicadores específicos para tempo de permanência, média de espera por leitos, avaliação contínua da resolução clínica, adoção de indicadores de desempenho para retorno de pacientes e encaminhamento adequado via SISREG, e estabelecimento de processos de monitoramento e avaliação do desempenho da unidade. Essas ações vão além do mero cumprimento normativo, sendo específicas e concretas. Quanto aos efeitos duradouros, as ações propostas, como a implementação de sistemas de registro e indicadores, tendem a permanecer mesmo com mudanças de atores, pois institucionalizam processos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19060, Constatação Nº 663757

> **Finalidade**: Ver. a reg. form e ex. dos convênios entre mun. de Marilia p/ prest. de serv. de saúde e Ass. Fem.
>
> **Constatação**: Foram realizadas despesas com honorários advocatícios, honorários contábeis e auditoria, utilizando recursos municipais destinados à execução do Convênio nº 1091/2016, em desacordo com o pactuado.
>
> **Recomendação**: Nos próximos convênios a serem celebrados, fazer constar cláusula que vede a realização despesas com honorários advocatícios, honorários contábeis e auditoria para estar em conformidade com o com o art. 66 da Lei Federal nº 8.666, de 21 de junho de 1993, que estabelece que o contrato deverá ser executado fielmente pelas partes, de acordo com as cláusulas avençadas e as normas desta Lei, respondendo cada uma pelas consequências de sua inexecução total ou parcial e, aplica-se as disposições desta Lei, no que couber, aos convênios, acordos, ajustes e outros instrumentos congêneres celebrados por órgãos e entidades da Administração.
>
> **Análise Codificação**: A recomendação sugere incluir uma cláusula específica em futuros convênios para proibir despesas com honorários advocatícios, contábeis e de auditoria, o que constitui uma ação corretiva para prevenir a recorrência da condição. Embora aponte para o cumprimento do art. 66 da Lei Federal nº 8.666/1993, a ação proposta é concreta e vai além de uma mera referência genérica ao normativo, focando na causa ao estabelecer um mecanismo preventivo. Os efeitos pretendidos são duradouros, pois a cláusula permanece válida independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19879, Constatação Nº 703725

> **Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS
>
> **Constatação**: O Hospital de Câncer de Cascavel (Uopeccan) não emitiu nova AIH para procedimento compatível nos casos em que a internação para quimioterapia de administração contínua (03.04.08.002-0) excedeu seis dias de permanência.
>
> **Recomendação**: - Emitir nova AIH compatível com a condição clínica apresentada pelo paciente, nos termos da normativa vigente, utilizando-se do código 03.04.10.001-3 - Tratamento de intercorrências clínicas de paciente oncológico, sempre que a internação se prolongar por intercorrências que extrapolem o escopo do procedimento original de quimioterapia contínua; - Promover capacitação continuada da equipe responsável pelos processos de codificação e faturamento, com foco nas diretrizes do SIA/SUS e nos requisitos normativos para correta classificação e cobrança dos procedimentos oncológicos hospitalares. Essas recomendações seguem as diretrizes do Manual de Bases Técnicas da Oncologia - SIA/SUS, 30ª edição, Ministério da Saúde, 2022, página 22, contribuindo para a correta codificação, a precisão dos registros dos procedimentos realizados, o cumprimento das normas regulatórias e a otimização da gestão dos recursos de saúde.
>
> **Análise Codificação**: A recomendação contém duas ações distintas. A primeira ação ('Emitir nova AIH...') é claramente uma ação corretiva, pois visa resolver diretamente a condição encontrada de não emissão de AIH compatível para internações prolongadas. A segunda ação ('Promover capacitação continuada...') propõe uma medida para evitar a recorrência do problema, focando na causa subjacente relacionada ao conhecimento da equipe. Esta ação é específica, pois vai além do mero cumprimento normativo, detalhando uma ação concreta de capacitação com foco em diretrizes específicas. Quanto aos efeitos duradouros, a capacitação continuada, se implementada adequadamente, pode criar um conhecimento institucional que permanece mesmo com mudanças de pessoal, embora dependa da continuidade do programa.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19565, Constatação Nº 677635

> **Finalidade**: Verificar a gestão e o funcionamento do serviço de Atendimento Móvel de Urgência (SAMU 192).
>
> **Constatação**: Estado crítico dos equipamentos de proteção individual para os motociclistas do SAMU 192 Teresina.
>
> **Recomendação**: a) Substituição ou reparo dos EPIs danificados, assegurando a integridade e segurança dos profissionais envolvidos nas operações de motolâncias do SAMU Teresina, conforme determina o item 6.5.1. c) da NR 6 - Equipamentos de Proteção Individual, do Ministério do Trabalho e Emprego, que estabelece a obrigatoriedade do fornecimento gratuito de EPI adequado ao risco, em perfeito estado de conservação e funcionamento. b) Manter uma reserva de EPIs em estoque para realizar as substituições necessárias, assegurando a disponibilidade contínua desses equipamentos.
>
> **Análise Codificação**: A recomendação sugere ações para resolver a condição encontrada (substituir/reparar EPIs danificados) e também propõe uma ação específica para tratar a causa que levou à indisponibilidade de EPIs (manter estoque de reserva). Esta última ação visa prevenir a reocorrência do problema, indo além do mero cumprimento normativo. Os efeitos da ação de manter estoque são duradouros, pois independem de mudanças nos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19768, Constatação Nº 693422

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: O transporte de imunobiológicos na CMRF não atende às boas práticas exigidas pelo PNI, quanto à integridade, higienização e controle de temperatura.
>
> **Recomendação**: Adotar as seguintes medidas visando atender o estabelecido nos Incisos I, II e III do Art. 56, Seção VI, da Resolução de Diretoria Colegiada - RDC nº 430, de 08/10/2020, e no Subitem 4.6.4 pág. 30; subitem 7.1, Item 7, páginas 75 a 77 do Manual de Rede Frio do PNI, 2017. Além disso, o Art. 77 e seu parágrafo único, da Seção IX, da Resolução de Diretoria Colegiada - RDC nº 430, de 08/10/2020: - Disponibilizar veículo equipado com dispositivos que possibilitem o adequado acondicionamento e conservação das vacinas, e estabelecer rotinas adequadas de desinfecção e higiene no veículo para a preservação dos imunobiológicos durante o transporte; - Estabelecer checklist para que seja realizado o monitoramento da temperatura dos imunobiológicos durante o transporte e entrega destes à unidade de saúde; - Calibrar regularmente os termômetros utilizados durante o transporte e realizar o registro dessa rotina; e - Capacitar os motoristas que realizam o transporte dos imunobiológicos, de modo a compreender os procedimentos e cuidados necessários para garantir a segurança e eficácia dos produtos transportados.
>
> **Análise Codificação**: A recomendação sugere múltiplas ações para corrigir a condição encontrada, incluindo disponibilizar veículo adequado, estabelecer rotinas de higiene, criar checklist para monitoramento de temperatura, calibrar termômetros e capacitar motoristas. Essas ações visam resolver diretamente os problemas de integridade, higienização e controle de temperatura no transporte. Além disso, as ações de estabelecer rotinas, criar checklist, calibrar regularmente e capacitar motoristas indicam medidas que buscam tratar as causas subjacentes, como falta de procedimentos padronizados e capacitação inadequada, indo além do mero cumprimento normativo ao propor implementações concretas.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19819, Constatação Nº 695145

> **Finalidade**: Auditoria na PNSMAD - 2024
>
> **Constatação**: As equipes avaliadas não realizam acompanhamento dos familiares de usuários com transtorno mental e uso abusivo de álcool e drogas.
>
> **Recomendação**: Realizar acompanhamento dos familiares de usuários com transtorno mental e uso abusivo de álcool e drogas, em cumprimento ao disposto no inciso VIII do item 4.1, Capítulo I, Anexo 1 do Anexo XXII, da Portaria de Consolidação GM/MS nº 2, de 28/09/2017 e Cadernos de Atenção Básica 34 - Saúde Mental/MS - 2013, item 5 (págs. 63-71). O Acolhimento dos familiares logo no início do processo de tratamento é essencial para garantir que eles se sintam parte do cuidado e recebam orientações claras sobre o transtorno mental do paciente, o processo terapêutico e a importância do suporte familiar no tratamento. É importante proporcionar espaços de escuta onde os familiares possam expressar suas dúvidas, preocupações e sentimentos. Isso ajuda a reduzir o estigma relacionado aos transtornos mentais e a fortalecer o vínculo entre a família e os serviços de saúde.
>
> **Análise Codificação**: A recomendação sugere uma ação específica para realizar o acompanhamento dos familiares, o que corrige diretamente a condição encontrada de falta de acompanhamento. Além disso, propõe ações como acolhimento inicial, orientações claras e espaços de escuta, que visam abordar causas subjacentes, como a falta de envolvimento familiar e estigma, indo além do mero cumprimento normativo. Essas ações são específicas e podem ter efeitos duradouros, pois estabelecem práticas estruturadas que podem persistir independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Específica
>
> Efeitos Duradouros: Sim

#### Auditoria 19832, Constatação Nº 696014

> **Finalidade**: Auditoria na PNSMAD - 2024
>
> **Constatação**: A Unidade Básica de Saúde - UBS Jardim Luiza não comprovou a realização da continuidade do cuidado e ações de redução a danos a grupos específicos de pacientes.
>
> **Recomendação**: Estabelecer cronograma para implantar ações de redução de danos na atenção primária em saúde para grupos específicos de pacientes, como as gestantes, os idosos, as pessoas em situações de rua, adolescentes, dentre outros, de forma a promover a melhoria do atendimento em Saúde Mental, em toda sua rede, atendendo ao preconizado na Portaria de Consolidação nº 3, de 28 de setembro de 2017, Anexo V, Art.4º I c/c Artigo 6º, inciso I.
>
> **Análise Codificação**: A recomendação sugere estabelecer um cronograma para implantar ações de redução de danos, o que visa corrigir a condição encontrada de falta de comprovação dessas ações. No entanto, a ação proposta é genérica, pois se limita a cumprir o normativo mencionado (Portaria de Consolidação nº 3) sem detalhar ações concretas além disso. Como a ação de foco na causa é genérica, os efeitos duradouros não são avaliados como positivos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19614, Constatação Nº 676605

> **Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena
>
> **Constatação**: Impropriedades relacionadas ao acompanhamento mensal do Eixo de Atenção à Saúde Indígena.
>
> **Recomendação**: Determinar ao DSEI realizar a conferência da documentação comprobatória/complementar inserida no Transferegov a fim de evitar manutenção de informações incorretas no sistema, cumprindo o exposto no inciso IV, art. 11, da Portaria de Consolidação nº 1 SESAI/MS/2020.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva para conferir a documentação comprobatória/complementar no Transferegov, visando resolver a condição de informações incorretas no sistema. No entanto, a ação com foco na causa é genérica, pois se limita a determinar o cumprimento de um normativo existente (inciso IV, art. 11 da Portaria de Consolidação nº 1 SESAI/MS/2020), sem propor medidas adicionais ou específicas para evitar a causa raiz das impropriedades, como melhorias em processos ou capacitação.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19519, Constatação Nº 683237

> **Finalidade**: Verificar regularidade da execução dos convênios nº 01,02,03/2017 entre SMS/Sta Casa M. S. J. Barra
>
> **Constatação**: As informações referentes às Regras Contratuais e Habilitação não foram inseridas nos módulos do Sistema de Cadastro Nacional de Estabelecimentos de Saúde (SCNES).
>
> **Recomendação**: Manter os dados do Sistema de Cadastro Nacional de Estabelecimentos de Saúde (SCNES) atualizados, pelo estabelecimento contratualizado, bem como pela SMS de São João da Barra, em observância ao estabelecido nas cláusulas contratuais e na Seção I, Capítulo IV, Título VII, da Portaria de Consolidação GM/MS nº 1, de 28 de setembro de 2017.
>
> **Análise Codificação**: A recomendação sugere manter os dados do SCNES atualizados, o que constitui uma ação corretiva para resolver a condição de informações não inseridas. No entanto, a ação proposta é genérica, limitando-se a cumprir normativos existentes sem especificar medidas concretas para abordar as causas subjacentes, como falhas de processo ou capacitação. Portanto, não há uma ação específica com foco na causa, e os efeitos duradouros não se aplicam ou são inexistentes devido à natureza genérica.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19879, Constatação Nº 703731

> **Finalidade**: Verificar a regularidade do tratamento em oncologia do EAS vinculado ao SUS
>
> **Constatação**: No Hospital de Câncer de Cascavel (Uopeccan), as Autorizações de Procedimentos Ambulatoriais (APACs) com o código 03.04 (Tratamentos Oncológicos de Quimioterapia e Radioterapia) foram emitidas, na maioria dos casos, com data de autorização posterior ao início do tratamento clínico no prontuário do paciente.
>
> **Recomendação**: Acompanhar, fiscalizar, supervisionar e auditar as ações descritas no contrato firmado com o prestador, principalmente no que se refere à observância do subitem 2.5, página 19, do Manual Técnico Operacional do SIA/SUS (versão agosto de 2016), que exige a autorização prévia para esses procedimentos; do Manual de Bases Técnicas da Oncologia - SIA/SUS, elaborado pelo Instituto Nacional de Câncer (INCA); e da Portaria SAES/MS nº 470, de 22 de abril de 2021, a qual estabelece que os procedimentos oncológicos ambulatoriais devem ser formalmente autorizados por meio da APAC antes do início do tratamento.
>
> **Análise Codificação**: A recomendação sugere ações de acompanhamento, fiscalização, supervisão e auditoria para garantir que os procedimentos oncológicos sejam autorizados previamente, conforme normativos. Isso visa corrigir a condição encontrada de autorizações emitidas após o início do tratamento. No entanto, a ação proposta é genérica, limitando-se a citar o cumprimento de normativos existentes sem especificar medidas concretas para abordar a causa subjacente, como falhas em processos internos ou capacitação. Consequentemente, não há indicação de efeitos duradouros, pois a recomendação não implementa mudanças sistêmicas que persistiriam independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19616, Constatação Nº 676191

> **Finalidade**: Avaliar a execução dos convênios firmados com organizações sociais no âmbito da Saúde Indígena
>
> **Constatação**: Ausência de contrato de prestação de serviço de assessoria contábil.
>
> **Recomendação**: Notificar a convenente para apresentação de justificativas quanto ao constatado, em conformidade ao previsto no § 1º, art. 54, da Lei 8.666/93; art. 45 da Portaria MP/MF/CGU nº 424/2016.
>
> **Análise Codificação**: A recomendação sugere notificar a convenente para apresentar justificativas sobre a ausência do contrato, o que constitui uma ação para resolver a condição encontrada. No entanto, não propõe ações específicas para tratar a causa subjacente, limitando-se a citar conformidade com normativos, sem indicar medidas concretas como implementação de processos de verificação ou capacitação para prevenir recorrências.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19683, Constatação Nº 697245

> **Finalidade**: Realizar auditoria no Convênio 878444/2018 com a Santa Casa de Misericórdia de Sabará
>
> **Constatação**: Ausência de critérios para as contratações dos profissionais do Apoio à Gestão Administrativa do Convênio nº 878444/2018 (DSEI Altamira).
>
> **Recomendação**: Estabelecer critérios para a definição das despesas necessárias a serem contratadas para a gestão administr
>
> ativa da convenente, bem como a observância do valor salarial de cada cargo, solicitando da convenente também a instituição de controle de frequência dos funcionários e o acompanhamento das atividades realizadas pela equipe, conforme preconizado o art. 74, do Decreto-Lei 5.452, de 1º de maio de 1943, e no § 2º, art. 63, da 4.320/64, que dispõe que a liquidação da despesa por fornecimentos feitos ou serviços prestados terá por base a prestação efetiva do serviço.
>
> **Análise Codificação**: A recomendação sugere ações para resolver a condição encontrada (ausência de critérios para contratações) ao estabelecer critérios e controles específicos. No entanto, a ação proposta para tratar a causa principal limita-se a citar o cumprimento de normativos existentes, sem especificar medidas concretas além disso, caracterizando-a como genérica em foco na causa.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19484, Constatação Nº 683071

> **Finalidade**: Verificar regularidade execução contrato SMS Bom Jesus Itabapoana e o Hospital São Vicente de Paula
>
> **Constatação**: O Ordenador de Despesas não assinou as ordens de pagamento dos processos financeiros de 2017 a 2019, referentes ao Convênio n.º 01/2017 da Secretaria Municipal de Saúde de Bom Jesus do Itabapoana/RJ.
>
> **Recomendação**: Adotar medidas que corrijam o fluxo documental e processual de forma tal que evitem ou mitiguem o risco de que sejam praticados atos administrativos que descumpram a legislação orçamentária, financeira e contábil no âmbito da Secretaria Municipal de Saúde de Bom Jesus do Itabapoana/RJ, em especial quanto à Lei n.º 4.320/1964 e o art. n.° 1.149 da Portaria GM/MS de Consolidação n.° 6/2017. Não obstante, assegurar com que sejam cumpridos os conteúdos dispostos na Lei Municipal n.º 1.453, de 11 de março de 2021, no que se refere à constituição e funcionamento do Núcleo de Controle Interno da Secretaria Municipal de Saúde previsto no §1° do art. 14.
>
> **Análise Codificação**: A recomendação sugere a correção do fluxo documental e processual para evitar atos administrativos irregulares, o que constitui uma ação corretiva. Quanto ao foco na causa, a recomendação propõe medidas genéricas como cumprir legislações específicas (Lei n.º 4.320/1964, Portaria GM/MS n.° 6/2017, Lei Municipal n.º 1.453/2021) e assegurar o funcionamento do Núcleo de Controle Interno, sem detalhar ações concretas além do mero cumprimento normativo. Não há indicação de efeitos duradouros, pois as ações são genéricas e dependem da aplicação contínua das normas.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19561, Constatação Nº 675765

> **Finalidade**: Avaliar a atuação do referido município por meio dos indicadores de desempenho do Programa Previne
>
> **Constatação**: O Município não preenche todos os campos obrigatórios para qualificação dos 7 indicadores PREVINE Brasil no prontuário eletrônico próprio em utilização pelas 6 USF.
>
> **Recomendação**: Instituir intervenções educativas, sistemáticas e permanentes junto aos profissionais de saúde das USF para melhoria da qualidade dos registros das informações de saúde nos prontuários individuais, nas cadernetas de saúde individuais e nos sistemas de registros informatizados utilizados oficialmente pela SMS de Sumidouro/RJ conforme orientam as NOTAS TÉCNICAS SAPS/MS Nº 13/2022, Nº 14/2022, Nº 15/2022, Nº 16/2022, Nº 18/2022, Nº 22/2022, Nº 23/2022, o Manual Instrutivo do Previne Brasil, 1ª ed., 2021, 2.2.2.3 - Ações para melhoria dos indicadores, Brasil, 1ª ed., 2021 e o Documento Orientador: Como a equipe de saúde da família pode melhorar os indicadores de desempenho.
>
> **Análise Codificação**: A recomendação propõe a instituição de intervenções educativas sistemáticas e permanentes para melhorar a qualidade dos registros nos prontuários, o que visa corrigir a condição atual de campos não preenchidos. No entanto, a ação sugerida é genérica, pois se limita a citar o cumprimento de normativos sem especificar medidas concretas, como treinamentos específicos ou revisões de processos, para abordar a causa subjacente, como falta de capacitação ou supervisão.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19537, Constatação Nº 685226

> **Finalidade**: Verificar a regularidade na formalização e execução dos Contratos nº 36/2014 e nº 39/2014.
>
> **Constatação**: A Secretaria de Saúde e Defesa Civil de São Gonçalo/RJ não enviou toda a documentação solicitada por meio dos Comunicados de Auditoria.
>
> **Recomendação**: Observar, nas futuras auditorias deste DenaSUS, o art. 11 do Decreto nº 1.651/1995, o qual determina que os órgãos do SUS e as entidades privadas, que dele participarem de forma complementar, prestem ao pessoal em exercício no SNA e à Comissão Corregedora, quando exigidos, toda informação necessária ao desempenho das atividades de controle, avaliação e auditoria, facilitando-lhes o acesso a documentos, pessoas e instalações.
>
> **Análise Codificação**: A recomendação sugere que, em futuras auditorias, seja observado um artigo de decreto que exige a prestação de informações e acesso a documentos, o que pode ser visto como uma ação para prevenir a reincidência da condição de não envio de documentação, mas não propõe uma ação concreta para corrigir a causa subjacente, limitando-se a citar o cumprimento de um normativo. Portanto, há uma ação corretiva implícita ao enfatizar a conformidade futura, mas a ação com foco na causa é genérica, pois apenas referencia o decreto sem detalhar medidas específicas. Como a ação com foco na causa é genérica, os efeitos duradouros não são avaliados como presentes.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 18714, Constatação Nº 671301

> **Finalidade**: Verificar a regular utilização de recursos da fonte n°117 na aquisição de veículos pela SMS.
>
> **Constatação**: A Secretaria Municipal de Saúde de Cabo Frio/RJ não apresentou comprovação sobre o vínculo funcional do pregoeiro e equipe de apoio designados para os Pregões Eletrônicos nº 006/2017 e nº 009/2017 (Processo Administrativo nº 30.382/2017), bem como da Comissão Permanente de Licitação (Processo Administrativo nº 4.442/2018).
>
> **Recomendação**: Instruir adequadamente os processos administrativos de compra na modalidade Pregão Eletrônico, comprovando os vínculos funcionais do pregoeiro, membros da equipe de apoio e da Comissão Permanente de Licitação, conforme previsto no art. 3º da Lei nº 10.520/2002 e no art. 51 da Lei nº 8.666/1993.
>
> **Análise Codificação**: A recomendação sugere instruir adequadamente os processos administrativos para comprovar os vínculos funcionais, o que corrige a condição específica de falta de comprovação identificada na constatação. No entanto, a ação proposta limita-se a cumprir os normativos legais citados (Lei nº 10.520/2002 e Lei nº 8.666/1993), sem indicar medidas concretas adicionais para abordar a causa subjacente que permitiu a ocorrência da condição, como falhas em processos de designação ou controle interno.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 18885, Constatação Nº 664822

> **Finalidade**: Auditar a SMS de Catanduva/SP, focando Contrato de Gestão n°. 01/2015, com OSCIP Mahatma Gandhi
>
> **Constatação**: Foram realizados pagamentos de encargos trabalhistas, previdenciários e fiscais, com recursos do Contrato de Gestão nº 01/2015, estando em desacordo com o contrato firmado.
>
> **Recomendação**: Executar o contrato fielmente de acordo com as cláusulas avençadas conforme inciso II do artigo nº 39 da Portaria Interministerial nº 127, de 29 de maio de 2008, que determina que o convênio deverá ser executado em estrita observância às cláusulas avençadas e às normas pertinentes.
>
> **Análise Codificação**: A recomendação sugere que o destinatário execute o contrato conforme as cláusulas estabelecidas, o que constitui uma ação para resolver a condição encontrada de pagamentos indevidos. No entanto, a ação proposta é genérica, limitando-se a exigir o cumprimento de normativos existentes sem especificar medidas concretas para abordar a causa subjacente, como falhas em processos de controle ou gestão que permitiram os desvios. Quanto aos efeitos duradouros, como a ação é genérica e não implementa mudanças estruturais, os efeitos não são sustentáveis a longo prazo independentemente de mudanças nos atores envolvidos.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19545, Constatação Nº 673135

> **Finalidade**: Verificar a gestão e o funcionamento do Serviço de Atendimento Móvel de Urgência (SAMU 19).
>
> **Constatação**: Não houve prestação de contas dos recursos recebidos relativos ao SAMU 192 no Relatório Anual de Gestão (RAG), ano de 2022, do Estado do Amapá.
>
> **Recomendação**: Cumprir o que estabelece o inciso IV do art. 4º, da Lei n.º 8.142 de 28/12/1990, no que tange ao relatório de gestão que permita o controle para o recebimento de recursos, combinado com o § 4° do art. 33 da Lei n.° 8.080 de 19/9/1990; ainda de acordo com o §1º do art. 36, da Lei Complementar n.º 141 de 13/1/2012, do disposto nos art. 56 e 57 da Lei Complementar n.º 101 de 4/5/2000.
>
> **Análise Codificação**: A recomendação se limita a citar dispositivos legais que exigem a prestação de contas, sem propor ações específicas para implementar esse cumprimento ou endereçar as causas subjacentes da não prestação. Portanto, sugere apenas uma ação corretiva genérica de cumprir a lei, sem detalhar medidas concretas para resolver a condição ou prevenir sua recorrência.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19775, Constatação Nº 693880

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: A Central de Armazenamento e Distribuição de Imunobiológicos de Campos dos Goytacazes/RJ não possui responsável técnico (RT) e um substituto legalmente designados.
>
> **Recomendação**: Formalizar a nomeação e publicação de responsável técnico (RT) e um substituto legalmente designados para a CMRF conforme estabelece os Arts. 14, 15 e 16, da Seção III, Capítulo II, da RDC n.º 63, de 25/11/2011.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva para resolver a condição encontrada de ausência de responsável técnico e substituto, ao propor a formalização da nomeação e publicação. Em relação ao foco na causa, a ação proposta se limita a cumprir o normativo estabelecido (RDC n.º 63/2011), sem indicar medidas adicionais para tratar as causas subjacentes que levaram à ausência de designação, como falhas em processos de gestão de pessoal ou controle interno. Portanto, a ação com foco na causa é genérica. Quanto aos efeitos duradouros, como a ação é genérica e não propõe mudanças estruturais ou sistêmicas, os efeitos não são necessariamente mantidos com mudanças de atores.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19769, Constatação Nº 692837

> **Finalidade**: Verificar a regularidade da produção inserida nos sistemas SIA-SIH/SUS para incremento do teto MAC.
>
> **Constatação**: A Secretaria Municipal de Saúde e Higiene (SMSH) de São Sebastião do Alto/RJ recebeu, indevidamente, recursos por meio do mecanismo de Incremento Temporário MAC no exercício de 2022 em razão da inserção de dados não comprovados e/ou incorretos no Sistema de Informação Ambulatorial (SIA/SUS) e no Sistema de Informação Hospitalar (SIH/SUS) no ano de 2021.
>
> **Recomendação**: Realizar o acompanhamento, bem como adotar medidas administrativas para efetiva devolução do valor de R\$ 411.242,89 (quatrocentos e onze mil, duzentos e quarenta e dois reais e oitenta e nove centavos), ao Fundo Nacional de Saúde, atualizado monetariamente, conforme preceituam o parágrafo único do art. 2º, art. 3° da Portaria GM/MS nº 885/2021 e Inc. VII do art. 2º do Decreto nº 3.964/01; Aperfeiçoar mecanismos de controle, monitoramento e de avaliação acerca das informações inseridas nos sistemas SIA/SUS e SIH/SUS, para o cumprimento do que preceitua o Inc V do art. 26 do Decreto nº 11.798/23.
>
> **Análise Codificação**: A recomendação sugere duas ações distintas. A primeira ação ('Realizar o acompanhamento, bem como adotar medidas administrativas para efetiva devolução do valor...') visa corrigir a condição encontrada, ou seja, a devolução dos recursos recebidos indevidamente. A segunda ação ('Aperfeiçoar mecanismos de controle, monitoramento e de avaliação acerca das informações inseridas nos sistemas SIA/SUS e SIH/SUS...') propõe uma ação para tratar a causa que permitiu a inserção de dados não comprovados e/ou incorretos, focando em prevenir a recorrência. No entanto, essa ação é genérica, pois se limita a citar o cumprimento de um normativo (Decreto nº 11.798/23) sem especificar medidas concretas, como a implementação de um sistema de verificação de dados ou treinamento específico.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19424, Constatação Nº 663574

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil/PFPB
>
> **Constatação**: O estabelecimento credenciado não apresentou a documentação obrigatória para funcionamento regular.
>
> **Recomendação**: Encaminhar a documentação quando solicitada pelos órgãos de controle, atendendo o artigo 11 do Decreto 1.651, de 28 de setembro de 1995, que estabelece que os órgãos do SUS e as entidades privadas, que dele participarem de forma complementar, ficam obrigados a prestar, quando exigidos, ao pessoal em exercício no SNA, toda informação necessária ao desempenho das atividades de controle, avaliação e auditoria, como também o disposto no Art. 36 do Anexo LXXVII da Portaria de Consolidação nº 5, de 28/09/2017, onde dispõe que o MS solicitará ao estabelecimento credenciado a prestação de informações sobre as suas operações, bem como as cópias dos documentos previstos nesta Portaria e na legislação vigente.
>
> **Análise Codificação**: A recomendação sugere que o estabelecimento encaminhe a documentação obrigatória quando solicitada, o que constitui uma ação corretiva para resolver a condição imediata de falta de documentação. No entanto, a ação proposta é genérica, pois se limita a citar o cumprimento de normativos existentes sem propor medidas adicionais para abordar a causa subjacente, como a implementação de um sistema de gestão documental. Como a ação é genérica, não há efeitos duradouros a serem considerados.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19788, Constatação Nº 694501

> **Finalidade**: Verificar se a APS está exercendo as atribuições de coord. da Rede de Atenção Psicossocial.
>
> **Constatação**: As UBSs visitadas não possuem critérios definidos para a classificação de risco de atendimento e continuidade do cuidado considerando risco e vulnerabilidade relacionados a transtornos mentais.
>
> **Recomendação**: Promover capacitação das equipes que atuam nas UBSs em todas as regiões, para que estejam aptas a aplicar os procedimentos de estratificação de Riscos em Saúde Mental, tendo em vista o que dispõe o Anexo I do Anexo XXII da PCR 02/2017, que define que as ofertas educacionais devem ser indissociadas das temáticas relevantes para a Atenção Básica e da dinâmica cotidiana de trabalho dos profissionais.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva ao propor a capacitação das equipes para aplicar procedimentos de estratificação de riscos, visando resolver a condição de ausência de critérios definidos. Quanto ao foco na causa, a ação é genérica, pois se limita a citar o cumprimento de um normativo (PCR 02/2017) sem detalhar ações concretas além da capacitação. Como o foco na causa é genérico, os efeitos duradouros não se aplicam de forma específica.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19779, Constatação Nº 691462

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: Os instrumentos de gestão da Secretaria Municipal de Saúde e Defesa Civil de São Gonçalo/RJ não contêm informações suficientes sobre o Programa Nacional de Imunizações (PNI).
>
> **Recomendação**: Promover adequações na elaboração dos instrumentos de planejamento e gestão da CMRF de São Gonçalo/RJ, tornando-os suficientemente detalhados e completos, a fim de que estes se tornem efetivos na gestão dos serviços, bem como estejam alinhados aos instrumentos de planejamento do SUS com adequado monitoramento e reporte dos resultados obtidos atendendo o que dispõe os arts. 95 a 99 da Portaria de Consolidação GM/MS n.º 01/2017, de 28/09/2017 que tratam dos instrumentos de planejamento no âmbito do SUS, contendo aspectos de elaboração e de acompanhamento dos mesmos.
>
> **Análise Codificação**: A recomendação sugere adequações nos instrumentos de planejamento para torná-los mais detalhados e completos, o que constitui uma ação corretiva para resolver a condição de falta de informações sobre o PNI. No entanto, a ação proposta é genérica, pois se limita a citar o cumprimento de normativos existentes, como a Portaria de Consolidação GM/MS n.º 01/2017, sem especificar medidas concretas além disso. Como a ação não é específica, os efeitos duradouros não são aplicáveis para avaliação.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19747, Constatação Nº 689728

> **Finalidade**: Verificar se a CMRF possui controles internos capazes de assegurar adequadamente a Cadeia de Frios.
>
> **Constatação**: A gestão não utiliza as informações do sistema de informações do Programa Nacional de Imunização para o planejamento de necessidades e a capacidade de armazenamento da CMRF é insuficiente para atender a demanda atual de imunobiológicos do município.
>
> **Recomendação**: Adotar providências no sentido de garantir estrutura para a CMRF com capacidade de armazenamento suficiente para atender a demanda existente e potencial de imunobiológicos do município, com base nas informações disponíveis nos sistemas de informação de saúde e observando as orientações técnicas para os projetos de Centrais de Rede de Frio (CRFs) e salas de imunização (SI) contidas no Item 1, pág. 13, Item 6, pág. 39, e Item 8, págs. 88 a 106, do Manual de Rede de Frio do PNI, 5ª edição/2017.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva ao propor garantir estrutura com capacidade de armazenamento suficiente para atender a demanda existente e potencial de imunobiológicos, o que visa resolver diretamente a condição de capacidade insuficiente. Quanto ao foco na causa, a recomendação menciona basear-se em informações dos sistemas de informação de saúde e observar orientações técnicas do manual, mas não propõe ações específicas para corrigir a causa subjacente (como a falta de uso das informações para planejamento), limitando-se a referenciar o cumprimento de normativos. Assim, a ação com foco na causa é genérica. Como o foco na causa é genérico, os efeitos duradouros não se aplicam de forma positiva.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19435, Constatação Nº 671642

> **Finalidade**: Verificar a regularidade da execução do Programa Farmácia Popular do Brasil (PFPB)
>
> **Constatação**: Irregularidades em cupons e receitas médicas apresentadas pela empresa.
>
> **Recomendação**: Ao Departamento de Assistência Farmacêutica e Insumos Estratégicos/DAF/SCTIE/MS para conhecimento da presente constatação e adoção dos procedimentos a seu cargo, conforme estabelece o Inciso IV do Artigo 17 do Decreto n. 9.795/2019 de 21/05/2019, combinado com o Inciso VIII do Artigo 2º do Decreto n. 3.964, de 11/10/2001, visando à elisão do dano e/ou impropriedade ocorrida com recursos de origem federal, indicado no Capítulo PROPOSIÇÃO DE DEVOLUÇÃO do presente Relatório, no montante de R\$ 252,48 (duzentos e cinquenta e dois reais e quarenta e oito centavos), a ser acrescido das devidas correções legais, observados os princípios norteadores dos processos administrativos.
>
> **Análise Codificação**: A recomendação se limita a citar dispositivos legais genéricos (Decreto n. 9.795/2019 e Decreto n. 3.964/2001) sem propor ações específicas para corrigir a causa das irregularidades em cupons e receitas médicas. Foca apenas na devolução do valor irregular, o que caracteriza uma ação corretiva para resolver a condição encontrada, mas não avança para medidas que previnam a recorrência do problema.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19758, Constatação Nº 693187

> **Finalidade**: Verificar se CMRFs possuem controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: A Central Municipal de Rede de Frio (CMRF) não está completamente inserida na estrutura da SMS de Maranguape.
>
> **Recomendação**: Submeter a Proposta de Reforma Administrativa/2021, devidamente atualizada, à Câmara Municipal de Maranguape, em atendimento ao Art. 9º, da Seção III, Capítulo II, RDC ANVISA/MS nº 63, 25/11/2011, que diz que: "O serviço de saúde deve possuir regimento interno ou documento equivalente, atualizado, contemplando a definição e a descrição de todas as suas atividades técnicas, administrativas e assistenciais, responsabilidades e competências".
>
> **Análise Codificação**: A recomendação propõe submeter uma proposta de reforma administrativa atualizada para formalizar a inserção da CMRF na estrutura da SMS, o que constitui uma ação corretiva para resolver a condição de não inserção completa. No entanto, a ação sugerida é genérica, pois se limita a cumprir um normativo (RDC ANVISA/MS nº 63) sem especificar medidas concretas além disso, não endereçando explicitamente a causa subjacente, como falhas em processos de gestão ou alocação de recursos. Portanto, não há uma ação específica com foco na causa, e os efeitos duradouros não são aplicáveis devido à natureza genérica da recomendação.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19378, Constatação Nº 662383

> **Finalidade**: Apurar a regularidade da produção inserida nos sistemas do SUS com incremento nos tetos PAB e MAC
>
> **Constatação**: Os instrumentos de gestão do SUS da Secretaria Municipal de Saúde de Paulo Ramos não demonstram qualquer informação relativa aos procedimentos de média e alta complexidade que conforme o Sistema de Informação Ambulatorial (SIA) demonstram quantidades excessivas nos procedimentos informados no exercício de 2020, em relação ao exercício de 2021.
>
> **Recomendação**: Cumprir com o que estabelecem os Arts. 95, 96, 97 e 99, todos da Portaria de Consolidação GM/MS nº 1, de 28/09/2017, que preveem que os instrumentos para o planejamento no âmbito do SUS, o Plano de Saúde (PS), as Programações Anuais de Saúde (PAS) e o Relatório Anual de Gestão (RAG) que se interligam compondo um processo cíclico de planejamento para operacionalização integrada, solidária e sistêmica do SUS, onde o PS se configura como base para a execução, o acompanhamento, a avaliação da gestão do sistema de saúde e contempla todas as áreas da atenção à saúde, de modo a garantir a integralidade dessa atenção; que a PAS é o instrumento que operacionaliza as intenções expressas no Plano de Saúde e tem por objetivo anualizar as metas do Plano de Saúde e prever a alocação dos recursos orçamentários a serem executados; e que o RAG é o instrumento de gestão com elaboração anual que permite ao gestor apresentar os resultados alcançados com a execução da PAS e orienta eventuais redirecionamentos que se fizerem necessários no Plano de Saúde.
>
> **Análise Codificação**: A recomendação sugere que o destinatário cumpra dispositivos normativos específicos da Portaria de Consolidação GM/MS nº 1/2017, que estabelecem a necessidade de utilizar instrumentos de planejamento do SUS (Plano de Saúde, Programação Anual de Saúde e Relatório Anual de Gestão) de forma integrada. Esta ação visa corrigir a condição encontrada de ausência de informações sobre procedimentos de média e alta complexidade nos instrumentos de gestão. No entanto, a recomendação não propõe ações específicas além do mero cumprimento do normativo, limitando-se a citar os artigos que devem ser obedecidos sem detalhar medidas concretas para implementar esses instrumentos ou abordar as causas subjacentes que levaram à não conformidade.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19782, Constatação Nº 693765

> **Finalidade**: Verificar se a SMS possui controles internos capazes de assegurar adequadamente a Cadeia de Frio.
>
> **Constatação**: Ausência de documentação oficial que comprove que a Rede Frio seja um componente do PNI e esteja inserida na estrutura da Secretaria Municipal de Saúde de Porto Seguro (SMS).
>
> **Recomendação**: Providenciar para que a Rede Frio esteja devidamente formalizada como um componente do PNI e inserida na estrutura da SMS, conforme Art. 9º, da Seção III, Capítulo II, da Resolução - RDC n.º 63, de 25/11/2011: "O serviço de saúde deve possuir regimento interno ou documento equivalente, atualizado, contemplando a definição e a descrição de todas as suas atividades técnicas, administrativas e assistenciais, responsabilidades e competências".
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva para formalizar a Rede Frio na estrutura da SMS, resolvendo a condição de ausência de documentação. No entanto, a ação proposta é genérica, pois se limita a cumprir um normativo (RDC n.º 63/2011) sem especificar medidas concretas para abordar as causas subjacentes, como falhas em processos ou responsabilidades.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19620, Constatação Nº 685619

> **Finalidade**: Verificar regularidade recebimento, armazenamento, dispensação e utilização das OPME
>
> **Constatação**: O Hospital Federal dos Servidores do Estado (HFSE) não dispõe de procedimentos e rotinas técnicas escritas e atualizadas para o recebimento, armazenagem e distribuição das OPME.
>
> **Recomendação**: Elaborar e fazer cumprir para o Serviço de Almoxarifado normas, procedimentos e rotinas técnicas escritas e atualizadas de todos os processos de trabalho para o recebimento, armazenagem e distribuição das OPME, em cumprimento do que dispõe o art. 51 da RDC/ANVISA n.º 63, de 25 de novembro de 2011. Prestar toda informação necessária ao desempenho das atividades de controle, avaliação e auditoria, quando exigida, pelo Sistema Nacional de Auditoria do SUS, facilitando-lhes o acesso a documentos, conforme o art. 11, do Decreto n.º 1.651, de 28 de setembro de 1995.
>
> **Análise Codificação**: A recomendação sugere a elaboração e implementação de normas, procedimentos e rotinas técnicas para corrigir a ausência de documentação no recebimento, armazenagem e distribuição de OPME, o que constitui uma ação corretiva. Além disso, ao propor a criação de procedimentos escritos e atualizados, a ação visa tratar a causa subjacente da falta de documentação, mas a referência ao cumprimento de normativos existentes (como a RDC/ANVISA n.º 63) torna a ação genérica, pois não especifica medidas concretas além da adesão a esses normativos. Quanto aos efeitos duradouros, como a ação é genérica, não há garantia de que os efeitos persistiriam com mudanças de atores, pois depende da mera conformidade sem mecanismos específicos de sustentação.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19557, Constatação Nº 676033

> **Finalidade**: Verificar a implementação da P. Nac. ao Portador de Doença Renal Crônica, nos estágios 4 e 5 em TRS.
>
> **Constatação**: A PRONEFRO apresentou relação dos pacientes aptos para transplante sem data de entrada na fila de transplante, impossibilitando o controle do tempo médio de espera na fila de transplantes.
>
> **Recomendação**: À Secretaria Estadual de Saúde-SES/AM no âmbito da sua competênica como gestora Responsável pela implementação da Política Nacional de Atenção ao Portador de doença Renal providencie para cumprir o item 11 das Diretrizes Clínicas para o Cuidado ao Paciente com Doença Renal Crônica, que estabelece que no prazo de 90 (noventa) dias após o início do tratamento dialítico, o serviço de diálise deverá, obrigatoriamente, apresentar ao paciente apto ou ao seu representante legal, a opção de inscrição na Central de Notificação Captação e Distribuição de Órgãos (CNCDO) local ou de referência.
>
> **Análise Codificação**: A recomendação sugere que a SES/AM cumpra o item 11 das Diretrizes Clínicas, que estabelece a apresentação da opção de inscrição na CNCDO no prazo de 90 dias após o início do tratamento dialítico. Isso visa corrigir a condição encontrada (ausência de data de entrada na fila de transplante) ao assegurar que os pacientes aptos sejam inscritos na CNCDO, permitindo o controle do tempo médio de espera. No entanto, a ação proposta é genérica, limitando-se a cumprir um normativo existente sem especificar medidas adicionais para tratar a causa subjacente (como falhas no processo de inscrição ou capacitação da equipe).
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19861, Constatação Nº 701900

> **Finalidade**: Verificar a regularidade na inserção da produção no Sistema de Informação Ambulatorial do SUS
>
> **Constatação**: A Secretaria Municipal de Saúde de Bequimão (SEMUS) recebeu, indevidamente, recursos por meio do mecanismo de Incremento Temporário MAC no exercício de 2022 em razão da inserção de dados não comprovados e/ou incorretos no Sistema de Informação Ambulatorial (SIA/SUS) no ano de 2021.
>
> **Recomendação**: Devolver ao Fundo Nacional de Saúde - FNS o valor de R\$ 2.252.640,00, referente a procedimentos registrados no SIA/SUS sem a devida comprovação da realização dos atendimentos, nos termos do item 9.3.4 do Acórdão 1072/2017/TCU. Cumprir com as atribuições legais de realizar controle e avaliação dos procedimentos assistenciais realizados, minimizando assim a ocorrência de inserção de dados incorretos nos sistemas de informação de saúde, conforme o art. 15 e 18 da Lei nº 8.080/1990.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva específica (devolução do valor recebido indevidamente) para resolver a condição encontrada. Além disso, propõe uma ação genérica de cumprir atribuições legais de controle e avaliação para minimizar a ocorrência futura, sem especificar medidas concretas além do mero cumprimento normativo. Não há ações específicas com foco na causa que garantam efeitos duradouros independentemente de mudanças de atores.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19238, Constatação Nº 654919

> **Finalidade**: Monitorar as recomendações da Auditoria nº 16936 ref a execução da PNAISP
>
> **Constatação**: A SESAPI pagou, com recursos da PNAISP, gratificação de produtividade aos profissionais das eAPP sem respaldo legal.
>
> **Recomendação**: Adotar providências para que os pagamentos de produtividade das eAPP sejam custeados com os recursos específicos fixados na lei que a instituiu, conforme determina o inciso X do art. 37 da Constituição Federal. Restituir ao Fundo Estadual de Saúde o valor de R\$ 1.425.600,00 (um milhão quatrocentos e vinte e cinco mil e seiscentos reais), corrigidos monetariamente, nos termos do parágrafo 3º do art. 23 do Decreto nº 7.827, de 16/10/2012. Dar ciência ao responsável pela irregularidade registrada neste item acerca do ressarcimento a ser feito junto ao Fundo Estadual de Saúde, em cumprimento ao item 9.3.2.2 do Acórdão/TCU nº 1.072/2017-Plenário visando à elisão do dano ao erário.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva ao determinar a restituição do valor pago indevidamente ao Fundo Estadual de Saúde, corrigido monetariamente. Quanto ao foco na causa, a ação proposta de 'adotar providências para que os pagamentos de produtividade das eAPP sejam custeados com os recursos específicos fixados na lei que a instituiu' é genérica, pois se limita a citar o cumprimento de um normativo (inciso X do art. 37 da Constituição Federal) sem especificar medidas concretas para evitar a reincidência, como a implementação de controles internos ou revisão de processos. Como o foco na causa é genérico, os efeitos duradouros não se aplicam de forma positiva.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19683, Constatação Nº 699648

> **Finalidade**: Realizar auditoria no Convênio 878444/2018 com a Santa Casa de Misericórdia de Sabará
>
> **Constatação**: Contratação de empresa de consultoria jurídica por inexigibilidade sem observância aos critérios do art. 25 da Lei nº 8.666/1993.
>
> **Recomendação**: Orientar os fiscais técnicos do convênio e/ou gestor do concedente, que atuam no processo de execução, a realizar a conferência da documentação comprobatória do processo de contratação por meio de dispensa, inexigibilidade e cotação de preços pela convenente inserida no sistema, no sentido de evitar o dano ao erário, conforme previsto no art. 12 da Portaria de Consolidação Sesai/MS nº 1/2020; §2º do art. 54, art. 56 e art. 77 da Portaria MP/MF/CGU nº 424/2016.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva ao orientar a conferência da documentação comprobatória para evitar danos ao erário, o que visa resolver a condição encontrada de contratação irregular. No entanto, a ação proposta para tratar a causa é genérica, pois se limita a recomendar o cumprimento de normativos existentes (art. 12 da Portaria de Consolidação Sesai/MS nº 1/2020 e outros), sem especificar medidas concretas além da mera observância legal. Como a ação de foco na causa é genérica, os efeitos duradouros não se aplicam de forma específica.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Genérica
>
> Efeitos Duradouros: Não

#### Auditoria 19703, Constatação Nº 688047

> **Finalidade**: Verificar a regularidade da produção inserida no SIASUS e no SIHSUS.
>
> **Constatação**: A SMS Autazes não comprovou a compatibilidade da produção aprovada no Sistema de Informações Ambulatoriais- SIA, Ficha de Programação Orçamentária-FPO; Boletim de Produção Ambulatorial-BPA e Síntese de Produção Ambulatorial com a Ficha de Atendimento da produção de serviços efetivamente realizados do procedimento cod. 0301060061 Atendimento de Urgência em Atenção Especializada, no estabelecimento 2013045 Unidade Hospitalar de Autazes.
>
> **Recomendação**: À Secretaria de Atenção Especializada a Saúde do Ministério da Saúde (SAES/MS), para que, no âmbito da sua competência como gestora responsável pelos recursos federais repassados a Secretaria de Municipal Saúde de Autazes, conforme determina o Art. 3°, da Portaria n°885/GM/MS, de 04/05/2021, realize o acompanhamento, bem como adote medidas administrativas para efetiva devolução do valor de R\$ de 59.389,00 (cinquenta e nove mil e trezentos e oitenta e nove reais), ao Fundo Nacional de Saúde, atualizado monetariamente por índice oficial, conforme indicativo na Planilha de Proposição de Devolução parte integrante deste Relatório de Auditoria.
>
> **Análise Codificação**: A recomendação sugere uma ação corretiva específica para resolver a condição encontrada, que é a devolução dos recursos indevidamente recebidos. No entanto, não propõe ações para tratar a causa que permitiu a incompatibilidade na produção, limitando-se a medidas administrativas genéricas de acompanhamento e devolução, sem indicar ações concretas para prevenir a recorrência do problema.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica

#### Auditoria 19863, Constatação Nº 703459

> **Finalidade**: Verificar o cumprimento do Plano de Ação da SES ref. à ACP nº 10058- 73.2015.4.01.4300 da 1ª VF.
>
> **Constatação**: Não foi localizada documentação que comprove a publicação da portaria de monitoramento e avaliação das contratualizações com as Maternidades da rede complementar.
>
> **Recomendação**: Comprovar documentalmente a publicação da portaria de monitoramento e avaliação das contratualizações com as Maternidades da rede complementar. Caso ainda não tenha ocorrido, deve-se providenciar a publicação, conforme acordado no item 1.2 do Plano de Ação SES/TO 2022 (Auditoria 4).
>
> **Análise Codificação**: A recomendação sugere uma ação imediata para comprovar ou providenciar a publicação da portaria, o que corrige a condição encontrada de falta de documentação. No entanto, não propõe ações adicionais para tratar a causa subjacente, como melhorias em processos ou políticas para prevenir futuras omissões, limitando-se a cumprir o acordado no plano de ação sem especificar medidas concretas além disso.
>
> Ação Corretiva: Sim
>
> Ação Foco Causa: Não
>
> Efeitos Duradouros: Não se Aplica
