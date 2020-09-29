***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot
Library     OperatingSystem

***Variables***
${mnu_Reverification}                    id= ctl00_MainContent_ReverificationQueue1_gridQueue_DXFREditorcol1_I
${img_Reverification_DownloadPdf}        xpath=//*[@id='ctl00_MainContent_ReverificationQueue1_gridQueue_cell0_8_btnDownload1']
${img_Reverification_CoverLetterPdf}     xpath=//*[text()='Cover Letter']
${mnu_Reverification_Menu}               xpath=//span[text()='Reverification']
${tab_Reverification_Completed}          xpath=//*[@id="tdCompletedSectionMenu"]/a
${txt_Reverification_InpMethod}          id=ctl00_MainContent_ctl00_gridStatus_DXFREditorcol7_I
${img_Reverification_Loader}             xpath=//div[@class='loadingScreenPopupText']
${txt_Reverification_inpResolution}      id=ctl00_MainContent_ctl00_gridStatus_DXFREditorcol16_I
${lnk_Reverification_CallDate}           xpath=//*[@id="ctl00_MainContent_ctl00_gridStatus_tccell0_14"]/a
${icon_Reverification_PdfDownload}       id=ctl00_MainContent_ctl00_ucReverificationContactsPopup_lqxPopup_ctl01_repContacts_ctl01_imgDocument
${txt_Reverification_filePath}           ${DOWNLOAD_DIRECTORY}\\SecondAttempt.pdf

***Keywords***

Click on the Upload icon under UPLOAD column
    [Documentation]  Click on the Upload icon under UPLOAD column
      
    Wait Until Element Is Visible    ${img_Reverification_DownloadPdf}  30s    
    Click Element                    ${img_Reverification_DownloadPdf}  30s
    Sleep    5s   
    Wait Until Element Is Visible    ${img_Reverification_CoverLetterPdf}  30s    
    Click Element                    ${img_Reverification_CoverLetterPdf}  
    # ${lnkDownload}                   Get Text        ${lnkPDFDownload}
    # Run Keyword If                   '${lnkDownload}'=='Download'    Log    ${lnkDownload} option is displayed
    # ...    ELSE                      Fail    ${lnkDownload} option failed to display
    # Sleep    2s
    # Click Element                    ${lnkPDFDownload}
    # Sleep    4s
    
Click on the Reverifications menu
    [Documentation]  Click on the Reverifications menu
    
    Click Element              ${mnu_Reverification_Menu}  30s
    Location Should Contain    Reverification/
    Sleep                      2S
    
Go To Completed Tab
    [Documentation]    Go To Completed Tab
    
    Custom Wait Time For Element To Be Appear    ${tab_Reverification_Completed}
    Click Element                                ${tab_Reverification_Completed}
    Location Should Contain                      ReverificationCompleted.aspx
    
Filter Method & Resolution column 
     [Documentation]    Filter Method & Resolution column 
     
     Input Text                           ${txt_Reverification_InpMethod}    Written
     Press Key                            ${txt_Reverification_InpMethod}    \\13
     Wait Until Element Is Not Visible    ${img_Reverification_Loader}    30s 
     Focus                                ${txt_Reverification_inpResolution}
     Input Text                           ${txt_Reverification_inpResolution}   2nd Attempt Made
     Press Key                            ${txt_Reverification_inpResolution}    \\13
     Wait Until Element Is Not Visible    ${img_Reverification_Loader}    30s
    

Click on Call Date and Download the PDF
     [Documentation]    Click on Call Date and Download the PDF
     Click Element                       ${lnk_Reverification_CallDate}
     # Wait Until Page Contains Element    ${ContactsPopup}
     Wait Until Element Is Not Visible   ${img_Reverification_Loader}    30s      
     Click Element                       ${icon_Reverification_PdfDownload}
     Sleep                               10s
     File Should Exist                   ${txt_Reverification_filePath}
     Log                                 File is downloaded successfully
     Sleep                               5s
     Go To                               ${txt_Reverification_filePath}
     Log                                 Opened the Downloaded PDF File successfully.

