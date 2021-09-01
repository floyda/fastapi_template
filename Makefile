# The binary to build (just the basename).
MODULE := apigateway

# Where to push the docker image.
REGISTRY ?= 

IMAGE := $(REGISTRY)/$(MODULE)

# This version-strategy uses git tags to set the version string
TAG := $(shell git describe --tags --always --dirty)

BLUE='\033[0;34m'
NC='\033[0m' # No Color

build:
	@python setup.py develop --user

run:
	@python -m $(MODULE)

install:
	@python setup.py install --user

test:
	@python -m pytest -v

lint:
	@echo "\n${BLUE}Running Pylint against source and test files...${NC}\n"
	@pylint --rcfile=setup.cfg src/**/*.py
	@echo "\n${BLUE}Running Flake8 against source and test files...${NC}\n"
	@python -m flake8
	@echo "\n${BLUE}Running Bandit against source files...${NC}\n"
	@python -m bandit -r --ini setup.cfg

version:
	@echo $(TAG)

.PHONY: clean install test

clean:
	sudo rm -rf .pytest_cache .coverage .pytest_cache coverage.xml .eggs build dist src/jenapi.egg-info
