*** Settings ***
Resource    ../../BaseSetup.robot
Resource    AllTestPages.robot

*** Variables ***
${txt_Assignleave_leaveForm}        xpath=//label[contains(text(),'Employee Name')]
${id_Assignleave_EmpName}           id=assignleave_txtEmployee_empName
${drp_Assignleave_leaveType}        id=assignleave_txtLeaveType
${id_AssignLeave_FromDate}          id=assignleave_txtFromDate
${id_AssignLeave_ToDate}            id=assignleave_txtToDate
${id_AssignLeave_PartialDays}       id=assignleave_partialDays
${txt_AssignLeave_Duration}         xpath=//label[contains(text(),'Duration')]
${id_Assignleave_Comment}           id=assignleave_txtComment
${btn_AssignLeave_Leave}            id=assignBtn
${img_AssignLeave_ToDate}           xpath=//*[@class='ui-state-default ui-state-active']
${btn_AssignLeave_OkBtn}            id=confirmOkButton
${btn_AssignLeave_OverlappingLeaveRequestFound}    xpath=//*[contains(text(),'Overlapping Leave Request Found')]
${btn_AssignLeave_Leave1}            xpath=//b[contains(text(),'Leave')]

*** Keywords ***
Enter the data in the assign leave form
    [Documentation]    Enter the data in the assign leave form
    
    Wait Until Element Is Visible    ${txt_Assignleave_leaveForm}
    Input Text    ${id_Assignleave_EmpName}    Linda Anderson
    Click Element    ${drp_Assignleave_leaveType}
    Select From List By Index    ${drp_Assignleave_leaveType}  2
    Click Element    ${id_AssignLeave_FromDate}
    ${From_Date_Time}=    Get Current Date  
    ${From_Date}=    Convert Date    ${From_Date_Time}    result_format=%Y-%m-%d
    Log    ${From_Date} 
    Input Text    ${id_AssignLeave_FromDate}    ${From_Date}
    ${To_Date_Time}=    Add Time To Date    ${From_Date}    2 days
    ${To_Date}=    Convert Date    ${To_Date_Time}    result_format=%Y-%m-%d 
    Input Text    ${id_AssignLeave_ToDate}    ${To_Date}
    Input Text    ${id_Assignleave_Comment}    Applied leave on ${To_Date}
    # Click Element    ${img_AssignLeave_ToDate}    
    Sleep    5s    
    Scroll Element Into View    ${btn_AssignLeave_Leave}  
    Wait Until Element Is Visible    ${id_AssignLeave_PartialDays}
    # Click Element    ${id_AssignLeave_PartialDays}
    Select From List By Value    ${id_AssignLeave_PartialDays}    all     
    Wait Until Page Contains    Duration
    Input Text    ${id_Assignleave_Comment}    Applied leave on ${To_Date}
    Click Button    ${btn_AssignLeave_Leave} 
    Click Button    ${btn_AssignLeave_OkBtn}
    sleep    10s
    # Wait Until Page Contains Element    ${btn_AssignLeave_OverlappingLeaveRequestFound}  
    # ${text}=    Get Text    ${btn_AssignLeave_OverlappingLeaveRequestFound}
    ${text}=    Get Title 
    log    ${text}   
    Run Keyword If    '${text}' == 'OrangeHRM'    Click Element    ${btn_AssignLeave_Leave1}
    ...    ELSE  Log    Applied leave successfully       
              
      
             
      
        
        
    
          
    
    