## Make targets
Here are some utility make targets. 
These will rebuild any changed Docker images first.
Ensure that the docker daemon / docker-machine is running first.

- `make run_py34_test` Run clean test database and python unit tests
- `make run_py34_bash` will give a bash prompt on a new docker container with the same setup as the test container. 
`python3` can then be run for manual use of code.
- `make run_java_bash` gives a command prompt on a container with a Java 8 install.
- `make run_db_test` initialises and runs a PostgreSQL server.
- `make run_db_psql` gives an SQL prompt connecting to the server noted above.

The first time one of these is run will will be a good opportunity for coffee, as it downloads and builds stuff.
