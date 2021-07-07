# dbt Local Dev

1. Run the `./create_env.sh` script
    * it will provide prompts to populate a `.env` file with your database credentials
      necessary for the docker-compose file.

2. Run `docker-compose up -d` to stand up a dbt container.

3. *I would highly recommend using [VSCode](https://code.visualstudio.com/) to do your editing
   and run files.*  The community-maintained plugins make the dbt development experience way more
   streamlined.

    * After downloading VSCode, you can attach to the running dbt container:
      <https://code.visualstudio.com/docs/remote/attach-container>

    * Install the following extensions:
        * `ms-python.python`
        * `innoverio.vscode-dbt-power-user`
        * `bastienboutonnet.vscode-dbt`
        * `samuelcolvin.jinjahtml`
        * `ckolkman.vscode-postgres`
        * OPTIONAL - Personal Pref - I find the `akamud.vscode-theme-onedark` Theme easiest to read

4. Test your dbt connection to the database:

   ```bash
   # open the integrated terminal in VSCode
   # OR exec into the running dbt container
   # docker exec -it jaffle_shop_dbt_runtime_1

   # cd to a dbt project
   # your WORKING_DIRECTORY is mounted at `/home/dbt/jaffle_shop` in the container
   cd ~/jaffle_shop

   # Run the dbt debug command
   dbt debug
   ```

The output should look something like:

 ```bash
Running with dbt=0.19.1
dbt version: 0.19.1
python version: 3.8.8
python path: /usr/local/bin/python
os info: Linux-4.19.121-linuxkit-x86_64-with-glibc2.2.5
Using profiles.yml file at /home/dbt/.dbt/profiles.yml
Using dbt_project.yml file at /home/dbt/jaffle_shop/dbt_project.yml

Configuration:
  profiles.yml file [OK found and valid]
  dbt_project.yml file [OK found and valid]

Required dependencies:
 - git [OK found]

Connection:
  host: jaffle_postgres
  port: 5432
  user: dbt
  database: jaffle_shop
  schema: dev
  search_path: None
  keepalives_idle: 0
  sslmode: None
  Connection test: OK connection ok
 ```