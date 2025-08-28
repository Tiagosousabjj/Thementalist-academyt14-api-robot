*** Settings ***
Documentation     Request para pegar o token
Library           RequestsLibrary
Library           Collections
Library           ../resources/utils.py

*** Variables ***
${baseUrl}        https://api-the-mentalists.qacoders.dev.br/api

*** Test Cases ***
Validar Login usuário
    ${account}=    Get Fake Account
    Log To Console    Ola ${account}[name]
    Realizar Login
    # Validar body

*** Keywords ***
Criar Sessao
    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=develop    url=${baseUrl}    headers=${headers}    verify=true

Realizar Login
    ${body}=    Create Dictionary
    ...    mail=sysadmin@qacoders.com
    ...    password=1234@Test
    Log    ${body}
    Criar Sessao
    ${resposta}=    POST On Session    alias=develop    url=Login    json=${body}
    Log To Console    ${resposta.json()}
    Log To Console    ${resposta.json()["token"]}
    Status Should Be    200    ${resposta}

