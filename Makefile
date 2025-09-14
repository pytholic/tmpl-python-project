include .env
SHELL := bash

.PHONY: run-main
run-main:
	python main.py

.PHONY: run-tests
run-tests:
	uv run pytest -Wignore -s --cov=model_registry --cov-report=term-missing --tb=line tests/unit tests/integration tests/e2e

.PHONY: run-fast-tests
run-fast-tests:
	uv run pytest -Wignore -m "not slow" -s --cov=model_registry --cov-report=term-missing --tb=line

.PHONY: run-unit-tests
run-unit-tests:
	uv run pytest -Wignore -s tests/unit/test_api.py --cov=model_registry --cov-report=term-missing --tb=line

.PHONY: run-integration-tests
run-integration-tests:
	uv run pytest -Wignore -s tests/integration/test_api.py --cov=model_registry --cov-report=term-missing --tb=line

.PHONY: run-e2e-tests
run-e2e-tests:
	uv run pytest -Wignore -s tests/e2e/test_api.py --cov=model_registry --cov-report=term-missing --tb=line

.PHONY: run-refactor-tests
run-refactor-tests:
	uv run pytest -Wignore -xvs --rootdir=refactor_tests refactor_tests/ --cov=model_registry --cov-report=term-missing --tb=line

.PHONY: build-docs
build-docs:
	uv run mkdocs build

.PHONY: run-docs
run-docs:
	uv run mkdocs serve

.PHONY: clean-cache
clean-cache:
	@echo "Cleaning .DS_Store files..."
	@find . -type f -name ".DS_Store" -delete
	@echo "Cleaning Python cache files..."
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@find . -type d -name "mlruns" -exec rm -rf {} +
	@find . -type d -name ".pytest_cache" -exec rm -rf {} +
	@find . -type f -name "*.pyc" -delete
	@find . -type f -name "*.pyo" -delete
	@find . -type f -name "*.pyd" -delete
	@echo "Cleaning complete!"
