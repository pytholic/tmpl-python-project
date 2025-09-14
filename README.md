# Modern Python Project Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern, comprehensive, and opinionated project template for Python.

## Features

-   **Package Management**: Uses [`uv`](https://github.com/astral-sh/uv) for fast dependency management.
-   **Code Quality**: Integrated with [`Ruff`](https://github.com/astral-sh/ruff) for linting and formatting.
-   **Testing**: `pytest` setup for unit and integration tests.
-   **Type Hinting**: Enforced with `mypy` and `pyright` for robust code.
-   **Documentation**: [`mkdocs`](https://www.mkdocs.org/) with Material theme ready to go.
-   **Automation**: A simple `setup.sh` script to quickly start a new project.

## Getting Started

1.  **Clone this template with your desired project name.**

    ```bash
    git clone https://your-git-repo/tmpl-python-project.git my-awesome-project
    cd my-awesome-project
    ```

2.  **Run the setup script.**

    The script will automatically detect your project name from the directory name and set everything up:

    ```bash
    ./setup.sh
    ```

    The script will:
    - Detect the project name from your directory name
    - Convert it to a valid Python package name
    - Rename all template files accordingly
    - Initialize a new git repository
    - Set up a virtual environment and install dependencies

## Project Structure

```
.
├── docs/                 # Documentation files
├── src/                  # Source code
│   └── project_name/     # Template package (renamed during setup)
├── tests/                # Tests (unit and integration)
├── setup.sh              # Setup script
├── pyproject.toml        # Project configuration and dependencies
└── README.md
```

After running `setup.sh`, your project structure will be:

```
.
├── docs/                 # Documentation files
├── src/                  # Source code
│   └── your_package/     # Your project's package
├── tests/                # Tests (unit and integration)
├── pyproject.toml        # Project configuration and dependencies
└── README.md
```

## Usage

After setup, you can use the following commands:

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
