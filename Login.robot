*** Settings ***
Library           SeleniumLibrary
Library           DebugLibrary

*** Variables ***
${login_page}     https://sso.ugm.ac.id/cas/login
${username}       IniUsername
${password}       IniPassword

*** Test Cases ***
User Should Not Be Able To Login With Invalid Credential
    [Setup]                       Open Browser        about:blank   Chrome
    Go To                         ${login_page}
    Input Text                    id=username         ${username}
    Input Text                    id=password         ${password}
    Click Button                  //input[@name="submit" and @value="LOGIN"]
    Element Should Be Visible     //div[@id="status" and contains(text(),"The credentials you provided cannot be determined to be authentic.")]
    [Teardown]                    Close Browser
