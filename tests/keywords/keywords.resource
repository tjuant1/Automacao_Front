*** Settings ***

Resource    ../../resources/resources.resource

*** Keywords ***
Setup
    [Documentation]    Open chrome on selected url in headless mode

    Open Browser    ${access.url_login}

Close
    [Documentation]    Print and closes the Browser
    
    Capture Page Screenshot
    Close Browser

Login Serverest
    [Documentation]    login with created user

    Input Text    ${login.email}    ${email}
    Input Password    ${login.password}    ${password}
    Click Button    ${login.login}

Logout
    [Documentation]    Logout from application

    Click Button    ${home.logout}

Generate Data
    [Documentation]    Generate data for tests

    ${word}=    Word
    Set Suite Variable    ${word}
    
    ${words}=    Words     10
    Set Suite Variable    ${words}

    ${name}=    First Name
    Set Suite Variable    ${name}

    ${email_string}=    Generate Random String    3    [LOWER]
    ${email}=    Set Variable    ${name}${email_string}@email.com
    Set Suite Variable    ${email}

    ${ps1}=    Generate Random String    2    [UPPER]
    ${ps2}=    Generate Random String    3    [LOWER]
    ${ps3}=    Generate Random String    4    [NUMBERS]
    ${ps4}=    Generate Random String    5    [NUMBERS]
    Set Suite Variable    ${password}    ${ps3}@${ps1}${ps2}
    Set Suite Variable    ${ps4}

Register Admin
    [Documentation]    Click register button and fill data

    Generate Data

    Wait Until Element Is Visible    ${first_register.element_visible}
    
    Click Element        ${first_register.button}
    Input Text          ${first_register.type_name}        ${name}
    Input Text          ${first_register.type_email}       ${email}
    Input Password      ${first_register.type_password}    ${password}
    Click Button        ${first_register.admin_button}
    Click Button        ${first_register.login_button}

    Wait Until Element Is Visible    ${home.element_visible}    5s

New User Register
    [Documentation]    Register a new user with admin login

    Click Element                     ${home.register_user}
    Wait Until Element Is Visible    ${user_register.element_visible}

    Generate Data

    Input Text                       ${user_register.type_name}        ${name}
    Input Text                       ${user_register.type_email}       ${email}
    Input Password                   ${user_register.type_password}    ${password}
    Click Button                     ${user_register.button}

    ${home.list.user_list.element_visible}=    Replace String    ${home.list.user_list.element_visible}    variable    ${email}
    Wait Until Element Is Visible    ${home.list.user_list.element_visible}    5s
    Page Should Contain    ${email}

Product Register
    [Documentation]    Create a product so the user can select it

    Click Element    ${home.register_product}

    Input Text      ${product_register.product_name}      ${word}
    Input Text      ${product_register.product_price}     ${ps4}
    Input Text      ${product_register.product_description}    ${words}  
    Input Text      ${product_register.product_quantity}    ${ps4}
    Click Button    ${product_register.register_product}
    
    Sleep   3
    # Wait Until Element Is Visible    ${home.list.product_list.element_visible}
    Page Should Contain    ${word}

Buy Product
    [Documentation]    buy a product using normal profile

    ${buy.find_product}=    Replace String    ${buy.find_product}    string    ${word}

    Sleep    3s
    Click Button    ${buy.find_product}
    Click Button    ${buy.increase_qnt}
    Click Button    ${buy.add_to_cart}
    Wait Until Element Is Visible    ${buy.element_visible}
    Click Button    ${buy.logout}
   