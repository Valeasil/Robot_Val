*** Settings ***
Resource        ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador

*** Variables ***
${URL}  http://automationpractice.com
${Browser}  chrome

*** Test Case ***
Caso de teste 01: Pesquisar produto existente
  Dado que estou na pagina home do site
  Quando eu pesquisar pelo produto "Blouse"
  Então o produto "Blouse" deve ser listado na pagina de resultado da busca

Caso de teste 02: Pesquisar produtonão existente
  Dado que estou na pagina home do site
  Quando eu pesquisar pelo produto "itemNãoExistente"
  Entao a pagina deve exibir a mensagem "No results were found for search "itemNãoExistente""


*** Keywords ***
Dado que estou na pagina home do site
  Acessar a pagina home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
  Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na pagina de resultado da busca
  Conferir se o produto "${PRODUTO}" foi listado no site

Entao a pagina deve exibir a mensagem "${MENSAGEM_ALERTA}"
  Conferir mensagem de erro "${MENSAGEM_ALERTA}"
