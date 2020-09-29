*** Settings ***
Library     ExtendedSelenium2Library
Library     DateTime    
Library     Collections    
Library     String    
Library     ExcelLibrary    
Library     Excel    
Library     ../../../CustomLib/Excel.py 

#Resources
Resource    ../../BaseSetup.robot
Resource    ../../../Data/InputData.robot
Resource    ../../../Data/Config.robot
Resource    LandingPage.robot
Resource    LoanQueuePage.robot
Resource    ReverificationPendingPage.robot
Resource    MenuNavigation.robot
Resource    FindingsPage.robot
Resource    AdminAccountPage.robot
Resource    TestManagementPage.robot
Resource    RebuttalsPage.robot
Resource    WorkQueuePage.robot
Resource    ProjectListPage.robot
Resource    AdminMaintenance.robot
Resource    RobotMethodsTest.robot

