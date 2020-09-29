*** Variables ***
${ENV}=  QA
# ${ENV}=  REPL
# ${ENV}=  PRD

${BROWSER}=  chrome
&{URL}  DEV=BLANK  QA=https://loanauth-qa.loanhd.com/Login.aspx  REPL=https://loanauth-replica.loanhd.com/Login.aspx
...  PRD=https://lq2.loanhd.com/Login.aspx

&{URL_APP}  DEV=BLANK  QA=https://loanauth-qa.loanhd.com  REPL=https://loanauth-replica.loanhd.com
...  PRD=https://lq2.loanhd.com
    
&{URL_ARCDashboard}  DEV=BLANK  QA=https://arc-qa.loanhd.com/dashboard  REPL=https://arc-replica.loanhd.com/dashboard
...  PRD=https://arc-lq2.loanhd.com/dashboard
    
&{Admin}               DEV=BLANK  QA=admin.s           REPL=admin.mansoor      PRD=admin.mansoor    
&{AdminPwd}            DEV=BLANK  QA=P@ssW0rd          REPL=P@ssW0rd           PRD=password_1 

&{UWM}                 DEV=BLANK  QA=automated.tester  REPL=automated.tester1  PRD=loanlogics.lq@flatworldsolutions.com
&{UWMPwd}              DEV=BLANK  QA=P@ssW0rd          REPL=!P@ssW0rd!         PRD=P@ssW0rd
&{UWMN}                DEV=BLANK  QA=Automated Tester  REPL=Automated Tester   PRD=Underwriter Manager Tester tester

&{UW1}                 DEV=BLANK  QA=AutoUW_1          REPL=AutoUW_1           PRD=UW@flatworld.com
&{UW1Pwd}              DEV=BLANK  QA=P@ssW0rd          REPL=P@ssW0rd           PRD=P@ssW0rd
&{UW1N}                DEV=BLANK  QA=Automation UW 1   REPL=Automation UW 1    PRD=Underwriter Tester

&{UW2}                 DEV=BLANK  QA=AutoUW_2          REPL=AutoUW_2           PRD=BLANK
&{UW2Pwd}              DEV=BLANK  QA=P@ssW0rd          REPL=P@ssW0rd           PRD=BLANK
&{UW2N}                DEV=BLANK  QA=Automation UW 2   REPL=Automation UW 2    PRD=BLANK

&{Client}              DEV=BLANK  QA=automated.client  REPL=automated.client   PRD=CM@flatworld.com
&{ClientPwd}           DEV=BLANK  QA=P@ssW0rd          REPL=P@ssW0rd           PRD=P@ssW0rd

&{TestUWM}             DEV=BLANK  QA=Automation Test Account_UWM    REPL=Automation Test Account_UWM    PRD=BLANK
&{TestUWMPwd}          DEV=BLANK  QA=P@ssW0rd                       REPL=P@ssW0rd                       PRD=BLANK

&{TRID_CE_LOAN}        DEV=BLANK  QA=203170739   REPL=3260096391      PRD=UL000287045
&{NON_TRID_CE_LOAN}    DEV=BLANK  QA=6714080008  REPL=8006969404_20160606133034879  PRD=111TEST33333
&{Fraud_Loan}          DEV=BLANK  QA=1194005143  REPL=1194005143    PRD=1194005143

&{AKLERO_CLIENT}       DEV=BLANK  QA=Aklero Presentation  REPL=LoanLogics Presentation  PRD=LoanLogics Presentation

${Maintenance}         ${URL_APP.${ENV}}/maintenance/
${ApplicationModule}   ${URL_APP.${ENV}}/Service/ApplicationModule
${ChangeProjInLoan}    ${URL_APP.${ENV}}/Maintenance/ChangeProjectInLoan.aspx  
${ServiceLogsUrl}      ${URL_APP.${ENV}}/Maintenance/ServiceLogs
${ARCDashboardUrl}     ${URL_ARCDashboard}

${ADMIN_USER}          ${Admin.${ENV}}  
${ADMIN_PASSWORD}      ${AdminPwd.${ENV}}

${UWM_USER}            ${UWM.${ENV}}
${UWM_PASSWORD}        ${UWMPwd.${ENV}}
${UWM_NAME}            ${UWMN.${ENV}}

#UW1 Username and Name
${UW1_USER1}	       ${UW1.${ENV}}
${UW1_PASSWORD}	       ${UW1Pwd.${ENV}}
${UW1_Name}	           ${UW1N.${ENV}}

#UW2 Username and Name
${UW2_USER2}           ${UW2.${ENV}}
${UW2_PASSWORD}	       ${UW2Pwd.${ENV}}
${UW2_Name}	           ${UW2N.${ENV}}

${Client_user}	       ${Client.${ENV}}
${Client_PASSWORD}	   ${ClientPwd.${ENV}}

${TestUWM_USER}	       ${TestUWM.${ENV}}
${TestUWM_PASSWORD}	   ${TestUWMPwd.${ENV}}

${CLA_ENV}=            CLA_QA
&{CLA_URL}             CLA_QA=https://cla-qa.loanhd.com
${CLA_ADMIN_USER}=     tcbadmin
${CLA_ADMIN_PASSWORD}  P@ssW0rd

${Log_USER}=           logger
${Log_PASSWORD}=       reggol

${TRID_LoanNum}        ${TRID_CE_LOAN.${ENV}}
${Non_TRID_LoanNum}    ${NON_TRID_CE_LOAN.${ENV}}
${Fraud_LoanNum}       ${Fraud_Loan.${ENV}}
${Aklero}              ${AKLERO_CLIENT.${ENV}}

&{ClientQC}            DEV=BLANK  QA=${Aklero}  REPL=Exhibit Mortgage  PRD=Exhibit Mortgage
${QC_Client}           ${ClientQC.${ENV}}        
