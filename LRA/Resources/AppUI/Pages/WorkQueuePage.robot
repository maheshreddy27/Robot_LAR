*** Settings ***
Resource    AllPages.robot

*** Variables ***
${mnu_WorkQueuePage_LoanQueue}                          xpath=//a[text()='Loan Quality']
${lnk_WorkQueuePage_PostClose1}                         xpath=//*[@id="PostClose"]/a
${lnk_WorkQueuePage_WorkQueue1}                         xpath=(//*[text()="Work Queue"])[3] | //*[@id="hlWorkQueuePostClose"]/a
${tab_WorkQueuePage_Audit}                              xpath=//*[@id='Audit']/a 
${tab_WorkQueuePage_AuditActive}                        xpath=//*[@id='Audit'][@class='tab_active']/a
${lnk_WorkQueuePage_Loan}                               xpath=(//*[@id="GridAssigned"]//*[text()="Continue"])[1]/../../td/a
${lnk_WorkQueuePage_ContinueAssignment}                 xpath=(//*[@id="GridAssigned"]//*[text()="Continue"])[1]

*** Keywords ***

Go to post close Work queue Page
    Wait Until Element Is Visible    ${mnu_WorkQueuePage_LoanQueue} 
    Mouse Over                       ${mnu_WorkQueuePage_LoanQueue}
    Click Element                    ${lnk_WorkQueuePage_PostClose1}
    sleep                            5s
    Click Link                       ${lnk_WorkQueuePage_WorkQueue1}
    Wait Until Location Contains     /WorkQueue2/Data    
    Location Should Contain          /WorkQueue2/Data
    
 Click Audit tab on Work Queue Page
    [Documentation]       Click Audit tab on Work Queue Page
     ${isAuditTabVisible}    Is Element Visible    ${tab_WorkQueuePage_Audit}
     Run Keyword If    '${isAuditTabVisible}'!='True'    Log    It is on Audit tab only
     ...    ELSE    Run Keywords
         ...    Wait Until Element Is Visible           ${tab_WorkQueuePage_Audit}    
         ...    AND    Click Element                    ${tab_WorkQueuePage_Audit}
         ...    AND    Wait Until Element Is Visible    ${tab_WorkQueuePage_AuditActive}    30s
       
Click on the Continue link for any of the Assigned loan in the "Assigned" section
    [Documentation]   Click on the Continue link for any of the Assigned loan in the "Assigned" section.    
     sleep  5s
     Wait Until Element Is Visible    ${lnk_WorkQueuePage_Loan}
     ${Loan num}=  Get Text    ${lnk_WorkQueuePage_Loan}
     Log To Console    ${Loan num}    
     Wait Until Element Is Visible    ${lnk_WorkQueuePage_ContinueAssignment}  30s
     Click Element    ${lnk_WorkQueuePage_ContinueAssignment} 
     sleep    5s
     [Return]    ${Loan num}  