***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot

***Variables***
${icon_ProjectListPage_Rebut}            xpath=//span[@class='icon-LoanLogics-alert1 ll-b-icon']
${img_ProjectList_FirstModCount}         id=ctl00_MainContent_repProjects_ctl00_lblDefectLoanCountMod
${img_ProjectList_FirstELIGCount}        id =ctl00_MainContent_repProjects_ctl00_lblDefectLoanCountEl
${icon_ProjectListPage_ProjectSummary}   xpath=//span[contains(text(),'PROJECT SUMMARY')]
${txt_ProjectListPage_ModCount}          id=ctl00_MainContent_ucLoanListHeader_ucAnalysisDefectRatioNetModerate_lblLoans
${txt_ProjectListPage_EligibilityCount}  id=ctl00_MainContent_ucLoanListHeader_ucAnalysisDefectRatioNetEligibility_lblLoans
${lnkFirstClient}                        id=ctl00_MainContent_repProjects_ctl00_lblClient


***Keywords***

Get the MOD count for any particular Project
    [Documentation]     @Author: Mahesh || Get the MOD count for any particular Project
    
    ${ModCount}=  Get Text    ${img_ProjectList_FirstModCount}
    Log  ${ModCount}
    [Return]            ${ModCount}
    
Get the ELIG count for any particular Project
    [Documentation]     @Author: Mahesh || Get the ELIG count for any particular Project
    
    ${EligCount}=  Get Text    ${img_ProjectList_FirstELIGCount}
    ${ElgCount}=    Set Variable   ${EligCount} 
    Log  ${ElgCount}
    [Return]            ${ElgCount}
    
Click on the 'Client' link under client column
    [Documentation]    Click on the 'Client' link under client column
    
    Custom Wait Time For Element To Be Appear    ${lnkFirstClient}
    Click Element                                ${lnkFirstClient}
    Wait Until Location Contains                 LoanList.aspx    30s    
    Location Should Contain                      Reporting/LoanList.aspx 
    
Verify the MOD count for particular Project
    [Documentation]    @Author: Mahesh || Verify the MOD count for particular Project
    [Arguments]            ${ModCount}
    
    
    Custom Wait Time For Element To Be Appear    ${icon_ProjectListPage_ProjectSummary}
    Click Element                                ${icon_ProjectListPage_ProjectSummary}
    ${Mod_Count}=  Get Text    ${txt_ProjectListPage_ModCount}
    Run Keyword If    ${Mod_Count} == ${ModCount}  Log  Mod count is matching and the count is ${ModCount}
    ...    ELSE    Fail  Mod count is not matching 
   
    
Verify the ELG count for particular Project
    [Documentation]    @Author: Mahesh || Verify the ELG count for particular Project
    [Arguments]           ${ElgCount}
    
    ${Elg_Count}=  Get Text    ${txt_ProjectListPage_EligibilityCount}
    Run Keyword If    ${Elg_Count} == ${ElgCount}  Log  Elg count is matching and the count is ${ElgCount}
    ...    ELSE    Fail  Elg count is not matching  
    