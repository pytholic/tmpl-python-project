"""Main entry point for the application."""

from project_name.config import settings
from project_name.logging import logger


def main() -> None:
    """Main function."""
    logger.info("Starting application...")
    logger.info(f"Application settings: {settings}")
    
    # Add your main application logic here
    logger.info("Hello, World!")


if __name__ == "__main__":
    main()
