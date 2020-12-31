# PYTHON TARGETS

.PHONY: freeze_python_reqs
freeze_python_reqs:
	pip freeze > requirements.txt

.PHONY: install_python_reqs
install_python_reqs:
	pip install -r requirements.txt

.PHONY: format_python
format_python:
	python -m black .

.PHONY: typecheck_python
typecheck_python:
	mypy utilities_for_me/ 

.PHONY: test_python
test_python:
	coverage run -m pytest utilities_for_me && coverage html

.PHONY: check_python
check_python: typecheck_python format_python test_python

# UNIVERSAL TARGETS

.PHONY: check
check: check_python

.PHONY: build_image
build_image: check
	docker build -t utilities-for-me:latest .

.PHONY: run_dev_image
run_dev_image: build_image
	docker run -d -p 5000:5000 utilities-for-me:latest

.PHONY: run_prod_image
run_prod_image: build_image
	docker run -e "APP_ENV=production" -e "APP_PORT=80" -d -p 80:80 utilities-for-me:latest
