BLUE='\033[0;34m'
NC='\033[0m' # No Color

test:
	@python -m pytest -v

lint:
	@echo "\n${BLUE}Running Pylint against source and test files...${NC}\n"
	@pylint --rcfile=setup.cfg src/**/*.py
	@echo "\n${BLUE}Running Flake8 against source and test files...${NC}\n"
	@python -m flake8
	@echo "\n${BLUE}Running Bandit against source files...${NC}\n"
	@python -m bandit -r --ini setup.cfg
