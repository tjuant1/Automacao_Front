*** Settings ***

Resource    ../resources/resources.resource

Suite Setup       Setup
Suite Teardown    Close
Library    SSHLibrary

*** Test Cases ***
Complete Flux
    [Documentation]    Create user and login

    Register Admin
    New User Register
    Product Register
    Logout
    Login Serverest
    Buy Product