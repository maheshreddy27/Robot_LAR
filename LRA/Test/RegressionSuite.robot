
*** Settings ***       
Resource    ../Resources/AppUI/Pages/AllPages.robot
Test Setup       Begin Web Test    
Test Teardown    End Web Test

*** Variables ***
#VEENA
@{ReturnValues}                             {EMPTY}
@{listofSecAndColNames}                     {EMPTY}
${DCLoanNumber}                             {EMPTY}
${dueDate}                                  {EMPTY}
${LoanNumber}                               {EMPTY}
${Finding}                                  {EMPTY}
${FailStatement}                            {EMPTY}

@{sLoanFactsToAddonTestManagement}          Create List    ADP Code  1-4 Family Rider  
${urlMainPage}                              https://loanquality-qa.loanhd.com/LQx/WorkQueueManagerAllLoans.aspx
${txtLetter}                                C  
${txtChangedCircumstance}                   Changed Circumstance
${txtValue}                                 15/02/2018
${txtExpected}                              15/02/2018

#Nandini
${URLAdminAccountListPage}                  https://loanauth-qa.loanhd.com/Administration/Accounts/AdminAccountList.aspx
${URLAdminAccountProfilePage}               https://loanauth-qa.loanhd.com/Administration/Accounts/ManageAccounts/Profile/AdminAccountProfile.aspx
${URLAdminAccountLoginsPage}                https://loanauth-qa.loanhd.com/Administration/Accounts/ManageAccounts/Users/AdminAccountLogins.aspx
${URLAdminEditGeneralPage}                  https://loanauth-qa.loanhd.com/ManageUser/AdminEdit/General
${URLAdminEditRolesRightsPage}              https://loanauth-qa.loanhd.com/ManageUser/AdminEdit/RolesRights
${URLAdminProfileAccessEditPage}            https://loanauth-qa.loanhd.com/Administration/Accounts/ManageAccounts/Profile/AdminProfileAccessEdit.aspx
${URLLoanHD}                                https://loanquality-qa.loanhd.com
${FindingURL}                               {EMPTY}     
@{lstLoanTypes}                             Conventional  FHA    Jumbo
${urlLoanQueuePage}                         https://loanquality-qa.loanhd.com/LQx/WorkQueueManagerAllLoans.aspx

#Girish
${urlReportingPage}                         https://loanquality-qa.loanhd.com/LQx/Reporting/ProjectList.aspx
@{sLoanFactToSelectLoanType}                Conventional  FHA  Jumbo  Other  Portfolio  USDA/RHS  VA

*** Test Cases ***  

# C1471_Verify the click on the Upload [+] icon
    # [Documentation]    @Author: Mahesh || LoanFacts || 30-08-2019
    # [Tags]             Level 1 Regression    
    
    # #Test Case Steps
    # LandingPage.Goto LQ Application
    # LandingPage.Login As UnderWriter Manager
    # LoanQueuePage.Click on the Reverifications menu
    # ReverificationPendingPage.Click on the Upload icon under UPLOAD column
    
C420641_Verify Added 'Test' pop up in findings page and check if the user is able to edit the data
    [Documentation]    @Author: Mahesh || Findings Page || 13-09-2019
    [Tags]  	       Level 1 Regression
    
    #Test Case Steps
    LandingPage.Login As UnderWriter Manager
    LoanQueuePage.Go to post close Loan queue Page
    # LoanQueuePage.Filter the loan by Client    ${QC_Client}
    LoanQueuePage.Click any loan number form the LOAN NUMBER column
    LoanQueuePage.Select any audit type in the loan queue page
    FindingsPage.Verify the defect popup   
    
C28673_Verify user can edit loan facts dropdown in LoanFacts tool section
    [Documentation]    @Author: Mahesh ||  || 14-09-2019
    [Tags]             Level 1 Regression
    
    #Test Case Steps
    LandingPage.Goto LQ Application
    LandingPage.Login As UnderWriter Manager
    LoanQueuePage.Go to post close Loan queue Page
    LoanQueuePage.Filter the loan by Client    ${Aklero}
    LoanQueuePage.Click on First Loan Number and Credit Audit
    Click on the LoanFacts under the TOOLS section and Edit the LF Value    Amount Financed    80.00
    LandingPage.Log Out from system
    
