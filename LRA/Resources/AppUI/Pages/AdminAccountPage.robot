***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot

***Variables***
${btn_AdminAccountPage_Admin}                             xpath=//*[text()='Admin']
${btn_AdminAccountPage_AdminActive}                       xpath=//font[contains(text(),'Admin')]//ancestor::li[@class="active"]
${lnk_AdminAccountPage_AddNewAccount}                     xpath=//*[@id='ctl00_MainContent_lbtAddAccount']
${txtbx_AdminAccountPage_Institution}                     id=ctl00_MainContent_gridAccountList_DXFREditorcol2_I
${lnk_AdminAccountPage_EditAdmin}                         id=ctl00_MainContent_gridAccountList_cell0_3_lbtEdit
${tb_AdminAccountPage_ProfileActive}                      xpath=//*[@id="tdProfileSectionMenu"][@class="tab_active"]
${tb_AdminAccountPage_Users}                              xpath=//font[text()='Users']
${lbl_AdminAccountPage_TestManagement}                    id=ctl00_MainContent_ucEdit_pnlTestManagement
${lbl_AdminAccountPage_EditTestManagement}                id=ctl00_MainContent_ucEdit_aTestManagement
${tab_AdminAccountPage_ConfigurationTestManagement}       xpath=//td[@id='Configuration'][@class='tab_active']
${ddl_AdminAccountPage_TestManagementClient}              id=tmg-drd-client
${lbl_AdminAccountPage_TestManagementProduct}             xpath=//*[@class="tmg-filter-header"][text()="PRODUCT"]
${lbl_AdminAccountPage_TestManagementAssignTest}          xpath=//*[@class="tmg-filter-header"][text()="ASSIGN TEST PACKAGE FROM"]
${btn_AdminAccountPage_SaveTestManagement}                xpath=//div[@class="tmg-btn-save"]
${btn_AdminAccountPage_CancelTestManagement}              xpath=//a[@id='btnCancel'][@class="filter-btn-gray"]
${tab_AdminAccountPage_AssignmentTestManagement}          xpath= //td[@id='Assignment'][@class='tab']
${lbl_ServiceLogs_GetLQxUpdateServiceLog}                 xpath=//legend[contains(text(),'Get LQxUpdateService Log')]
${lbl_ServiceLogs_Date}                                   xpath=//td[contains(text(),'Date')]
${lbl_ServiceLogs_Category}                               xpath=//td[contains(text(),'Category')]
${btn_ServiceLogs_Get}                                    id=btnGetServiceLog
${ddl_ServiceLogs_Category}                               id=ddlLQxUpdateService
${lbl_AdminAccountPage_MyAccount}                         xpath=//*[text()="My Account"]
${lnk_AdminAccountPage_UserList}                          xpath=//*[contains(text(),'User List')]
${ddl_AdminAccountPage_CompanyName}                       xpath=(//select)[1]
${lnk_AdminAccountPage_EditBulkUserManagement}	          xpath=//*[text()="Bulk User Management"]/..//a
${lnk_AdminAccountPage_Clients}	                          xpath=//*[@class="tab_active"]//*[text()="Clients"]
${lnk_AdminAccountPage_Users}	                          xpath=//*[@class="tab"]//*[text()="Users"]
${txt_AdminAccountPage_ClientName}	                      id=bulkUserManagementClientsGrid_DXFREditorcol1_I
${lbl_AdminAccountPage_ListofUsers}	                      xpath=(//*[@class="bum-tooltip-content"])[2]/div
${txt_AdminAccountPage_TestAccount}                       Test Account	
${chkbx_AdminAccountPage_TestAccountProfile}              id=cbxTestAccountSectionMenu 
${lnk_AdminAccountPage_EditAccountType}                   xpath=//*[contains(text(),'Account Type')]//following-sibling::th/a
${txt_AdminAccountPage_AccessType}                        xpath=//label[text()='ACCESS_TYPE']/preceding-sibling::input
${url_AdminAccountPage_AdminProfileAccessEdit}            Administration/Accounts/ManageAccounts/Profile/AdminProfileAccessEdit.aspx
${btn_AdminAccountPage_SaveService}                       id=ctl00_MainContent_ucEdit_btnSave
${lnk_AdminAccountPage_AdminLogout}                       xpath=//*[text()='Log Off']
${lnk_AdminAccountPage_EditAppQNetworkRoles}              id=ctl00_MainContent_ucEdit_aAppQRoles


***Keywords***

From landing page go to Admin Account list page
   [Documentation]  From landing page go to Admin Account list page
   Wait Until Element Is Enabled    ${btn_AdminAccountPage_Admin}  20s   
   Click Element                    ${btn_AdminAccountPage_Admin}  
   Wait Until Element Is Visible    ${btn_AdminAccountPage_AdminActive}  30s       
   Location Should Contain          Administration/Accounts/AdminAccountList
   
Enter Institution Name and click on Edit link
    [Documentation]  Enter Institution Name and click on Edit link
    [Arguments]  ${txtbxInstitution_Name}
    
    Wait Until Element Is Visible  ${lnk_AdminAccountPage_AddNewAccount}
    Page Should Contain    Add New Account   
    Click Element   ${txtbx_AdminAccountPage_Institution}
    Input Text    ${txtbx_AdminAccountPage_Institution}    ${txtbxInstitution_Name}
    Wait Until Page Contains    ${txtbxInstitution_Name}  40s    
    Sleep    10s
    Wait Until Element Is Visible    ${lnk_AdminAccountPage_EditAdmin}    40s  
    Click Link    ${lnk_AdminAccountPage_EditAdmin}
    Sleep    8s    
    Custom Wait Time For Element To Be Appear    ${tb_AdminAccountPage_ProfileActive}
    Wait Until Element Is Visible    ${tb_AdminAccountPage_Users}   35s 
    Location Should Contain    Administration/Accounts/ManageAccounts/Profile/AdminAccountProfile
    
Verify the presence of "Test Management" section with edit link
    [Documentation]  Verify the presence of "Test Management" section with edit link.
    
    Page Should Contain Element    ${lbl_AdminAccountPage_TestManagement}
    Page Should Contain Element    ${lbl_AdminAccountPage_EditTestManagement}

Click on edit link in TestManagement Page
     [Documentation]  Click on edit link in TestManagement Page
      
     Click Element    ${lbl_AdminAccountPage_EditTestManagement} 
     Wait Until Page Contains Element    ${tab_AdminAccountPage_ConfigurationTestManagement}  30s
     
Click on "Assignment" tab if not selected and verify the contents present in it
    [Documentation]   Click on "Assignment" tab if not selected and verify the contents present in it
    
     ${attributevalue}=  Get Element Attribute     ${tab_AdminAccountPage_ConfigurationTestManagement}@class
     Run Keyword If    '${attributevalue}'=='tab_active'   Click Element  ${tab_AdminAccountPage_AssignmentTestManagement}
     ...  ELSE    log   Assignment tab Already selected
     Run Keyword And Continue On Failure   Page Should Contain Element   ${ddl_AdminAccountPage_TestManagementClient}         
     Run Keyword And Continue On Failure   Page Should Contain Element   ${lbl_AdminAccountPage_TestManagementProduct}       
     Run Keyword And Continue On Failure   Page Should Contain Element   ${lbl_AdminAccountPage_TestManagementAssignTest}       
     Run Keyword And Continue On Failure   Page Should Contain Element   ${btn_AdminAccountPage_SaveTestManagement} 
     Run Keyword And Continue On Failure   Page Should Contain Element   ${btn_AdminAccountPage_CancelTestManagement} 
     
From the Main Page, click on My Account
    [Documentation]   click on My Account
    Mouse Over  ${lbl_AdminAccountPage_MyAccount}
     
Click on UserList and check whether "Show Active Users" is disabled
    [Documentation]    Click on UserList and check whether "Show Active Users" is disabled
    Click Element    ${lnk_AdminAccountPage_UserList}
    Sleep    5s 
    Page Should Contain    Show Active Users  
    
Verify the dropdown value default to the company the user was logged in as
    [Documentation]                                Verify the dropdown value default to the company the user was logged in as
    [Arguments]                                    ${companyName}
    
    Custom Wait Time For Element To Be Appear            ${ddl_AdminAccountPage_CompanyName}
    ${defaultCompany}                                    Get Selected List Label    ${ddl_AdminAccountPage_CompanyName}
    Should Contain                                       ${defaultCompany}    ${companyName}
    Log    User is able to view the dropdown value default to the company the user was logged in as.  
    
Go to Bulk User Management
    [Documentation]    Go to Bulk User Management
    Wait Until Element Is Visible    ${lnk_AdminAccountPage_EditBulkUserManagement}
    Click Element    ${lnk_AdminAccountPage_EditBulkUserManagement}
    Wait Until Location Contains    BulkUserManagement/Clients    
    Page Should Contain Element    ${lnk_AdminAccountPage_Clients}
    Page Should Contain Element    ${lnk_AdminAccountPage_Users}
    
Hover on the Client number link under Bulk User Management
    [Documentation]    Hover on the Client number link on the Bulk User Management Page.
    [Arguments]    ${clientName}
    Wait Until Element Is Visible    ${txt_AdminAccountPage_ClientName}
    Input Text    ${txt_AdminAccountPage_ClientName}    ${clientName}
    Wait Until Page Contains Element    xpath=//*[text()="${clientName}"]/../span[2]
    Scroll Element Into View    xpath=//*[text()="${clientName}"]/../span[2]
    ${clientNum}=    Get Text    xpath=//*[text()="${clientName}"]/../span[2]
    sleep    5s
    Mouse Over    xpath=//*[text()="${clientName}"]/../span[2]        
    sleep    10s 
    @{sListofUsers}=  Create List
    @{wbListofUsers}    Get Webelements    ${lbl_AdminAccountPage_ListofUsers}
    :FOR  ${users}    IN    @{wbListofUsers}
    \    ${name}=    Get Text    ${users}    #xpath=(//*[@class="bum-tooltip-content"])[2]/div[${i}]
    \    Append To List    @{sListofUsers}    ${name}
    \    Log To Console    ${name}    
    @{copiedList}=    Sort List    ${sListofUsers}
    Lists Should Be Equal    ${sListofUsers}    ${copiedList}
    Log    Displaying the total list of users assigned to that client in a alphabetically sorted order  
    
Verify the Test Account checkbox beside the Account name
    [Documentation]  Verify the Test Account checkbox beside the Account name
    [Arguments]  ${urluserprofile}
    
    Location Should Contain   ${urluserprofile}
    #Sleep    8s 
    #Wait Until Element Is Enabled    ${txtTest Account}
    #test line 
    Sleep    5s       
    Page Should Contain   ${txt_AdminAccountPage_TestAccount}       
    Element Should Be Visible   ${chkbx_AdminAccountPage_TestAccountProfile}    message=Test Account checkbox beside the Account name is not present    

Click on Edit link beside Account Type
    [Documentation]    Click on Edit link beside Account Type
       
    Custom Wait Time For Element To Be Appear    ${lnk_AdminAccountPage_EditAccountType}
    Click Element    ${lnk_AdminAccountPage_EditAccountType}
    
Verify the presence of a service checkbox under the 'Access Settings' section
    [Documentation]        Verify the presence of a service under the 'Access Settings' section
    [Arguments]        ${sAccessType}
    
    ${accessType}    Replace String    ${txt_AdminAccountPage_AccessType}    ACCESS_TYPE    ${sAccessType}
    Page Should Contain Checkbox       ${accessType}
    
Choose Access Settings and Save
    [Documentation]    Choose Access Settings and Save
    [Arguments]    ${sAccessType}
    
    Location Should Contain                      ${url_AdminAccountPage_AdminProfileAccessEdit}
    ${accessType}    Replace String              ${txt_AdminAccountPage_AccessType}    ACCESS_TYPE    ${sAccessType}    
    Custom Wait Time For Element To Be Appear    ${accessType}
    ${isChecked}    Get Element Attribute        ${accessType}@checked
    Run Keyword If    '${isChecked}'=='true'     Log  ${sAccessType} is already checked  
    ...    ELSE    Click Element                 ${accessType}    
    
    Custom Wait Time For Element To Be Appear    ${btn_AdminAccountPage_SaveService}
    Click Element                                ${btn_AdminAccountPage_SaveService}
    
Logout from Admin Account
    [Documentation]   Logout from Admin Account 
    Wait Until Element Is Visible    ${lnk_AdminAccountPage_AdminLogout}       
    Click Element    ${lnk_AdminAccountPage_AdminLogout}
    
Go to AppQ Network™ Roles Page
    [Documentation]    Go to AppQ Network™ Roles
    Wait Until Element Is Visible    ${lnk_AdminAccountPage_EditAppQNetworkRoles}
    Click Element    ${lnk_AdminAccountPage_EditAppQNetworkRoles}
    Wait Until Location Contains    Profile/AdminAccountAppQRoles.aspx