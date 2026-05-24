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

# Dynamic Table locators
${DYNAMIC_TABLE_CARD}     css:button.topic-card[data-testid='topic-card-dynamic-table']
${DYNAMIC_TABLE_LABEL}    css:div[data-testid='chrome-cpu-label'] strong
${DYNAMIC_TABLE}          css:table[data-testid='data-table']

# Progress Bar locators
${PROGRESS_BAR_CARD}     css:button.topic-card[data-testid='topic-card-progress-bar']
${PROGRESS_BAR}          css:div[data-testid='progress-bar']
${PROGRESS_FILL}         css:div[data-testid='progress-fill']
${PROGRESS_START}        css:button[data-testid='start']
${PROGRESS_STOP}         css:button[data-testid='stop']
${PROGRESS_RESULT}       css:div[data-testid='result']
${TEST_RESET}            css:button[data-testid='test-reset']

# Visibility locators
${VISIBILITY_CARD}        css:button.topic-card[data-testid='topic-card-visibility']
${VISIBILITY_TARGET}      css:span[data-testid='target']
${VISIBILITY_RESET}       css:button[data-testid='visibility-reset']
${HIDE_DISPLAY}           css:button[data-testid='hide-display']
${HIDE_VISIBILITY}        css:button[data-testid='hide-visibility']
${HIDE_OPACITY}           css:button[data-testid='hide-opacity']
${HIDE_OFFSCREEN}         css:button[data-testid='hide-offscreen']
${HIDE_ZERO_SIZE}         css:button[data-testid='hide-zero-size']
${HIDE_COVERED}           css:button[data-testid='hide-covered']

# Overlapped Element locators
${OVERLAPPED_ELEMENT_CARD}   css:button.topic-card[data-testid='topic-card-overlapped-element']
${OVERLAPPED_EMAIL_INPUT}    css:input[data-testid='overlapped-input']
${OVERLAPPED_CONTAINER}      css:div[data-testid='overlapped-container']

# Shadow DOM locators
${SHADOW_DOM_CARD}    css:button.topic-card[data-testid='topic-card-shadow-dom']
${SHADOW_HOST}        css:shadow-input[data-testid='shadow-host']
${SHADOW_OUTER_ECHO}  css:div[data-testid='outer-echo']

# File Upload locators
${FILE_UPLOAD_CARD}      css:button.topic-card[data-testid='topic-card-file-upload']
${FILE_INPUT}            css:input[data-testid='file-input']
${UPLOADED_FILES_LIST}   css:div[data-testid='uploaded-files']

# Mystery Button locators
${MYSTERY_BUTTON_CARD}   css:button.topic-card[data-testid='topic-card-mystery-button']
${MYSTERY_IFRAME}        css:iframe
${MYSTERY_BUTTON}        css:button[data-testid='frame-button']
${OUTER_COUNTER}         css:div[data-testid='outer-counter']


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

Open Dynamic Table Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${DYNAMIC_TABLE_CARD}    60s
    Click Element    ${DYNAMIC_TABLE_CARD}
    Wait Until Element Is Visible    ${TEXT_INPUT_HEADER}    60s

Open Progress Bar Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${PROGRESS_BAR_CARD}    60s
    Click Element    ${PROGRESS_BAR_CARD}
    Wait Until Element Is Visible    ${TEXT_INPUT_HEADER}    60s

Open Visibility Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${VISIBILITY_CARD}    60s
    Click Element    ${VISIBILITY_CARD}
    Wait Until Element Is Visible    ${TEXT_INPUT_HEADER}    60s

Open Overlapped Element Assignment
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${OVERLAPPED_ELEMENT_CARD}    60s
    Click Element    ${OVERLAPPED_ELEMENT_CARD}
    Wait Until Element Is Visible    ${OVERLAPPED_CONTAINER}    60s

Scroll Target Into View
    ${target}=    Get WebElement    ${SCROLL_TARGET_BUTTON}
    Execute Javascript    arguments[0].scrollIntoView({block: 'center', inline: 'center'});    ARGUMENTS    ${target}

