*** Settings ***
Documentation    to validate login form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup          open the browser with mortage payment url
Test teardown       Close Browser
Resource            resource.robot

*** Variables ***



*** Test Cases ***
Validate child window functionality
    Select the link of child window
    Verify the user is Switched to Child Window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the email


*** Keywords ***
Select the link of child window
    click element       css:.blinkingText
    Sleep               5

Verify the user is Switched to Child Window
    Switch Window       NEW
    Element Text Should Be      css:.inner-box      DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text}=    Get text        css:.red
    @{words}=   Split String    ${text}     at
    ${text_split}=      Get from list       ${words}        1  #1 is the index
    Log     ${text_split}
    @{words_2}=   Split String     ${text_split}        #if we give empty it take white space as separator
    ${email}=       Get from list       ${words_2}      0
    Log     ${email}
    Set Global Variable     ${email}

Switch to Parent window and enter the email
    Switch Window       MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text          id:username     ${email}