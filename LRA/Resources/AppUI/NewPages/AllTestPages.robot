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
#Resource    ../../../Data/InputData.robot
Resource    ../../../Data/Config.robot
Resource    OrangeLoginPage.robot
Resource    TestInputData.robot
Resource    DashBoardPage.robot
Resource    AssignLeave.robot