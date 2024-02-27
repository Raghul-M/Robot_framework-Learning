*** Settings ***
Documentation    to validate login form
Library    SeleniumLibrary
Library    Collections
Test Setup          open the browser with mortage payment url
Test teardown       Close Browser
Resource            resource.robot

*** Variables ***
${Error_Msg}   Incorrect username/password.       #It works without = also
${Error_Msg_locator}        css:.alert-danger

*** Test Cases ***
Validate unsuccessfull login

    Fill the login form     ${username}     ${invalid_password}
    wait until it checks and display error message
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login form     ${username}     ${valid_password}
    Wait Until Element Is Visible       css:.nav-link
    Log     Its visible
    Verify Card titles in the Shop page
    Select Card     Blackberry

Select the Form and navigate to child window
    Fill the login details and login form

*** Keywords ***

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

Verify Card titles in the Shop page
    @{expected_list}=   Create List     iphone X        Samsung Note 8      Nokia Edge     Blackberry
    ${elements}=    Get WebElements        css:.card-title
    @{actual_list}=     Create List

    FOR     ${element}      IN      @{elements}
        Log     ${element.text}
        Append To List      ${actual_list}      ${element.text}
    END
    Lists Should Be Equal       ${expected_list}        ${actual_list}

Select Card
    [arguments]     ${card_name}
    ${elements}=    Get WebElements        css:.card-title
    ${index}=       Set Variable    1
    FOR     ${element}      IN      @{elements}
        Exit For Loop If    "${card_name}" == "${element.text}"
        ${index}=   Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login details and login form
    Input Text          id:username     rahulshettyacademy
    Input Password      id:password     learning
    Click Element       css:input[value='user']
    Wait Until Element Is Visible        css:.modal-body
    Click Element       id:okayBtn
    Click Element       id:okayBtn   #we are using 2 times bcoz its a bug with selenium in alert box clicking
    Wait Until Element Is Not Visible       css:.modal-body         timeout=10s
    Select From List By Value       css:select.form-control         teach
    Select Checkbox     id:terms
    Checkbox Should Be Selected     id:terms