Get Chrome Cpu From Table
    ${value}=    Execute Javascript
    ...    const table=document.querySelector('table[data-testid="data-table"]');
    ...    const headers=[...table.querySelectorAll('thead th')];
    ...    const idx=headers.findIndex(h=>h.dataset.testid==='header-cpu');
    ...    const row=table.querySelector('tbody tr[data-testid="row-chrome"]');
    ...    const cells=[...row.querySelectorAll('td')];
    ...    return cells[idx].innerText.trim();
    RETURN    ${value}

Stop Progress At Target
    [Arguments]    ${target}
    Click Button    ${PROGRESS_START}
    Execute Javascript
    ...    const bar = document.querySelector('[data-testid="progress-bar"]');
    ...    const btn = document.querySelector('[data-testid="stop"]');
    ...    const observer = new MutationObserver(() => {
    ...        const val = parseInt(bar.getAttribute('aria-valuenow'), 10);
    ...        if (val >= ${target}) {
    ...            btn.click();
    ...            observer.disconnect();
    ...        }
    ...    });
    ...    observer.observe(bar, { attributes: true, attributeFilter: ['aria-valuenow'] });

Target Should Be Not Visible To User
    ${is_visible}=    Execute Javascript
    ...    const el = document.querySelector('[data-testid="target"]');
    ...    if (!el) return false;
    ...    const style = window.getComputedStyle(el);
    ...    if (style.display === 'none' || style.visibility === 'hidden' || parseFloat(style.opacity) === 0) return false;
    ...    const rect = el.getBoundingClientRect();
    ...    if (rect.width === 0 || rect.height === 0) return false;
    ...    const inViewport = rect.bottom > 0 && rect.right > 0 && rect.top < window.innerHeight && rect.left < window.innerWidth;
    ...    if (!inViewport) return false;
    ...    const cx = Math.floor(rect.left + rect.width / 2);
    ...    const cy = Math.floor(rect.top + rect.height / 2);
    ...    const topEl = document.elementFromPoint(cx, cy);
    ...    if (!topEl) return false;
    ...    return el === topEl || el.contains(topEl);
    Should Be Equal As Strings    ${is_visible}    False

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

Dynamic Table Chrome CPU Matches Label
    Open Dynamic Table Assignment
    ${label_value}=    Get Text    ${DYNAMIC_TABLE_LABEL}
    ${table_value}=    Get Chrome Cpu From Table
    Should Be Equal As Strings    ${table_value}    ${label_value}
    Go To Assignments

Progress Bar Stops At 75 Percent
    Open Progress Bar Assignment
    Stop Progress At Target    75
    Wait Until Element Is Visible    ${PROGRESS_RESULT}    15s
    ${result_text}=    Get Text    ${PROGRESS_RESULT}
    Should Contain    ${result_text}    Stopped at exactly 75%
    Go To Assignments

Visibility Target Is Not Visible For Each Hide Method
    Open Visibility Assignment
    Wait Until Element Is Visible    ${VISIBILITY_TARGET}    10s
    Click Button    ${HIDE_DISPLAY}
    Wait Until Keyword Succeeds    5x    500ms    Target Should Be Not Visible To User
    Click Button    ${VISIBILITY_RESET}
    Wait Until Element Is Visible    ${VISIBILITY_TARGET}    5s

    Click Button    ${HIDE_VISIBILITY}
    Wait Until Keyword Succeeds    5x    500ms    Target Should Be Not Visible To User
    Click Button    ${VISIBILITY_RESET}
    Wait Until Element Is Visible    ${VISIBILITY_TARGET}    5s

    Click Button    ${HIDE_OPACITY}
    Wait Until Keyword Succeeds    5x    500ms    Target Should Be Not Visible To User
    Click Button    ${VISIBILITY_RESET}
    Wait Until Element Is Visible    ${VISIBILITY_TARGET}    5s

    Click Button    ${HIDE_OFFSCREEN}
    Wait Until Keyword Succeeds    5x    500ms    Target Should Be Not Visible To User
    Click Button    ${VISIBILITY_RESET}
    Wait Until Element Is Visible    ${VISIBILITY_TARGET}    5s

    Click Button    ${HIDE_ZERO_SIZE}
    Wait Until Keyword Succeeds    5x    500ms    Target Should Be Not Visible To User
    Click Button    ${VISIBILITY_RESET}
    Wait Until Element Is Visible    ${VISIBILITY_TARGET}    5s

    Click Button    ${HIDE_COVERED}
    Wait Until Keyword Succeeds    5x    500ms    Target Should Be Not Visible To User
    Click Button    ${VISIBILITY_RESET}
    Wait Until Element Is Visible    ${VISIBILITY_TARGET}    5s
    Go To Assignments

