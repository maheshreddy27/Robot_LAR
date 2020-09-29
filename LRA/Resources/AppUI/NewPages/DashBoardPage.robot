*** Settings ***
Resource    ../../BaseSetup.robot
Resource    AllTestPages.robot

*** Variables ***
${txt_Dashboard_QuickLaunch}        xpath=//legend[contains(text(),'Quick Launch')]
${txt_Dashboard_AssignLeave}        xpath=//span[contains(text(),'Assign Leave')]

*** Keywords ***

Verify Quick Launch in the Dashboard page
    [Documentation]    Verify whether user able to view Quick Launch in the Dashboard page
    
    Wait Until Element Contains    ${txt_Dashboard_QuickLaunch}    Quick Launch    
    ${QuickLaunch}    Get Text    ${txt_Dashboard_QuickLaunch}
    Should Be Equal As Strings    ${QuickLaunch}    Quick Launch
    Log    able to view text as ${QuickLaunch}
    
Click on Assign Leave link
    [Documentation]    Click on assign leave under Quick Launch
    
    Wait Until Element Is Visible    ${txt_Dashboard_AssignLeave}
    # Click Link    ${txt_Dashboard_AssignLeave}
    Click Element    ${txt_Dashboard_AssignLeave}                
    
     
    
    
