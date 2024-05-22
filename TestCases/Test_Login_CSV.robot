*** Settings ***
Documentation    Performing the Login Operation
Library    SeleniumLibrary
Library    DataDriver    file=../Resources/Login.csv    encoding=utf_8    dialect=unix
Test Setup    Open the Browser with URL
Test Teardown    Close the Browser
Test Template    Validate Unsuccessful Login

*** Variables ***
${button}    css:.orangehrm-login-button
${invalid}    css:.oxd-alert-content--error
${browser}    Chrome
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${us_name}    xpath=//input[@placeholder='Username']
${pa_word}    name=password
${Username}    123
${Password}    789


*** Test Cases ***
Login to form using    ${Username}    ${Password}

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${Username}    ${Password}
    Fill the Login Form    ${Username}    ${Password} 
    Verify Invalid Login

Open the Browser with URL
    Create Webdriver    Chrome
    #Open Browser    ${url}    
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fill the Login Form
    [Arguments]    ${username}    ${password}
    Input Text    ${us_name}    ${username}
    Input Password    ${pa_word}    ${password}
    Click Button    ${button}

Verify Invalid Login
    Element Text Should Be    ${invalid}    Invalid credentials

Close the Browser
    Close Browser