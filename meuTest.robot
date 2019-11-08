*** Settings ***
#teste andre 2
Library  SeleniumLibrary

*** Settings ***
Documentation  Suíte de apresentação do Robot Framework
...  com uma busca simples no Google
...  para o blog da Concrete

Library  SeleniumLibrary

*** Test Cases ***
Cenário: Buscar por Robot Framework no Google e entrar na página
   [Documentation]  Cenário para uma busca sobre Robot Framework
   ...              no Google
   [Tags]  busca
   Abrir o Chrome na página <https://www.google.com/search?rlz=1C1GCEA_enBR809BR809&sxsrf=ACYBGNRDtl2OrzMN36LT99Ntj0MaxlP77g%3A1571414515078&ei=8-GpXe2sBNDc5gKViIjIBw&q=google&oq=google&gs_l=psy-ab.12...0.0..4153...0.0..0.0.0.......0......gws-wiz.S45zbvStQM4&ved=0ahUKEwit8tyfl6blAhVQrlkKHRUEAnkQ4dUDCAs>
   Digite "Robot Framework" no campo de busca
   Verifique se a busca retornou o resultado esperado
   Clique no primeiro link
   Verifique se a página mostrada e a correta
   Fechar o browser

Cenário: Buscar por Robot Framework no Google e entrar na página2
   [Documentation]  Cenário para uma busca sobre Robot Framework
   ...              no Google2
   [Tags]  busca
   Abrir o Chrome na página <https://www.uol.com.br>
   Digite "Robot Framework" no campo de busca
   Verifique se a busca retornou o resultado esperado
   Clique no primeiro link
   Verifique se a página mostrada e a correta
   Fechar o browser

*** Keywords ***
Abrir o ${browser} na página <${url}>
   Open Browser  ${url}  ${browser}

Digite "${palavra busca}" no campo de busca
   Set Test Variable  ${palavra busca}
   Input text      //*[@id="tsf"]/div[2]/div[1]/div[2]/div/div[2]/input  ${palavra busca}
   Click Button    //*[@id="tsf"]/div[2]/div[1]/div[2]/button


Verifique se a busca retornou o resultado esperado
   ${titulo} =  Get title
   Should Contain  ${titulo}  ${palavra busca}

Clique no primeiro link
   ${texto} =  Get text  css = #rso > div:nth-child(1) > div > div > div > div > h3
   Click link  ${texto}

Verifique se a página mostrada e a correta
   ${titulo}                   Get title
   Should Contain              ${titulo}       ${palavra busca}
   Element text should be      //*[@id="rso"]/div[1]/div/div[1]/div/div/div[1]/a[1]/h3        Robot Framework