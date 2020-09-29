***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot


***Variables***
${sSavedReportName}                                       xpath=.//tr[@id="gridReportBuilderSavedReport_DXDataRow0"]/td[3]
${txtbx_ReportBuilderSavedReport_Name}                    xpath=//input[@name='gridReportBuilderSavedReport$DXFREditorcol2']
${img_ReportBuilderSavedReport_FirstRemove}               xpath=(//*[@title="Remove"])[1]

***Keywords***
Click on the first remove link
     [Documentation]     @Author: Kalpana || Clicks on the first remove link
     [Return]            ${SavedReportName}
     
     ${SavedReportName}        Get Text    ${sSavedReportName} 
     log         ${SavedReportName}
     Click Element              ${img_ReportBuilderSavedReport_FirstRemove} 
     
Verify the Presence of Warning popup when clicking on delete 
    [Documentation]    @Author: Kalpana ||Verify the Presence of Warning popup when clicking on delete 
    
    Page Should Contain Element    //*[@class='popup view-popup'] 
    Log    Able to see Warning popup 