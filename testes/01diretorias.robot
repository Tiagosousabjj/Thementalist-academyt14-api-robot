*** Settings ***
Documentation     Testes completos de Diretorias com login automático
Library           RequestsLibrary
Library           Collections
Library           String
Library           ../resources/utils.py

*** Variables ***
${baseUrl}       https://api-the-mentalists.qacoders.dev.br/api

*** Test Cases ***

Cenário 01: Criar diretoria
    Realizar Login
    ${user}=           Gerar Usuário Aleatório
    ${dir}=            Criar Diretoria ${user}
    Log To Console     Diretoria criada: ${dir}

Cenário 02: Campo diretoria é obrigatório
    Realizar Login
    Validar Campo Obrigatorio

Cenário 03: Campo diretoria letras maiúsculas, minúsculas e o caractere especial &
    Realizar Login
    Criar Diretoria Com Numeros

Cenário 04: Campo diretoria letras maiúsculas
    Realizar Login
    Criar Diretoria Maiusculas

Cenário 05: Campo diretoria letras minúsculas
    Realizar Login
    Criar Diretoria Minusculas

Cenário 06: Campo diretoria com caracteres especiais apenas
    Realizar Login
    Criar Diretoria Caracteres Especiais

Cenário 07: Campo diretoria com letras maiúsculas, minúsculas e &
    Realizar Login
    Criar Diretoria LetrasEspeciais

Cenário 08: Campo diretoria mais de 50 caracteres
    Realizar Login
    Criar Diretoria MaisDe50Caracteres

Cenário 09: Buscar todas as diretorias
    Realizar Login
    ${resultado}=      Buscar Todas Diretorias
    Log To Console     ${resultado}

Cenário 10: Buscar diretoria por id
    Realizar Login
    ${user}=           Gerar Usuário Aleatório
    ${dir}=            Criar Diretoria ${user}
    ${busca}=          Buscar Diretoria Por ID ${dir['id']}
    Log To Console     ${busca}

Cenário 11: Contar diretorias
    Realizar Login
    ${total}=          Contar Diretorias
    Log To Console     Total de diretorias: ${total}

Cenário 12: Editar diretoria
    Realizar Login
    ${user}=           Gerar Usuário Aleatório
    ${dir}=            Criar Diretoria ${user}
    Editar Diretoria   ${dir['id']}    NovoNomeDiretoria
    Log To Console     Diretoria editada: ${dir['id']}

*** Keywords ***

Gerar Usuário Aleatório
    ${user}=    Generate Random String    8
    RETURN      ${user}

Criar Sessao
    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=develop    url=${baseUrl}    headers=${headers}    verify=true

Realizar Login
    ${body}=    Create Dictionary
    ...    mail=sysadmin@qacoders.com
    ...    password=1234@Test
    Criar Sessao
    ${resposta}=    POST On Session    alias=develop    url=Login    json=${body}
    Status Should Be    200    ${resposta}
    ${token}=    Set Variable    ${resposta.json()["token"]}
    Set Suite Variable    ${TOKEN}    ${token}

Criar Diretoria
    [Arguments]    ${user}
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=Diretoria_${user}
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    201    ${resposta}
    RETURN        ${resposta.json()}

Validar Campo Obrigatorio
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    400    ${resposta}
    Log To Console     Validação de campo obrigatório realizada

Criar Diretoria Com Numeros
    ${user}=      Gerar Usuário Aleatório
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=Diretoria123_${user}
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    201    ${resposta}
    RETURN        ${resposta.json()}

Criar Diretoria Maiusculas
    ${user}=      Gerar Usuário Aleatório
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=DIRETORIA_${user}
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    201    ${resposta}
    RETURN        ${resposta.json()}

Criar Diretoria Minusculas
    ${user}=      Gerar Usuário Aleatório
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=diretoriamin_${user}
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    201    ${resposta}
    RETURN        ${resposta.json()}

Criar Diretoria Caracteres Especiais
    ${user}=      Gerar Usuário Aleatório
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=Diretoria!@#_${user}
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    201    ${resposta}
    RETURN        ${resposta.json()}

Criar Diretoria LetrasEspeciais
    ${user}=      Gerar Usuário Aleatório
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=Diretoria&Especial_${user}
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    201    ${resposta}
    RETURN        ${resposta.json()}

Criar Diretoria MaisDe50Caracteres
    ${user}=      Gerar Usuário Aleatório
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=DiretoriaComMaisDe50Caracteres_${user}_ExtraLong
    ${resposta}=  POST On Session    alias=develop    url=diretorias    json=${data}    headers=${headers}
    Status Should Be    201    ${resposta}
    RETURN        ${resposta.json()}

Buscar Todas Diretorias
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}
    ${resposta}=  GET On Session    alias=develop    url=diretorias    headers=${headers}
    Status Should Be    200    ${resposta}
    RETURN        ${resposta.json()}

Buscar Diretoria Por ID
    [Arguments]    ${id}
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}
    ${resposta}=  GET On Session    alias=develop    url=diretorias/${id}    headers=${headers}
    Status Should Be    200    ${resposta}
    RETURN        ${resposta.json()}

Contar Diretorias
    ${diretorias}=    Buscar Todas Diretorias
    ${total}=         Get Length    ${diretorias}
    RETURN           ${total}

Editar Diretoria
    [Arguments]    ${id}    ${novo_nome}
    ${headers}=   Create Dictionary    Authorization=Bearer ${TOKEN}    Content-Type=application/json
    ${data}=      Create Dictionary    nome=${novo_nome}
    ${resposta}=  PUT On Session    alias=develop    url=diretorias/${id}    json=${data}    headers=${headers}
    Status Should Be    200    ${resposta}
    RETURN        ${resposta.json()}
