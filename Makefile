# QoL commands

# Build Docker images
.PHONY: build
build:
	@docker-compose -f docker-compose.yml build

# Start the application with Docker, rebuild if necessary
.PHONY: start
start:
	@docker-compose up -d --build app

# Run Composer commands within the Composer container
.PHONY: composer
composer:
	@docker-compose run --rm composer $(MAKECMDGOALS)

# Help target to display available commands
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make build      - Build the Docker images
	@echo "  make start      - Start the containers
	@echo "  make composer   - Run commands in composer container
	@echo "  make help       - Display this help message"

# Default target to prevent "No rule to make target" errors
%:
	@true
