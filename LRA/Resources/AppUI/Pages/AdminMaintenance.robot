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

Naviagte to Service Log page 
    [Documentation]    @Author: Mahesh || Navigates to Maintenance Service Log page
    
    Go To                           ${ServiceLogsUrl}
    Wait Until Location Contains    ${ServiceLogsUrl}                           
    
Verify the 'Get LQxupdateservice Log' under 'See CE Logs' section
    [Documentation]    @Author: Mahesh || Verifies the 'Get LQxupdateservice Log' under 'See CE Logs' section
    
     
    Wait Until Element Is Visible    ${lbl_ServiceLogs_GetLQxUpdateServiceLog}    30s
    Element Should Be Visible        ${lbl_ServiceLogs_GetLQxUpdateServiceLog}
    Element Should Be Visible        ${lbl_ServiceLogs_Date}
    Element Should Be Visible        ${lbl_ServiceLogs_Category}
    Element Should Be Visible        ${btn_ServiceLogs_Get}
    Element Should Be Visible        ${ddl_ServiceLogs_Category}
    Log                              It is displaying 'Get LQxupdateservice Log' with Date, Category drop down and Get button.
    