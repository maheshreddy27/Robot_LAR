*** Settings ***
Resource    AppUI/Pages/AllPages.robot

*** Variables ***

${DOWNLOAD_DIRECTORY}  ${EXECDIR}\\DownloadedFiles

*** Keywords ***
Begin Web Test
    # ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # # list of plugins to disable. disabling PDF Viewer is necessary so that PDFs are saved rather than displayed
    # ${disabled}    Create List    Chrome PDF Viewer
    # ${prefs}    Create Dictionary    download.default_directory=${EXECDIR}${/}RobotDownload    plugins.plugins_disabled=${disabled}
    # Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    # Create Webdriver    Chrome    chrome_options=${chrome options}
    # Maximize Browser Window
    # Go To    ${URL.${ENV}}
   
    # @{list} =  create list  disable-web-security      ignore-certificate-error
    # ${args} =   create dictionary  args=${list}         download.default.directory=${DOWNLOAD_DIRECTORY}
    # ${desired_caps} =   create dictionary  chromeOptions=${args}
    # open browser  about:blank   ${BROWSER}  desired_capabilitis=${desired_caps}
   
    ${path}=    Set Variable    ${DOWNLOAD_DIRECTORY}
    #Create Directory    ${path}       
    ${CHROME_OPTIONS}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary    download.default_directory=${path}    download.prompt_for_download=${False}    safebrowsing.enabled=${True}
    Call Method    ${CHROME_OPTIONS}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${CHROME_OPTIONS}
    Maximize Browser Window
    Go To    ${URL.${ENV}}
    
    # Open Browser    ${URL.${ENV}}    ${BROWSER}    desired_capabilitis=${desired_caps}
    # Maximize Browser Window
    
End Web Test
    close browser
    
#Nandini
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
    
Custom Wait Time For Element To Be Appear
    [Documentation]    Wait until given element is visible to perform action
    [Arguments]  ${element}  
    ${time}=  Set Variable    3    
     : FOR    ${INDEX}    IN RANGE    1    4
    \    Log    ${INDEX}
    \    sleep  3s
    \    ${status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${element}    
    \    Run Keyword If    '${status}' == 'False'    Log  waited for ${time} second in ${INDEX} iteration in for loop    
    \    ${time}=  Evaluate    ${time}+3 
    \    Run Keyword If    '${status}' == 'True'  Exit For Loop        
    Run Keyword If    '${status}' == 'False'    Log  Oops...Some thing wrong, Element is not found after trying ${time} seconds....
	[Return]  ${element}   

#**********************************************VEENA*************************************************************
#VEENA
Get Array/List Count
    [Documentation]                                    Get Array/List Count
    [Arguments]                                        @{arrayORlist}
    
    ${counter}                                         Set Variable    0
    : For                                              ${item}    IN    @{arrayORlist}
    \    ${counter}                                    Evaluate    ${counter} + 1
    ${count}                                           Evaluate    ${counter} - 1
    
    [Return]                                           ${count} 
    
#Bhavana
Select Checkbox
    [Documentation]    Selects the given checkbox
    [Arguments]    ${sSelectCheckbox}	
    
    ${checked} =   Checkbox Should Not Be Selected  ${sSelectCheckbox}
    Run Keyword if  '${checked}'  Click Element  ${sSelectCheckbox}  and wait
    ...    ELSE    Log    This is already selected
    
Unselect Checkbox
    [Documentation]    Unselects the given checkbox
    [Arguments]    ${sUnselectCheckbox}
    
    ${unchecked} =   Checkbox Should Be Selected  ${sUnselectCheckbox}
    Run Keyword if  '${unchecked}'  Click Element  ${sUnselectCheckbox}  and wait
    ...    ELSE    Log    This is already unselected
       
# Close Application Walk thru
    
    # ${sStatus}=    Run Keyword And Return Status    Element Should Be Visible    ${lnk_ReportBuilder_CloseWalkmethrough}    20s
    # Run Keyword If    '${sStatus}' == 'True'    Click Element    ${lnk_ReportBuilder_CloseWalkmethrough}
    
# Verify if two lists are equal
    # [Arguments]    @{arguments}
    
    # Lists Should Be Equal    ${arguments[0]}    ${arguments[1]}
    # Log    ${arguments[2]}
       
# Add a Defect for a Released loan
    # [Arguments]    ${sDefectColor}    ${sCategory}    ${sSubCategory}
    # [Return]       ${sLoanNum}    ${sFailStatement}    ${defectCustomtest}
    
    # MenuNavigation.Mouse over on Loan Quality and naviagte to Post Close Loan Queue
    # LoanQueuePage.Filter the loan by Client    ${QC_Client}
    # ${sLoanNum}    LoanQueuePage.Click on any loan number form the LOAN NUMBER column
    # LoanQueuePage.Click on Credit Audit type
    # FindingsPage.Click on Data tab
    # FindingsPage.Click on Audit Workflow button
    # FindingsPage.Click on the Status dropdown and select a particular Status    Released    Credit    Appraisal    Compliance
    # FindingsPage.Click on Save and Continue button on Audit Workflow Popup
    # FindingsPage.Click on +Test button from the finding page and choose defect color  ${sDefectColor}
    # FindingsPage.Select Category and subCategory from Add Test popup   ${sCategory}    ${sSubCategory} 
    # ${sFailStatement}    ${defectCustomtest}    FindingsPage.Add Custom Test, Defect stmt and choose Navigation display value from the Add Test popup  Assets
    