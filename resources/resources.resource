*** Settings ***

Library    SeleniumLibrary
Library    FakerLibrary
Library    BuiltIn
Library    String
Library    SSHLibrary


## Yaml files
Variables    ../_fixtures/access/serverest_url.yaml
Variables    ../_fixtures/elements/serverest/first_register.yaml
Variables    ../_fixtures/elements/serverest/home.yaml
Variables    ../_fixtures/elements/serverest/login.yaml
Variables    ../_fixtures/elements/serverest/user_register.yaml
Variables    ../_fixtures/elements/serverest/product_register.yaml
Variables    ../_fixtures/elements/serverest/buy.yaml

## Keywords
Resource    ../tests/keywords/keywords.resource