*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/Base/common_functionalities.resource

Library     DataDriver      file=../test_data/Orange_data.xlsx     sheet_name=Valid_Login_Test

Task Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser
Test Template       Valid Login Template


*** Test Cases ***

Valid Login Test1

*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${expected_header}
    Input Text    name:username    ${username}
    Input Password    name:password    ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Element Should Contain    xpath=//h6[contains(@class,'oxd-topbar')]     ${expected_header}