***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot


***Variables***
${mnu_MenuNavigation_LoanQuality}               xpath= //a[text()='Loan Quality']
${tab_MenuNavigation_MyAccount}                 xpath=//*[text()='My Account']
${lnk_MenuNavigation_TestManagement}            xpath=//*[@id="MyAccount_TestManagement"]/a
${lnk_MenuNavigation_AccountInformation}        xpath=//*[text()="Account Information"]
${tab_MenuNavigation_PostClose}                 xpath=//*[@id='tabPostClose'] | //*[@id='ctl00_ctl24_lblPostClose'] | //*[@id='ctl00_ctl29_lblPostClose'] | //*[@id='PostClose'] | //li[@id='tabPostClose']/a 
${mnu_MenuNavigation_PostCloseLoanQueue}        xpath=//div[@id="PostCloseContent"]//li[@id="LQx_WorkQueueManager"]/a | //li[@id="hlLoanQueuesPostClose"]
${tab_MenuNavigation_Rebuttal}                  xpath=//span[@class="subnav-link-name"][contains(text(),'Rebuttal')]
${mnuLoanQuality}                               xpath=//a[text()='Loan Quality']
${tabPostClose}                                 xpath=//*[@id='tabPostClose'] | //*[@id='ctl00_ctl24_lblPostClose'] | //*[@id='ctl00_ctl29_lblPostClose'] | //*[@id='PostClose'] | //li[@id='tabPostClose']/a 
${mnuReporting}                                 xpath=//*[@id="ctl00_ctl24_uscPostClose_LQx_Reporting"] | //*[@id="hlReportingPostClose"] | //li[@id="hlReportingCDW"]/a | //*[@id="PostCloseContent"]//*[@id="LQx_Reporting"]
${lnk_MenuNavigation_ReportBuilder}             xpath=//*[@id='ReportBuilder'] | //*[text()='Report Builder']
${tab_ReportBiulder_CreateNew}                  xpath=//td[@id='CreateNew']
${tab_ReportBiulder_SavedReportActive}          xpath=//td[@id='SavedReport'][@class='tab_active']




***Keywords***
   
Mouse over on Loan Quality and naviagte to Post Close Loan Queue
    [Documentation]   click on Post-Close
    
    Focus    ${mnu_MenuNavigation_LoanQuality}
    Sleep    2s
    Mouse Over    ${mnu_MenuNavigation_LoanQuality}
    Wait Until Element Is Visible    ${tab_MenuNavigation_PostClose}    20s
    Click Element   ${tab_MenuNavigation_PostClose}
    Wait Until Element Is Enabled    ${mnu_MenuNavigation_PostCloseLoanQueue}   20s
    Click Element   ${mnu_MenuNavigation_PostCloseLoanQueue}
    Sleep    2s
    
Mouse over on My Account and Click on Test Management
    [Documentation]    Mouse over on My Account and Click on Test Management
    
    Mouse Over                       ${tab_MenuNavigation_MyAccount}
    Wait Until Element Is Visible    ${lnk_MenuNavigation_TestManagement}
    Click Element                    ${lnk_MenuNavigation_TestManagement}
    Wait Until Location Contains     TestManagement/Configurations    30s
    Location Should Contain          TestManagement/Configurations
    
Mouse hover on rebuttals tab
  Wait Until Element Is Visible    ${tab_MenuNavigation_Rebuttal}    10
  Click Element  ${tab_MenuNavigation_Rebuttal}
  
Mouse over on Loan Quality Tab and click on Post-Close Product Type and then click on the Reporting link
    [Documentation]   Mouse over on Loan Quality Tab and click on Post-Close Product Type and then click on the Reporting link          
  
    Mouse Over   ${mnuLoanQuality} 
    Page Should Contain Element    ${tabPostClose}  5s      
    Click Element   ${tabPostClose}
    Wait Until Element Is Enabled    ${mnuReporting}  5s
    Click Element    ${mnuReporting}
    Wait Until Location Contains    ProjectList.aspx
    Location Should Contain    Reporting/ProjectList.aspx 
  
Click on the Report Builder tab in the top navigation bar
    [Documentation]    @Autor Shakunthala Click on the Report Builder tab in the top navigation bar
    Click Element    ${lnk_MenuNavigation_ReportBuilder}
    Custom Wait Time For Element To Be Appear    ${tab_ReportBiulder_CreateNew}
    Location Should Contain    ReportBuilder/SavedReport
    Page Should Contain Element    ${tab_ReportBiulder_CreateNew}
    Page Should Contain Element    ${tab_ReportBiulder_SavedReportActive}  