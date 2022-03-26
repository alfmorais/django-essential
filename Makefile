
  
.PHONY: all test clean

bash:
	@python ./src/manage.py shell

check-pep257:
	@prospector --with-tool pep257

create-migrate:
	@python ./src/manage.py makemigrations

create-requirements:
	@pip-compile ./requirements/base.in
	@pip-compile ./requirements/test.in

freeze:
	@pip freeze

format:
	@blue .
	@isort .

install-requirements:
	@pip install -r ./requirements/base.txt
	@pip install -r ./requirements/test.txt

lint:
	@blue . --check
	@isort . --check

pre-commit:
	@pre-commit run --all-files

run:
	@python ./src/manage.py runserver

run-migrate:
	@python ./src/manage.py migrate

test:
	@export DJANGO_SETTINGS_MODULE=test.settings
	@pytest -s

update-requirements:
	@rm ./requirements/base.txt
	@rm ./requirements/test.txt
	@pip-compile ./requirements/base.in
	@pip-compile ./requirements/test.in