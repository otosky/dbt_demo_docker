# dbt Jaffle Shop - Postgres Container

## Prerequisite Tools:
* git
* a text editor
* docker

### Optional (But Handy) Applications
* VSCode - see vs_code_setup.md
* [pgcli](https://www.pgcli.com/)

## Setup
* clone quickstart repo https://github.com/dbt-labs/jaffle_shop
* create env using script - NOTE THE PARAMS TO USE
* spin up resources using `docker-compose up -d`

Test connection

$ dbt debug

Load sample data

$ dbt seed

if using pgcli to inspect database
PGOPTIONS=--search-path=dev pgcli --host 'localhost' --user dbt -d jaffle_shop -p 5433