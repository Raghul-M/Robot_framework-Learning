*** Settings ***
Documentation    to validate login form
Library    SeleniumLibrary

*** Test Cases ***
Validate unsuccessfull login
    open the browser with mortage payment url
    #Fill the login form
    #wait until it checks and display error message
    #verify error message is correct

*** Keywords ***

open the browser with mortage payment url
    Open Browser     https://raghul-m.github.io/    Chrome

