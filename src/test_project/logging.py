"""Logger configuration for the project."""

import logging
import random
from functools import wraps

from rich.logging import RichHandler


def preserve_random_state(func):
    """Decorator to preserve the random state when executing a function."""

    @wraps(func)
    def wrapper(*args, **kwargs):
        """Wrapper function to preserve the random state."""
        # Save random state
        state = random.getstate()
        try:
            # Execute logging
            return func(*args, **kwargs)
        finally:
            # Restore random state
            random.setstate(state)

    return wrapper


class StatePreservingRichHandler(RichHandler):
    """Custom RichHandler that preserves the random state when logging.

    References
    ----------
    - https://docs.python.org/3/library/logging.html#handler-objects
    - Github issue: https://github.com/lunit-io/lunit-model-registry/issues/89

    """

    @preserve_random_state
    def emit(self, record):
        """Emit a record."""
        return super().emit(record)


# Use our custom handler instead of regular RichHandler
handler = StatePreservingRichHandler(rich_tracebacks=True, tracebacks_show_locals=True)

# Configure the logger
logger = logging.getLogger()
logging.basicConfig(
    level="INFO",
    format="%(message)s",
    datefmt="[%m/%d/%Y %I:%M:%S %p]",
    handlers=[handler],
)
