***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot

***Variables***
${txtbxUserid}                          xpath=//*[@class="content_login"]//input[@name="txbLogin"]
${txtbxPassword}                        id=txbPassword
${btnLogin}                             id=btnLogin_Submit
${lnkWalkMe}                            xpath=//*[contains(@class,'walkme-action-destroy-1 wm-close-link')]
${TabAllLoans}                          xpath=//*[text()='All Loans']
${FindingURL}                           {EMPTY}
${txtbxUserLogin}                       xpath=//input[@name='txbLogin']
${txtbxLogPassword}                     xpath=//input[@name='txbPassword']
${btnLogLogin}                          xpath=//input[@name='btnLogin']

${lnklogout}                            xpath=//a[text()='Log Off']
${smartPpup}                            xpath=//iframe[@id="wfx-frame-smartPopup"]
${btnOKPopup}                           xpath=//button[text()="OK"]
${popupReverificationResolution}	    id=ctl00_ReverificationResolutionAcknowledgePopup_upReverificationResolutionAcknowledge_RVPopup_PWH-1T
${btnsAcknowledged}	                    xpath=//*[text()="Acknowledged"]

${lnkUserProfile}                       xpath=//*[contains(@id,"userProfile")]

***Keywords***
Goto LQ Application
    go to  ${URL.${ENV}}
    wait until element is visible  id=txbLogin
    sleep  5s
    Log  Successfully launched landing page for ${ENV}[environment].
    
Login As Admin
    Input Text    ${txtbxUserid}    ${ADMIN_USER}
    Input Text    ${txtbxPassword}    ${ADMIN_PASSWORD}
    Click Button    ${btnLogin} 
    Log  Successfully launched landing page for ${ENV}[environment].
    
Login As UnderWriter Manager
    Input Text    ${txtbxUserid}    ${UWM_USER}
    Input Text    ${txtbxPassword}    ${UWM_PASSWORD}
    Click Button    ${btnLogin}   30s
    Log  Successfully launched landing page for ${ENV}[environment].
    
Log Out from system
    Custom Wait Time For Element To Be Appear    ${lnklogout}
    Focus    ${lnklogout}
    Click Element    ${lnklogout}
    Sleep    5
    
Enter Userid
    [Arguments]  ${userid}
    input text  ${txtbxUserid}  ${userid}
    
Enter Password
    [Arguments]  ${password}
    input text  ${txtbxPassword}  ${password}
 
Login As UnderWriter_1
    Enter Userid  ${UW1_USER1}
    Enter Password  ${UW1_PASSWORD}
    Click button  ${btnLogin}
    Log  Successfully launched landing page for ${ENV}[environment]. 

Login As Client_User
    Enter Userid  ${Client_user}
    Enter Password  ${Client_PASSWORD}
    click button  ${btnLogin}
    Log  Successfully launched landing page for ${ENV}[environment].