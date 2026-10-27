.DEFAULT_GOAL := help

UV ?= uv
PYTHON ?= $(UV) run python

.PHONY: help
help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: sync
sync:  ## Install project dependencies including the sagemaker-docker group and precomit hooks
	$(UV) sync --all-extras --all-groups
	$(UV) run pre-commit install
	$(UV) run pre-commit autoupdate

.PHONY: first-setup
first-setup:  ## Perform first-time setup by syncing dependencies and installing pre-commit hooks
	@curl -LsSf https://astral.sh/uv/install.sh | sh
	$(MAKE) sync
	@touch .env

.PHONY: lint-format
lint-format:
	$(UV) run ruff check --select I --fix
	$(UV) run ruff check --no-fix
	$(UV) run ruff format
	
.PHONY: reset-env
reset-env: ## Reset the environment by removing the virtual environment and reinstalling dependencies
	rm -rf .venv
	$(UV) cache clean
	$(MAKE) sync