C121496_Check 2nd Attempt report for Written RVs on Completed tab for "Call Date" column.
    [Documentation]    @Author: Mahesh || Reverifications || 14-09-2019
    [Tags]             Level 1 Regression
    
    #Test Case Steps
    LandingPage.Goto LQ Application
    LandingPage.Login As UnderWriter Manager
    LoanQueuePage.Go to post close Loan queue Page
    ReverificationPendingPage.Click on the Reverifications menu
    ReverificationPendingPage.Go To Completed Tab
    ReverificationPendingPage.Filter Method & Resolution column
    ReverificationPendingPage.Click on Call Date and Download the PDF
    
C219232_Verify the contents present in the Test management page. (Attached report)
    [Documentation]    @Author: Mahesh || Configurations || 15-09-2019
    [Tags]             Level 1 Regression
    
    #Test Case Steps
    LandingPage.Login As Admin
    AdminAccountPage.From landing page go to Admin Account list page
    AdminAccountPage.Enter Institution Name and click on Edit link    Exhibit Mortgage
    AdminAccountPage.Verify the presence of "Test Management" section with edit link
    AdminAccountPage.Click on edit link in TestManagement Page
    sleep  8s
    AdminAccountPage.Click on "Assignment" tab if not selected and verify the contents present in it
    sleep  4s
    
C28685_Checking the defects count in the Defects tab and the Loan Facts tab
    [Documentation]    @Author: Mahesh || LoanFacts || 15-09-2019 
    [Tags]             Level 1 Regression
    
    #Test Case Steps
    LandingPage.Login As UnderWriter Manager
    MenuNavigation.Mouse over on Loan Quality and naviagte to Post Close Loan Queue
    LoanQueuePage.Filter the loan by Client    ${QC_Client}
    LoanQueuePage.Click any loan number form the LOAN NUMBER column
    LoanQueuePage.Select any audit type in the loan queue page
    
    
C5140_Verify the test data present in the downloaded Sheet
    [Documentation]    @Author: Mahesh || HMDA || 16-09-2019
    [Tags]             Level 1 Regression
     
    #Test Case Steps
    LandingPage.Login As UnderWriter Manager
    MenuNavigation.Mouse over on My Account and Click on Test Management
    TestManagementPage.Select required "Client" and "Product type" from the drop down    Exhibit Mortgage    Post Close (46)
    TestManagementPage.Click on Download Library button and display the column names
    
    
 C1457 - Verify the LTV/CLTV change for the Ratio header
    [Documentation]    @Author: Mahesh || LoanFacts || 25-12-2019
    [Tags]             Level 1 Regression
    
    LandingPage.Login As UnderWriter Manager
    #MenuNavigation.Mouse over on Loan Quality and naviagte to Post Close Loan Queue
    LoanQueuePage.Filter the loan by Client    ${QC_Client}
    ${sLoanNum}    LoanQueuePage.Click on First Loan Number and Credit Audit
    FindingsPage.Click on LoanFacts tab which is beside Documents tab
    FindingsPage.Click on the All Loan Facts link in the left side panel
    FindingsPage.Search the LF and Edit the LF Value    LTV    50.00
    FindingsPage.Search the LF and Edit the LF Value    CLTV    50.00
    FindingsPage.Click on the Ratios Tab
    FindingsPage.Verify LTV/CLTV is reflecting in the Ratios header
    LandingPage.Log Out from system
    
    
C261133_Verify the presence of following tabs in the "Rebuttals" section
    [Documentation]    @Author: Mahesh || Rebuttal || 06-01-2020
    [Tags]             Level 1 Regression
    
    #Test Case Steps
    LandingPage.Login As UnderWriter Manager
    MenuNavigation.Mouse hover on rebuttals tab
    RebuttalsPage.Click on "Rebuttals" tab present next to "Open Conditions" tab
    RebuttalsPage.Verify the presence of following tabs in the "Rebuttals" section
    
C24143_Verify the presence of SignaFacts section in the Navigation section.
    [Documentation]    @Author: Mahesh || Findings || 06-01-2020
    [Tags]             Level 1 Regression
    
    #Test Case Steps
    LandingPage.Login As UnderWriter Manager
    MenuNavigation.Mouse over on Loan Quality and naviagte to Post Close Loan Queue
    LoanQueuePage.Filter the loan by Client    ${QC_Client}
    LoanQueuePage.Click on any loan number form the LOAN NUMBER column
    LoanQueuePage.Verify if user is able to see Credit, Appraisal and Compliance Audit types in popup on clicking the loan number
    LoanQueuePage.Click on Credit Audit type
    FindingsPage.Verify the presence of SignaFacts section under Navigation Section
    
