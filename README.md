# dbt Jaffle Shop - Postgres Container

A containerized version of the dbt Jaffle Shop quickstart demo.

## Prerequisite Tools:
* git
* a text editor
* docker

### Optional (But Handy) Applications
* VSCode - see vs_code_setup.md
* [pgcli](https://www.pgcli.com/)

## Setup
1. Clone the dbt [jaffle_shop repo](https://github.com/dbt-labs/jaffle_shop) to the root of this repo.
    ```bash
    git clone https://github.com/dbt-labs/jaffle_shop
    ```
   * Feel free to delete the files under `jaffle_shop/models` if you want to follow along 
     with the [dbt Getting Started](https://docs.getdbt.com/tutorial/setting-up) guide.
2. Create a `.env` file using the `./docker/create_env.sh` helper script.
    ```bash
    ./docker/create_env.sh
    
    # you will be asked to complete the prompts below
    Please provide the following:
    Database Host: jaffle_postgres
    Database User: dbt
    Database Password: dbt
    Database Dev Schema: dev
    ```
3. Start the docker resources by running `docker-compose up -d` at the root of this repo.

### Test connection

Within the `dbt_runtime` container you can run the `dbt debug` to test the connection to the Postgres container:

```bash
docker exec -it jaffle_shop_dbt_runtime_1 bash
cd "$CONTAINER_HOME"/jaffle_shop
dbt debug
```

The output should end with the following, if the connection is valid.
See `docs/vs_code_setup.md` for a full readout of `dbt debug`.
```bash
Connection test: OK connection ok
```

#### Inspecting the database with pgcli:
```bash
PGOPTIONS=--search-path=dev pgcli --host 'localhost' --user dbt -d jaffle_shop -p 5433
```

## Usage

You can either build the models from the pre-existing files in the jaffle_shop repo or follow along
with the [Getting Started](https://docs.getdbt.com/tutorial/setting-up) tutorial which walks you step-by-step through dbt's features & workflow.

## Notes

dbt documentation dev server is exposed on port 5434 at <http://localhost:5434/>