Overlapped Element Email Field Accepts Input After Click Focus
    Open Overlapped Element Assignment
    ${test_value}=    Set Variable    test@quantium.com
    # Click the email field first to give it focus before typing
    # (direct send-keys without focusing may land on wrong element due to sticky header)
    Click Element    ${OVERLAPPED_EMAIL_INPUT}
    Input Text    ${OVERLAPPED_EMAIL_INPUT}    ${test_value}
    ${typed_value}=    Get Element Attribute    ${OVERLAPPED_EMAIL_INPUT}    value
    Should Be Equal As Strings    ${typed_value}    ${test_value}
    Go To Assignments

Shadow DOM Input Submits Value To Outer Page
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${SHADOW_DOM_CARD}    60s
    Click Element    ${SHADOW_DOM_CARD}
    Wait Until Element Is Visible    ${SHADOW_HOST}    60s
    ${test_value}=    Set Variable    QuantiumTest
    # Standard locators cannot pierce shadow boundaries — use JavaScript to access shadowRoot
    Execute Javascript
    ...    const host = document.querySelector('shadow-input[data-testid="shadow-host"]');
    ...    const input = host.shadowRoot.querySelector('input[data-testid="shadow-input"]');
    ...    const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
    ...    nativeInputValueSetter.call(input, '${test_value}');
    ...    input.dispatchEvent(new Event('input', {bubbles: true}));
    ...    input.dispatchEvent(new Event('change', {bubbles: true}));
    Execute Javascript
    ...    const host = document.querySelector('shadow-input[data-testid="shadow-host"]');
    ...    const btn = host.shadowRoot.querySelector('button[data-testid="shadow-submit"]');
    ...    btn.click();
    Wait Until Element Is Visible    ${SHADOW_OUTER_ECHO}    10s
    ${echo_text}=    Get Text    ${SHADOW_OUTER_ECHO}
    Should Contain    ${echo_text}    ${test_value}
    Go To Assignments

File Upload Shows Uploaded File Name In List
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${FILE_UPLOAD_CARD}    60s
    Click Element    ${FILE_UPLOAD_CARD}
    # Wait for the visible drop zone (it's a <label>, not a <div>)
    Wait Until Element Is Visible    css:[data-testid='file-drop']    60s
    # Choose File works on hidden <input type="file"> directly
    ${file_path}=    Set Variable    ${CURDIR}/test_files/test_upload.txt
    Choose File    ${FILE_INPUT}    ${file_path}
    # Wait for uploaded list to appear and contain the filename
    Wait Until Element Is Visible    ${UPLOADED_FILES_LIST}    10s
    ${list_text}=    Get Text    ${UPLOADED_FILES_LIST}
    Should Contain    ${list_text}    test_upload.txt
    Go To Assignments

Mystery Button Click Increases Outer Counter
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${MYSTERY_BUTTON_CARD}    60s
    Click Element    ${MYSTERY_BUTTON_CARD}
    # The button is inside a sandboxed iframe — must switch frame context to reach it
    Wait Until Page Contains Element    ${MYSTERY_IFRAME}    60s
    # Read initial counter value before clicking
    ${init_str}=    Get Element Attribute    ${OUTER_COUNTER}    data-count
    ${init_count}=    Convert To Integer    ${init_str}
    # Switch into the iframe to interact with the button
    Select Frame    ${MYSTERY_IFRAME}
    Wait Until Element Is Visible    ${MYSTERY_BUTTON}    10s
    Click Button    ${MYSTERY_BUTTON}
    Unselect Frame
    # Counter must increase by exactly 1
    ${expected}=    Evaluate    ${init_count} + 1
    ${expected_str}=    Convert To String    ${expected}
    Wait Until Keyword Succeeds    10x    1s    Element Attribute Value Should Be    ${OUTER_COUNTER}    data-count    ${expected_str}
    Go To Assignments
