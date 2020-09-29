***Settings***
Resource    AllPages.robot
Resource    ../../BaseSetup.robot

***Variables***
${imgLoader_TestManagementPage_TestManagement}                  xpath=//div[@class='loadingScreenPopupText']
${ddl_TestManagementPage_clientSelection}                       id= tmg-drd-client
${ddl_TestManagementPage_productSelection}                      id= tmg-drd-product
${btn_TestManagementPage_DownLoadLibrary}                       xpath= //a[contains(text(),'Download Library')]
${sClient}                                                      {EMPTY}
${sProductType}                                                 {EMPTY}


***Keywords***

Select required "Client" and "Product type" from the drop down
    [Arguments]    ${sClient}  ${sProductType} 
    
    Set Global Variable                  ${sClient}
    Set Global Variable                  ${sProductType}     
    Wait Until Element Is Not Visible    ${imgLoader_TestManagementPage_TestManagement}    30s 
    Select From List By Label            ${ddl_TestManagementPage_clientSelection}   ${sClient} 
    Wait Until Element Is Enabled        ${ddl_TestManagementPage_productSelection}
    Sleep    2s  
    Select From List By Label            ${ddl_TestManagementPage_productSelection}    ${sProductType} 
    Wait Until Element Is Not Visible    ${imgLoader_TestManagementPage_TestManagement}    30s 

Click on Download Library button and display the column names
   [Documentation]    Click on Download Library button and display the column names
   

   Wait Until Element Is Visible    ${btn_TestManagementPage_DownLoadLibrary}
   Click Element    ${btn_TestManagementPage_DownLoadLibrary}
   Sleep    30s
   ${productType}=    Remove String    ${sProductType}    (    )
   @{productArray}=    Split String    ${productType}
   ${product}=    Catenate    @{productArray}[2] @{productArray}[0] @{productArray}[1]
   Log To Console    ${productType}
   Log To Console    ${product}
   ${fileName}=    Catenate    Test Package - ${product} - ${sClient}.xlsx
   Log    ${fileName}
   ${pathTestPackage}=    Catenate    ${DOWNLOAD_DIRECTORY}\\${fileName}
   Log To Console    ${pathTestPackage}
   File Should Exist    ${pathTestPackage}
   #verify the presence of a particular column
   @{excelData}=    Read ExcelRow File    ${pathTestPackage}    0    1    
   : FOR    ${data}    IN    @{excelData}
   \    Log    ${data}