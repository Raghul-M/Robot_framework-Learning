*** Settings ***
Documentation    to validate login form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup          open the browser with mortage payment url
Test teardown       Close Browser
Resource            resource.robot
Test Template       Validate unsuccessfull login

*** Variables ***
${Error_Msg}   Incorrect username/password.       #It works without = also
${Error_Msg_locator}        css:.alert-danger

*** Test Cases ***      username        password
Invalid username        raghul          learning
Invalid password        rahulshetty     plougfg
special characters      @#$             learning

*** Keywords ***

Validate unsuccessfull login
    [arguments]     ${username}     ${password}
    open the browser with mortage payment url
    Fill the login form     ${username}     ${password}
    wait until it checks and display error message
    verify error message is correct

Fill the login form
    [arguments]         ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Msg_locator}

verify error message is correct
    #${result}=  Get Text     ${Error_Msg_locator}
    #Should Be Equal As Strings      ${result}       ${Error_Msg}
    #Alternate approach
    Element Text Should Be      ${Error_Msg_locator}        ${Error_Msg}

