*** Settings ***
Documentation       A resource file with reusable keywords andvariables.
...                 For usng in All testcases
Library    SeleniumLibrary
*** Variables ***
${Web_Url}=               https://rahulshettyacademy.com/loginpagePractise/
${username}=              rahulshettyacademy
${invalid_password}=      12345
${valid_password}=        learning

*** Keywords ***
open the browser with mortage payment url
    Open Browser        ${Web_Url}         Chrome