C5775 - Verify whether the defects to be displayed depends on the color (def severity level) selected in the selection box
    [Documentation]    @Author: Veena || WorkQueue || 2018
    [Tags]             Level 1 Regression
    
    #Test Case Steps
    LandingPage.Goto LQ Application
    LandingPage.Login As UnderWriter_1
    WorkQueuePage.Go to post close Work queue Page
    WorkQueuePage.Click Audit tab on Work Queue Page
    WorkQueuePage.Click on the Continue link for any of the Assigned loan in the "Assigned" section
    FindingsPage.Select a defect color in the display section
    LandingPage.Log Out from system
    
C121495_Verify the count of Defects under the DEFECTS section in the Projectlist page of reporting.
    [Documentation]    @Author: Mahesh || Reporting || 22-12-2019
    [Tags]	           Level 1 Regression     
       
    # Pre Condition
    LandingPage.Goto LQ Application
    LandingPage.Login As Client_User
    
    #Test Case Steps
    MenuNavigation.Mouse over on Loan Quality Tab and click on Post-Close Product Type and then click on the Reporting link
    ProjectListPage.Get the MOD count for any particular Project
    ${ModCount}    ProjectListPage.Get the ELIG count for any particular Project
    ${ElgCount}    ProjectListPage.Click on the 'Client' link under client column
    ProjectListPage.Verify the MOD count for particular Project    ${ModCount}
    ProjectListPage.Verify the ELG count for particular Project    ${ElgCount}
    
C6065_Verify the presence of 'Get LQxupdateservice Log' section in ServiceLogs under Logs
    [Documentation]    @Author: Mahesh || Administration || 24-12-2019
    [Tags]             Level 1 Regression
    
    # Pre Condition
    LandingPage.Login As Admin
    
    #Test Case Steps
    MenuNavigation.Mouse over on Loan Quality and naviagte to Post Close Loan Queue
    AdminMaintenance.Naviagte to Service Log page
    AdminMaintenance.Verify the 'Get LQxupdateservice Log' under 'See CE Logs' section
    
C413418_Verify The dropdown at the top would default to the company the user was logged in as
    [Documentation]    @Author: Mahesh || Administration || 29-03-2020
    [Tags]             Level 2 Regression    
    
    #Test Case Steps
    LandingPage.Login As UnderWriter Manager
    AdminAccountPage.From the Main Page, click on My Account
    AdminAccountPage.Click on UserList and check whether "Show Active Users" is disabled
    AdminAccountPage.Verify the dropdown value default to the company the user was logged in as    DEMO
    LandingPage.Log Out from system 
    
C257932_Verify that Hover the Client Name # displays the tool tip with list of Users assigned to them
    [Documentation]    @Author: Mahesh || Administration || 29-03-2020
    [Tags]             Level 2 Regression
    
    #Test Case Steps
    LandingPage.Goto LQ Application
    LandingPage.Login As Admin
    AdminAccountPage.Enter Institution Name and click on Edit link    DEMO
    AdminAccountPage.Go to Bulk User Management
    AdminAccountPage.Hover on the Client number link under Bulk User Management    Exhibit Mortgage
    LandingPage.Log Out from system
 
C257911_Verify the presence of the Test Account checkbox in the AdminAccountProfile.aspx page
    [Documentation]    @Author: Mahesh || Administration || 29-03-2020 
    [Tags]             Level 2 Regression
    
    #Test Case Steps
    LandingPage.Login As Admin
    AdminAccountPage.Enter Institution Name and click on Edit link    Exhibit Mortgage
    AdminAccountPage.Verify the Test Account checkbox beside the Account name    Administration/Accounts/ManageAccounts/Profile/AdminAccountProfile.aspx
    
C118218_Verify the presence of the HMDA settings under Access to section
    [Documentation]    @Author: Mahesh || Administration || 29-03-2020        
    [Tags]             Level 2 Regression
    
    LandingPage.Login As Admin
    AdminAccountPage.Enter Institution Name and click on Edit link    DEMO
    AdminAccountPage.Click on Edit link beside Account Type
    AdminAccountPage.Verify the presence of a service checkbox under the 'Access Settings' section    HMDA
    AdminAccountPage.Choose Access Settings and Save    HMDA
    AdminAccountPage.Logout from Admin Account
    
C1612_Verify the Delete link under Saved Reports tab
    [Documentation]    @Author: Mahesh || Report Builder || 29-03-2020
     [Tags]             Level 2 Regression             
    
     #Test case steps
     LandingPage.Login As UnderWriter Manager
     MenuNavigation.Click on the Report Builder tab in the top navigation bar
     # ReportBuilderSavedReportPage.Click on the first remove link
     # ReportBuilderSavedReportPage.Verify the Presence of Warning popup when clicking on delete
    
    
  