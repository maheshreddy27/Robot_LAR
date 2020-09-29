*** Variables ***
${TestURL}    OrangeHR
#${TestURL}    ToolsQA

&{Env_Url}    OrangeHR=https://opensource-demo.orangehrmlive.com/    ToolsQA=https://demoqa.com/

&{Oadmin}    OrangeHR=Admin       ToolsQA=sss
&{OadminPwd}    OrangeHR=admin123    ToolsQA=999
${OADMIN_USERNAME}       ${Oadmin.${TestURL}}
${OADMIN_PASSWORD}       ${OadminPwd.${TestURL}}


