***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot


***Variables***
${mnu_LoanQueue_Reverification}                    xpath= //span[text()='Reverification']
${txt_LoanQueue_Client}                            xpath=//*[@id="LoanQueueSimpleLoanList_DXFREditorcol2_I"]
${lnk_LoanQueue_FirstLoanNumber}                   xpath=//*[@id='LoanQueueSimpleLoanList_tccell0_0']/a    
${lnk_LoanQueue_FirstAuditType}                    xpath=//th[text()='View:']/../following-sibling::tr[1]//td[1]//a
${mnu_LoanQueue_PostClose}                         xpath=//a[text()='Loan Quality']
${lnk_LoanQueue_PostLoanQueue}                     xpath=//div[contains(@id,'PostCloseContent')]//*[contains(@id,'LQx_WorkQueueManager')]/a | //*[contains(@onclick,"PostClose")]//*[text()="Loan Queue"]
${lnk_LoanQueue_AuditTypeCredit}                   xpath=//a[contains(text(),'Credit')]
${popup_LoanQueue_AuditType}                       id=arrowTooltip_loanQueueLoanStatusPopup
${lnk_LoanQueue_AuditTypeAppraisal}                xpath=//a[contains(text(),'Appraisal')]
${lnk_LoanQueue_AuditTypeCompliance}               xpath=//a[contains(text(),'Compliance')]



***Keywords***

Click on the Reverifications menu
    [Documentation]  Click on the Reverifications menu
    Location Should Contain    LoanQueueSimple/
    Click Element              ${mnu_LoanQueue_Reverification}  30s
    Location Should Contain    ReverificationPending.aspx
    Sleep                      2S
    
Filter the loan by Client
    [Documentation]                Filter the loan by Client
    [Arguments]                    ${client}
    
    Click Element                  ${txt_LoanQueue_Client}
    Sleep                          1s
    Input Text                     ${txt_LoanQueue_Client}    ${client}
    Press Key                      ${txt_LoanQueue_Client}    \\13
    sleep                          5s
    
Click any loan number form the LOAN NUMBER column
    [Documentation]  click on loan number
    
    ${loanNum}=  Get Text    ${lnk_LoanQueue_FirstLoanNumber} 
    Set Global Variable     ${loanNum}
    Click Element    ${lnk_LoanQueue_FirstLoanNumber}            
    Sleep    5s
    [Return]    ${loanNum}
    
 Select any audit type in the loan queue page
    [Documentation]    Select any audit type in the loan queue page 
       
    Element Should Be Visible    ${lnk_LoanQueue_FirstAuditType}    
    Click Link    ${lnk_LoanQueue_FirstAuditType}
    sleep  10s
    
Go to post close Loan queue Page
     [Documentation]    Go to post close Loan queue Page
       
     Wait Until Element Is Visible    ${mnu_LoanQueue_PostClose}      
     Mouse Over    ${mnu_LoanQueue_PostClose} 
     Wait Until Element Is Visible    ${mnu_LoanQueue_PostClose}    30s    
     Click Element    ${mnu_LoanQueue_PostClose}
     Sleep    10s  
     Wait Until Element Is Visible    ${lnk_LoanQueue_PostLoanQueue}    60s         
     Click Element    ${lnk_LoanQueue_PostLoanQueue}
     Wait Until Location Contains    LoanQueueSimple/AllLoans
     ${FindingURL}=  Get Location 
     Set Global Variable    ${FindingURL} 
     
Click on First Loan Number and Credit Audit
    [Documentation]    Click on First Loan Number and click on credit audit
    
    Custom Wait Time For Element To Be Appear    ${lnk_LoanQueue_FirstLoanNumber}
    Click Element    ${lnk_LoanQueue_FirstLoanNumber}
    Custom Wait Time For Element To Be Appear    ${lnk_LoanQueue_AuditTypeCredit}
    Click Element  ${lnk_LoanQueue_AuditTypeCredit}
    Custom Wait Time For Element To Be Appear    ${tab_FindingsPage_Document}
    Page should Contain Element   ${tab_FindingsPage_Document}
    
Click on any loan number form the LOAN NUMBER column
    [Documentation]  click on loan number
    # Page Should Contain Element    ${lblTitle} 
    Wait Until Element Is Enabled    ${lnk_LoanQueue_FirstLoanNumber}   
    Wait Until Element Is Visible    ${lnk_LoanQueue_FirstLoanNumber} 
    sleep  5   
    ${loanNum}=  Get Text    ${lnk_LoanQueue_FirstLoanNumber} 
    Set Global Variable     ${loanNum}    
    Click Element    ${lnk_LoanQueue_FirstLoanNumber}
    Sleep    2s         
    Wait Until Element Is Enabled    ${popup_LoanQueue_AuditType}   30s 
    [Return]    ${loanNum}
    
Verify if user is able to see Credit, Appraisal and Compliance Audit types in popup on clicking the loan number
    [Documentation]    Verify if user is able to see Credit Audit, Appraisal Audit and Compliance Audit on clicking the loan number
    
    Element Should Contain    ${lnk_LoanQueue_AuditTypeCredit}        Credit
    Element Should Contain    ${lnk_LoanQueue_AuditTypeAppraisal}     Appraisal
    Element Should Contain    ${lnk_LoanQueue_AuditTypeCompliance}    Compliance
    
    Log    User is able to see Credit, Appraisal and Compliance Audit types in popup on clicking the loan number
    
Click on Credit Audit type
    [Documentation]  click on credit audit 
    
    Custom Wait Time For Element To Be Appear    ${lnk_LoanQueue_AuditTypeCredit}
    #Wait Until Element Is Enabled    ${lnkAuditTypeCredit}  30s
    Click Element  ${lnk_LoanQueue_AuditTypeCredit}
    Custom Wait Time For Element To Be Appear    ${tab_FindingsPage_Document}
    Page should Contain Element   ${tab_FindingsPage_Document}