*** Settings ***
Library     ExtendedSelenium2Library    
Resource    AllPages.robot

*** Variables ***
${tab_RebuttalsPage_Rebuttals}                                xpath=//*[text()='Rebuttals']

*** Keywords ***

Click on "Rebuttals" tab present next to "Open Conditions" tab
   [Documentation]    Click on "Rebuttals" tab present next to "Open Conditions" tab
   Click Element    ${tab_RebuttalsPage_Rebuttals}
   Location Should Contain    Rebuttals/
   Sleep    5s
   
Verify the presence of following tabs in the "Rebuttals" section
    [Documentation]    	Verify the presence of following tabs in the "Rebuttals" section
      @{sLabeltabs}=  Create List  Open Conditions  Rebuttals  History
      :For  ${Item}  IN  @{sLabeltabs} 
    \     ${status}=  Run Keyword And Return Status    Page Should Contain    ${Item}  
    \     Run Keyword If  '${status}' == 'True'   Log  ${Item} displayed successfully   ELSE   Log  unable to disply item ${Item}
    