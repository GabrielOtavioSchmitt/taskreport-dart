# TaskReport Dart

## Sobre o Projeto

O TaskReport Dart é um mini-projeto desenvolvido em Dart puro que simula o tratamento de dados de tarefas recebidas de uma API.

O sistema recebe uma lista de dados no formato `List<Map<String, dynamic>>`, contendo informações com inconsistências comuns em aplicações reais, como campos nulos, espaços extras, valores monetários em texto e dados numéricos armazenados como strings.

Após o tratamento dessas informações, o sistema converte os dados em objetos Dart e gera relatórios consolidados no console.

---

## Objetivo

Praticar os principais conceitos estudados no Módulo 01:

* Lógica de programação
* Linguagem Dart
* Tipos de dados
* Estruturas de decisão
* Estruturas de repetição
* Funções
* Arrow Functions
* Lists
* Maps
* Sets
* Métodos de coleção
* Classes e Objetos
* Atributos e Métodos
* Construtores
* Encapsulamento
* Herança
* Polimorfismo com `@override`
* Git e GitHub
* GitFlow
* Kanban

---

## Requisitos Implementados

### RF01 - Transformar Map em Objetos

Conversão dos dados recebidos da API para objetos da classe `Task`.

### RF02 - Tratar Campos Nulos

Substituição de valores nulos por informações padrão.

### RF03 - Remover Espaços Desnecessários

Utilização do método `trim()` para limpeza dos textos.

### RF04 - Converter Valor Monetário

Conversão de valores como `"R$ 120,00"` para `double`.

### RF05 - Converter Horas para Inteiro

Conversão de horas armazenadas como texto para `int`.

### RF06 - Exibir Tarefas Convertidas

Exibição de todas as tarefas tratadas no console.

### RF07 - Filtrar Tarefas por Status

Separação das tarefas por status:

* concluída
* em andamento
* pendente
* cancelada

### RF08 - Somar Valores das Tarefas Concluídas

Cálculo do valor total das tarefas concluídas.

### RF09 - Calcular Média das Pendentes

Cálculo da média dos valores das tarefas pendentes.

### RF10 - Total de Horas por Status

Soma das horas trabalhadas agrupadas por status.

### RF11 - Identificar Dados Incompletos

Listagem das tarefas que possuem informações faltantes.

### RF12 - Exibir Status Únicos

Utilização de `Set` para eliminar repetições de status.

### RF13 - Programação Orientada a Objetos

Implementação de:

* Classe base (`WorkItem`)
* Herança (`Task`)
* Polimorfismo (`@override`)

### RF14 - Encapsulamento

Uso de atributos privados e getters para controle de acesso aos dados.

### RF15 - Relatório Final Consolidado

Geração de um relatório completo contendo todas as análises realizadas.

## Estrutura do Projeto

taskreport-dart/main.dart/README.md/planejamento/tarefas_kanban.md

## Tecnologias Utilizadas

* Dart
* Visual Studio Code
* Git
* GitHub
* Trello

## Organização do Projeto

O gerenciamento das atividades foi realizado utilizando a metodologia Kanban através do Trello.

Link Kanban e Github e vídeo: 

https://trello.com/b/s8aYwQmD

https://github.com/GabrielOtavioSchmitt/taskreport-dart

https://drive.google.com/file/d/1d2WbcAELfPgko704_dFihdbYW5BcEdUC/view?usp=sharing

## Como Executar

Execute o arquivo main.dart no ambiente utilizado em aula. Visual Studio Code! ou copie e cole o código do aquivo main.dart no site dartpad para execução: https://dartpad.dev/

## Autor

Gabriel Otávio Schmitt.
Projeto desenvolvido para fins acadêmicos como atividade prática de tratamento de dados utilizando Dart puro.
