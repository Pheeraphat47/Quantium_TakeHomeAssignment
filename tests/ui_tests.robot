*** Settings ***
Library    SeleniumLibrary

Suite Setup     Open Browser To Login
Suite Teardown  Close Browser

*** Variables ***
${BASE_URL}    https://qa-exercise.quantiumtech.net
${LOGIN_URL}   ${BASE_URL}/#/login
${HOME_URL}    ${BASE_URL}/#/home
${BROWSER}     Chrome
${USERNAME}    Candidate
${PASSWORD}    Quantium

# Login page locators
${LOGIN_USERNAME_INPUT}    css:input[type='text'], input[type='email']
${LOGIN_PASSWORD_INPUT}    css:input[type='password']
${LOGIN_SUBMIT_BUTTON}     xpath=//button[@type='submit' or normalize-space()='Sign in' or normalize-space()='Sign In' or normalize-space()='Login']

# Text Input assignment locators
${TEXT_INPUT_CARD}     css:button.topic-card[data-testid='topic-card-text-input']
${TEXT_INPUT_HEADER}   css:div[data-testid='test-surface']
${TEXT_INPUT_FIELD}    css:input[data-testid='text-input']
${TEXT_INPUT_BUTTON}   css:button[data-testid='update-button']
${ASSIGNMENTS_LINK}   xpath=//a[normalize-space()='Assignments']

# Client Side Delay locators
${CLIENT_DELAY_CARD}     css:button.topic-card[data-testid='topic-card-client-side-delay']
${CLIENT_DELAY_START}    css:button[data-testid='start']
${CLIENT_DELAY_RESULT}   css:div[data-testid='result']

# AJAX Data locators
${AJAX_DATA_CARD}      css:button.topic-card[data-testid='topic-card-ajax-data']
${AJAX_FETCH_BUTTON}   css:button[data-testid='fetch']
${AJAX_RESULT}         css:div[data-testid='ajax-data']

# Scrollbars locators
${SCROLLBARS_CARD}       css:button.topic-card[data-testid='topic-card-scrollbars']
${SCROLL_CONTAINER}      css:div[data-testid='scroll-container']
${SCROLL_TARGET_BUTTON}  css:button[data-testid='scroll-target']
${SCROLL_RESULT}         css:div[data-testid='result']

*** Keywords ***
Open Browser To Login
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_USERNAME_INPUT}    10s
    Input Text    ${LOGIN_USERNAME_INPUT}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_SUBMIT_BUTTON}
    Wait Until Location Contains    /#/home    10s

Open Text Input Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${TEXT_INPUT_CARD}    10s
    Click Element    ${TEXT_INPUT_CARD}
    Wait Until Element Is Visible    ${TEXT_INPUT_HEADER}    10s

Element Text Should Be
    [Arguments]    ${locator}    ${expected}
    ${actual}=    Get Text    ${locator}
    Should Be Equal As Strings    ${actual}    ${expected}

Go To Assignments
    Click Element    ${ASSIGNMENTS_LINK}
    Wait Until Element Is Visible    ${TEXT_INPUT_CARD}    10s

Open Client Side Delay Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${CLIENT_DELAY_CARD}    60s
    Click Element    ${CLIENT_DELAY_CARD}
    Wait Until Element Is Visible    ${TEXT_INPUT_HEADER}    60s

Open AJAX Data Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${AJAX_DATA_CARD}    60s
    Click Element    ${AJAX_DATA_CARD}
    Wait Until Element Is Visible    ${TEXT_INPUT_HEADER}    60s

Open Scrollbars Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${SCROLLBARS_CARD}    60s
    Click Element    ${SCROLLBARS_CARD}
    Wait Until Element Is Visible    ${TEXT_INPUT_HEADER}    60s

Scroll Target Into View
    ${target}=    Get WebElement    ${SCROLL_TARGET_BUTTON}
    Execute Javascript    arguments[0].scrollIntoView({block: 'center', inline: 'center'});    ARGUMENTS    ${target}

*** Test Cases ***
Text Input Button Reflects Typed Value
    Open Text Input Assignment
    ${value}=    Set Variable    Hello Quantium
    Input Text    ${TEXT_INPUT_FIELD}    ${value}
    Click Button    ${TEXT_INPUT_BUTTON}
    Wait Until Keyword Succeeds    5x    1s    Element Text Should Be    ${TEXT_INPUT_BUTTON}    ${value}
    Go To Assignments

Client Side Delay Shows Completion Message
    Open Client Side Delay Assignment
    Click Button    ${CLIENT_DELAY_START}
    Wait Until Element Is Visible    ${CLIENT_DELAY_RESULT}    10s
    ${result}=    Get Text    ${CLIENT_DELAY_RESULT}
    Should Contain    ${result}    Computation complete
    Go To Assignments

AJAX Data Shows Success And Record Count
    Open AJAX Data Assignment
    Click Button    ${AJAX_FETCH_BUTTON}
    Wait Until Element Is Visible    ${AJAX_RESULT}    20s
    ${result_text}=    Get Text    ${AJAX_RESULT}
    Should Contain    ${result_text}    200 OK
    ${count_attr}=    Get Element Attribute    ${AJAX_RESULT}    data-count
    Should Contain    ${result_text}    Loaded ${count_attr} records
    Go To Assignments

Scrollbars Click Hidden Button
    Open Scrollbars Assignment
    Scroll Target Into View
    Click Button    ${SCROLL_TARGET_BUTTON}
    Wait Until Element Is Visible    ${SCROLL_RESULT}    10s
    ${result_text}=    Get Text    ${SCROLL_RESULT}
    Should Contain    ${result_text}    Target reached
    Go To Assignments
