***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot

***Variables***
${tab_FindingsPage_Document}                             id=ctl00_ctl00_ContentLoanSummary_ucMainSubMenu_subNavigation_ucTabTopMenu_repTabs_ctl02_lbtMenu
${txt_FindingsPage_CategoryNameUnderTests}               xpath=(//*[@is_pointer="true"])[1]/ancestor::tr/preceding-sibling::tr//span[@class="category"]
${txt_FindingsPage_SubCategoryNameUnderTests}            xpath=(//*[@is_pointer="true"])[8]/ancestor::tr/preceding-sibling::tr//span[@class="subcategory"]
${lnk_FindingsPage_Expand}                               xpath=//a[contains(text(),'Expand')]
${txt_FindingsPage_RebuttalIdInpopup}                    xpath=//*[text()='Notification']/ancestor::div[@class='header']/following-sibling::div/*[contains(text(),'REBUTTAL ID:')]
${txt_FindingsPage_RebuttalMsgInpopup}                   xpath=//*[text()='Notification']/ancestor::div[@class='header']/following-sibling::div/*[contains(text(),'An active Rebuttal exists for this test')]
${btn_FindingsPage_RebuttalPopupOk}                      xpath=//*[@value="OK"]
${img_FindingsPage_FirstDefectColourBox}                 xpath=(//*[@is_pointer="true"])[1]
${txt_FindingsPage_RebuttalNotificationPopup}            xpath=//*[text()='Notification']
${txt_FindingsPage_CategoryNameInDefectPopup}            xpath=//span[@data-bind="text: ChangeableFields.SelectedCategoryName"]
${txt_FindingsPage_SubCategoryNameInDefectPopup}         xpath=//span[@data-bind="text: ChangeableFields.SelectedSubCategoryName"]
${lnk_FindingsPage_LoanFacts}                            id=ctl00_ctl00_ContentLoanSummary_ucMainSubMenu_subNavigation_ucVerticalMenu_repTabs_ctl03_lbtMenu
${txt_FindingsPage_LoanFactName}                         xpath=//*[@id="ctl00_MainContent_ddtLoanFactName_txbText"]
${txt_FindingsPage_DocumentData}	                     xpath=(//*[@item_id="lfe-lf-value"])[3]
${rdbtn_FindingsPage_Documnet}                           xpath=(//*[@item_id="lfe-lf-prmote"])[3]
${btnSave_FindingsPage_LFData}	                         xpath=//*[@class="btn btn-green"]
${lbl_FindingsPage_LFValue}                              xpath=//*[@id="spn-value"]
${url_FindingsPage}                                      LQx/Findings
${tab_FindingsPage_LoanFact}                             id=ctl00_ctl00_ContentLoanSummary_ucMainSubMenu_subNavigation_ucTabTopMenu_repTabs_ctl03_lbtMenu
${lnk_FindingsPage_AllLoanFacts}                         xpath=//a[text()='All LoanFacts']
${imgLoading_FindingsPage}                               xpath=//div[@class='loadingScreenPopupContent']
${txt_FindingsPage_SearchboxLoanfacts}                   xpath=//*[@id="ctl00_ctl00_MainContent_MainContent_loanFactsControl_txbSearch"]
${lbl_FindingsPage_grayColour}                           xpath=//*[@id="ctl00_ctl00_MainContent_MainContent_loanFactsControl_ucSwitcherDefLevel_spnNA"]/span
${txt_FindingsPage_LFValue}                              xpath=//*[@id="lfe-table"]//tr[3]//*[@item_id="lfe-lf-value"]
${iconSave}                                              xpath=//*[@id="lfe-table"]//*[@id="btnSave"][@after_save_script="$('#ctl00_ctl00_MainContent_MainContent_loanFactsControl_btnRefreshTotals').show(); master_refreshHeader();;"]
${tab_FindingsPage_Ratios}	                             xpath=//*[@id="Ratios"]
${txt_FindingsPage_lblLtv/Cltv}                          xpath=//*[contains(text(),'LTV/CLTV')]
${lbl_FindingsPage_editedLtv/CltvValue}                  id=ctl00_ctl00_ContentLoanSummary_ucMainSubMenu_subRatios_tableRatios_ItemTotalLtvCltv_LabelExistingValue
${LFValue}                                               {EMPTY}
${icon_FindingsPage_Ltv/CltvDiscrepancy}                 id=ctl00_ctl00_ContentLoanSummary_ucMainSubMenu_subRatios_tableRatios_ItemTotalLtvCltv_dvWarnings
${lbl_Findings_SignaFacts}	                             xpath=//*[text()='SECTION NAVIGATION']/..//*[text()='SignaFacts™']	
${icon_Findings_greenDefect}                             xpath=//*[@data-type="Good"]
${icon_Findings_grayDefect}                              xpath=//*[@data-type="NA"]
${icon_Findings_redDefect}                               xpath=//*[@data-type="Significant"]
${icon_Findings_yellowDefect}                            xpath=//*[@data-type="Moderate"]
${icon_Findings_defectsDisplayed}                           xpath=//table[@class="docs-grid"]/tbody[@data-bind="foreach: SubCategories"]//tr[@id="trFindings"][@style="height: 32px;"]/td[@class="finding-desc"]/a[@defect_level="Significant"]

***Keywords***

Click on Expand
    [Documentation]    Click on Expand
    
    Custom Wait Time For Element To Be Appear    ${lnk_FindingsPage_Expand}
    Click Element    ${lnk_FindingsPage_Expand}
    Sleep    5s
    
Verify Rebuttal Notification Popup
    [Documentation]    Verifies Rebuttal Notification Popup
        
    Is Element Visible    ${txt_FindingsPage_RebuttalIdInpopup}
    Is Element Visible    ${txt_FindingsPage_RebuttalMsgInpopup} 
    Click Element         ${btn_FindingsPage_RebuttalPopupOk}
    Sleep    1s     
    
Verify the defect popup
    [Documentation]    Verify the defect popup
    
    ${categoryUnderTest}       Get Text    ${txt_FindingsPage_CategoryNameUnderTests}
    ${subCategoryUnderTest}    Get Text    ${txt_FindingsPage_SubCategoryNameUnderTests}
    
    Click on Expand
    FindingsPage.Select the given defect colors in the display section    Good    NA
    Click Element              ${img_FindingsPage_FirstDefectColourBox} 
    Sleep    5s
     
    ${isNotificationPopupPresent}    Is Element Visible    ${txt_FindingsPage_RebuttalNotificationPopup}
    Run Keyword If    '${isNotificationPopupPresent}'=='True'    Verify Rebuttal Notification Popup   
    
    ${categoryDefectPopup}     Get Text    ${txt_FindingsPage_CategoryNameInDefectPopup}
    ${subCategoryDefectPopup}  Get Text    ${txt_FindingsPage_SubCategoryNameInDefectPopup}
    
    Should Be Equal    ${categoryUnderTest}       ${categoryDefectPopup}       ignore_case=True    
    Should Be Equal    ${subCategoryUnderTest}    ${subCategoryDefectPopup}    ignore_case=True
    
Select the given defect colors in the display section
    [Documentation]    Select the given defect colors in the display section. Following are the defect to be passed based on the color
    ...    Gray   -  NA
    ...    Green  -  Good
    ...    Yellow -  Moderate
    ...    Reg    -  Significant   
    [Arguments]        @{sDefectColors}
    
    ${sDefectToBeSelected}    Set Variable    xpath=//*[@data-type="DEFECT"]    
    :FOR    ${defect}    IN    @{sDefectColors}
    \    ${sDefectColor}    Replace String    ${sDefectToBeSelected}    DEFECT    ${defect}    
    \    Wait Until Element Is Visible    ${sDefectColor}    
    \    ${selectedStatus}    Get Element Attribute   ${sDefectColor}@data-selected
    \    Run Keyword If    '${selectedStatus}'!='true'    Click Element   ${sDefectColor}  ELSE
    \    ...  Log  The defect is already selected
    \    Sleep    1s
    
Click on the LoanFacts under the TOOLS section and Edit the LF Value
    [Documentation]    Click on the LoanFacts under the TOOLS section
    [Arguments]    ${LoanfactName}    ${LoanFactValue}
    
    Click Element                    ${lnk_FindingsPage_LoanFacts}    
    sleep                            10s
    Select Window                    NEW
    Wait Until Element Is Visible    ${txt_FindingsPage_LoanFactName}    
    Focus                            ${txt_FindingsPage_LoanFactName}
    Input Text                       ${txt_FindingsPage_LoanFactName}    ${LoanfactName}
    Press Key                        ${txt_FindingsPage_LoanFactName}    \\13
    Sleep                            2s
    Wait Until Element Is Visible    ${txt_FindingsPage_DocumentData}    
    Focus                            ${txt_FindingsPage_DocumentData}
    Input Text                       ${txt_FindingsPage_DocumentData}    ${LoanFactValue}
    Click Element                    ${rdbtn_FindingsPage_Documnet}
    Click Element                    ${rdbtn_FindingsPage_Documnet}
    sleep                            5s
    Focus                            ${btnSave_FindingsPage_LFData}  
    Click Element                    ${btnSave_FindingsPage_LFData}    
    sleep                            10s
    ${slblLFValue}=                  Get Text    ${lbl_FindingsPage_LFValue}
    Log                              ${slblLFValue}
    Should Be Equal                  ${slblLFValue}    ${LoanFactValue}    
    Run Keyword If    '${slblLFValue}' == '${LoanFactValue}'    Log    LoanFact Value is saved and displayed.    ELSE
    ...    Log    LoanFact Value is not saved and displayed.
    Select Window    MAIN  
    
Click on LoanFacts tab which is beside Documents tab
    [Documentation]    click on Loanfacts tab
   
    Location Should Contain  ${url_FindingsPage}  
    Click Element  ${tab_FindingsPage_LoanFact}
    Sleep   6s 
    
Click on the All Loan Facts link in the left side panel 
    [Documentation]    Click on the All Loan Facts link  
    Wait Until Page Contains Element  ${lnk_FindingsPage_AllLoanFacts}   40s
    Click Element    ${lnk_FindingsPage_AllLoanFacts}
    Wait Until Element Is Not Visible    ${imgLoading_FindingsPage}    60s 
    
Search the LF and Edit the LF Value
    [Documentation]    Search the LF and Edit the LF Value    
    [Arguments]    ${LoanFact}    ${LoanFactValue}
    Set Global Variable    ${LoanFactValue}       
    Focus    ${txt_FindingsPage_SearchboxLoanfacts}
    Input Text    ${txt_FindingsPage_SearchboxLoanfacts}    ${LoanFact} 
    Press Key    ${txt_FindingsPage_SearchboxLoanfacts}   \\13
    Wait Until Element Is Not Visible    ${imgLoader_TestManagementPage_TestManagement}     60s
    ${status}=    Run Keyword And Return Status    Element Attribute Should Contain    ${lbl_FindingsPage_grayColour}    def-selected   
    Run Keyword If    '${status}' == 'True'    Log    Gray defect is already selected.
    ...    ELSE    Click Element    ${lbl_FindingsPage_grayColour}      
    sleep    30s      
    Wait Until Page Contains Element    xpath=//*[@id="ctl00_ctl00_MainContent_MainContent_loanFactsControl_loanFactList_divWrapper"]//table//tr/td/span[text()="${LoanFact}"]/../..//*[@id="lfe-drd-image"][@is_active="True"]
    Mouse Over    xpath=//*[@id="ctl00_ctl00_MainContent_MainContent_loanFactsControl_loanFactList_divWrapper"]//table//tr/td/span[text()="${LoanFact}"]/../following-sibling::td[1]
    sleep    10s
    Click Element    xpath=//*[@id="ctl00_ctl00_MainContent_MainContent_loanFactsControl_loanFactList_divWrapper"]//table//tr/td/span[text()="${LoanFact}"]/../..//*[@id="lfe-drd-image"][@is_active="True"]
    sleep    10s
    Focus    ${txt_FindingsPage_LFValue}
    ${LFValue}=    Set Variable    ${LoanFactValue}
    Set Global Variable    ${LFValue}
    sleep    5s
    Input Text    ${txt_FindingsPage_LFValue}   ${LFValue} 
    sleep    5s
    Click Element    xpath=//*[@id="lfe-table"]//tr[3]//*[@item_id="lfe-lf-prmote"]
    Click Element    xpath=//*[@id="lfe-table"]//tr[3]//*[@item_id="lfe-lf-prmote"]
    Sleep    2s
    Click Element    ${iconSave}  
    sleep    10s
 
Click on the Ratios Tab
    [Documentation]    Click on the Ratios Tab
    Wait Until Element Is Visible    ${tab_FindingsPage_Ratios}    
    Click Element    ${tab_FindingsPage_Ratios}
    sleep    10s
    
Verify LTV/CLTV is reflecting in the Ratios header
    [Documentation]      Verify LTV/CLTV is reflecting in the Ratios header
    Wait Until Element Is Visible    ${txt_FindingsPage_lblLtv/Cltv}
    Page Should Contain Element    ${lbl_FindingsPage_editedLtv/CltvValue}
    ${seditedLtv/CltvValue}=    Get Text    ${lbl_FindingsPage_editedLtv/CltvValue}
    ${eLFValue}=    Catenate    ${LFValue}         %         /         ${LFValue}         %
    Log To Console    ${eLFValue}  
    Log To Console    ${seditedLtv/CltvValue}      
    Should Be Equal    ${eLFValue}    ${seditedLtv/CltvValue}
    Run Keyword If    '${eLFValue}' == '${seditedLtv/CltvValue}'    Log    LTV/CLTV Value is reflecting in the Ratios header    ELSE
    ...    Log    LTV/CLTV Value is not reflecting in the Ratios header  
    Page Should Contain Element    ${icon_FindingsPage_Ltv/CltvDiscrepancy}    
    Log    Discrepancy icon is displayed.
    
Verify the presence of SignaFacts section under Navigation Section
    [Documentation]     @Author: Mahesh || Verify the presence of SignaFacts section under Navigation Section
     
    Wait Until Page Contains Element        ${lbl_Findings_SignaFacts}   20s 
    Page Should Contain Element             ${lbl_Findings_SignaFacts}
    Log                                     User is able to view the SignaFacts Section in Navigation Section
    
Select a defect color in the display section
    [Documentation]    Select a defect color in the display section
    Wait Until Element Is Visible    ${icon_Findings_greenDefect}
    ${greenDefectStatus}=  Get Element Attribute   ${icon_Findings_greenDefect}@data-selected
    Run Keyword If    '${greenDefectStatus}'=='True'    Click Element   ${icon_Findings_greenDefect}  ELSE
    ...  Log  Green defect is deselected
    sleep    10s
    ${grayDefectStatus}=    Get Element Attribute    ${icon_Findings_grayDefect}@data-selected
    Run Keyword If    '${grayDefectStatus}'=='True'    Click Element   ${icon_Findings_grayDefect}  ELSE
    ...  Log  Gray defect is deselected
    sleep    10s
    ${yellowDefectStatus}=    Get Element Attribute    ${icon_Findings_yellowDefect}@data-selected
    Run Keyword If    '${yellowDefectStatus}'=='True'    Click Element   ${icon_Findings_yellowDefect}  ELSE
    ...  Log  Yellow defect is selected
    sleep    10s
     ${redDefectStatus}=    Get Element Attribute    ${icon_Findings_redDefect}@data-selected
    Run Keyword If    '${redDefectStatus}'=='true'    Log  Red defect is selected  ELSE
    ...  Click Element   ${icon_Findings_redDefect}
    
    Sleep    10s
    @{defectsDisplayedList}  Get Webelements    ${icon_Findings_defectsDisplayed}
    : FOR    ${defects}    IN    @{defectsDisplayedList}
    \    Log To Console    ${defects}    
    \    Page Should Contain Element    ${defects}    
    \    Focus    ${defects}
    \    sleep    10ms 
