*** Settings ***
Resource    ../Resources/AppUI/NewPages/AllTestPages.robot
Test Setup       Begin Web Test    
Test Teardown    End Web Test


*** Test Cases ***

Test_01:Login as admin the title
    [Documentation]    login as admin and verify the title
    
    #Precondtion
    OrangeLoginPage.Naviagte to OrangeHRM
    OrangeLoginPage.Login as Admin
    DashBoardPage.Verify Quick Launch in the Dashboard page
    
Test_02:Login as admin the title
    [Documentation]    login as admin and verify the title
    
    #Precondtion
    OrangeLoginPage.Naviagte to OrangeHRM
    OrangeLoginPage.Login as Admin
    
    #Testcase
    DashBoardPage.Verify Quick Launch in the Dashboard page
    DashBoardPage.Click on Assign Leave link
    AssignLeave.Enter the data in the assign leave form
    
    
    
    
    
    
*** Keyword ***