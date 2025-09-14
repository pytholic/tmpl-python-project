"""Configuration for pytest."""
import pytest


@pytest.fixture
def example_fixture() -> str:
    """An example fixture that returns a string."""
    return "hello"
