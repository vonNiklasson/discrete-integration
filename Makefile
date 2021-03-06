
SOURCE_FOLDER = discrete_deployment

.PHONY: clean
clean:
	rm -f .gitinfo
	rm -rf build dist *.egg-info
	find $(SOURCE_FOLDER) -name __pycache__ | xargs rm -rf
	find $(SOURCE_FOLDER) -name '*.pyc' -delete
	rm -rf reports .coverage
	rm -rf docs/build docs/source
	rm -rf .*cache

.PHONY: check
check: check-imports check-code

.PHONY: check-imports
check-imports:
	isort --check-only $(SOURCE_FOLDER)

.PHONY: check-code
check-code:
	black --check $(SOURCE_FOLDER)

.PHONY: reformat
reformat:
	isort --atomic $(SOURCE_FOLDER)
	black $(SOURCE_FOLDER)

.PHONY: update
update:
	pip install --upgrade -r requirements-dev.txt

.PHONY: build
build:
	python setup.py --quiet sdist bdist_wheel