#!/bin/bash

# Script that takes user input to generate .env file for dbt docker-compose.

ENV_FILENAME='.env'

# create a long string of delimited pairs of prompts & env vars
read -r -d '' prompts_and_vars <<EOF
Database Host;DBT_HOST
Database User;DBT_USER
Database Password;DBT_PASSWORD
Database Dev Schema;DBT_DEV_SCHEMA
EOF

is_prompt_password_related() {
    if [[ $(echo "$1" | awk '{print tolower($0)}') == *"password"* ]]; then
        true
    else
        false
    fi
}

prompt_for_env_var() {
    local prompt="$1"
    local env_var="$2"

    if is_prompt_password_related "$prompt"; then
        read -r -sp "$prompt: " value
    else
        read -r -p "$prompt: " value
    fi
    echo "$value"
}

_skip_line_after_password() {
    if is_prompt_password_related "$prompt"; then
        echo
    fi
}

add_env_var_to_file() {
    local env_var="$1"
    local value="$2"
    local filename="$3"

    echo "$env_var"="$value" >>"$filename"
}

add_defaults_to_env_file() {
    local filename="$1"
    cat <<EOF >"$filename"
MY_HOME="$HOME"
CONTAINER_HOME='/home/dbt'
COMPOSE_PROJECT_NAME='jaffle_shop'
EOF
}

main() {

    add_defaults_to_env_file "$ENV_FILENAME"

    echo 'Please provide the following:'
    while IFS=';' read -r -u 3 prompt var; do
        value=$(prompt_for_env_var "$prompt" "$var")
        _skip_line_after_password
        add_env_var_to_file "$var" "$value" "$ENV_FILENAME"
    done 3<<<"$prompts_and_vars"
}

main
