# Getting Started

This guide explains how to start developing your project.

## Development Environment

1.  **Create and activate a virtual environment:**

    ```bash
    uv venv
    source .venv/bin/activate
    ```

2.  **Install dependencies:**

    ```bash
    uv pip install -e ".[dev,docs]"
    or
    uv sync --group dev --group docs
    ```

## Running Tests

To run the full test suite:

```bash
pytest
```

## Code Quality

-   **Linting:**

    ```bash
    ruff check .
    ```

-   **Formatting:**

    ```bash
    ruff format .
    ```

## Documentation

To build and serve the documentation locally:

```bash
mkdocs serve
```

Then, open your browser to `http://127.0.0.1:8000`.
