# Modern Python Project Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern, comprehensive, and opinionated project template for Python.

## Features

-   **Package Management**: Uses [`uv`](https://github.com/astral-sh/uv) for fast dependency management.
-   **Code Quality**: Integrated with [`Ruff`](https://github.com/astral-sh/ruff) for linting and formatting.
-   **Testing**: `pytest` setup for unit and integration tests.
-   **Type Hinting**: Enforced with `mypy` and `pyright` for robust code.
-   **Documentation**: [`mkdocs`](https://www.mkdocs.org/) with Material theme ready to go.
-   **Simple Setup**: Easy Makefile commands for environment setup and project management.

## Getting Started

1.  **Clone this template with your desired project name.**

    ```bash
    git clone https://your-git-repo/tmpl-python-project.git my-awesome-project
    cd my-awesome-project
    ```

2.  **Set up your environment.**

    ```bash
    make setup
    ```

    This will:
    - Create a virtual environment using `uv`
    - Install all dependencies (dev and docs)
    - Activate the virtual environment

3.  **Customize your project.**

    - Update `pyproject.toml` with your project name, version, and build paths
    - Rename/organize files in the `src/` directory as needed
    - Create subfolders like `core/` or rename modules to fit your project structure

## Project Structure

```
.
├── docs/                 # Documentation files
├── src/                  # Source code (organize as needed)
│   ├── config.py         # Configuration settings
│   ├── exceptions.py     # Custom exceptions
│   ├── logging.py        # Logging configuration
│   └── utils.py          # Utility functions
├── tests/                # Tests (unit and integration)
├── Makefile              # Development commands
├── pyproject.toml        # Project configuration and dependencies
└── README.md
```

The `src/` directory is kept simple and flat. You can:
- Create subfolders like `src/core/`, `src/api/`, etc. as your project grows
- Rename modules to fit your domain (e.g., `models.py`, `services.py`)
- Update imports in `main.py` and `pyproject.toml` accordingly

## Usage

After setup, you can use the following commands:

-   **Setup environment**: `make setup` (creates venv and installs dependencies)
-   **Install dependencies**: `make install` or `uv pip install -e ".[dev,docs]"`
-   **Run the application**: `make run`
-   **Run tests**: `make test`
-   **Run tests with coverage**: `make test-cov`
-   **Lint code**: `make lint`
-   **Format code**: `make format`
-   **Type checking**: `make type-check`
-   **Build documentation**: `make docs-build`
-   **Serve documentation locally**: `make docs-serve`
-   **Clean cache files**: `make clean`
-   **Show all commands**: `make help`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
