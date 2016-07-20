# By Dan Chalmers <dan@danchalmers.me.uk>
# January 2016

PWD := $(shell pwd)
DB_TEST_EXISTS := $(shell docker ps -a -q -f "name=db_test")
PY_TEST_EXISTS := $(shell docker ps -a -q -f "name=py_test")


.PHONY: images
images:
	@cd docker && make images


.PHONY: run_py34_bash
run_py34_bash: images
	@docker run --rm -v=$(PWD)/..:/project -it --name py_bash py34_base bash


.PHONY: run_py34_test
run_py34_test: images
	@if [ -n "${PY_TEST_EXISTS}" ]; then \
		echo "Removing old test runner"; \
		docker rm -f py_test; \
	fi
	@docker run --rm -v=$(PWD)/..:/project -t --name py_test py34_test python3 -m unittest discover -s test/


.PHONY: run_java_bash
run_java_bash:
	docker run --rm -v=$(PWD)/..:/project -it --name java_bash java_base bash


.PHONY: run_db_psql
run_db_psql: images
	@docker run --rm -it --link db_test:db db psql -h db -U postgres


.PNONY: run_db_test
run_db_test: images
	@if [ -n "${DB_TEST_EXISTS}" ]; then \
		echo "Removing old test db"; \
		docker rm -f db_test; \
	fi
	@docker run --name db_test -d db
	@sleep 5  # yuk, but it takes time to run db init


clean:
	@cd docker && make clean
