*** Settings ***
Resource    ../../BaseSetup.robot
Resource    AllTestPages.robot


*** Variables ***
${Id_OrangePage_Username}    id=txtUsername
${Id_OrangePage_Password}    id=txtPassword
${btn_OrangePage_Password}   id=btnLogin

*** Keywords ***
Naviagte to OrangeHRM
    [Documentation]    Enter the OrangeHRM URL
    
    Go To    ${Env_Url.${TestURL}}
    Wait Until Element Is Visible    ${btn_OrangePage_Password}  
    Sleep    5s
    Log    User naviagte to ${TestURL}[environment]
    Log    ${OADMIN_USERNAME}   
    
    
    
Login as Admin
    [Documentation]    Login as admin into OrangeHRM portal
    
    Input Text    ${Id_OrangePage_Username}  ${OADMIN_USERNAME}    
    Input Password    ${Id_OrangePage_Password}    admin123
    Click Button    ${btn_OrangePage_Password}     

