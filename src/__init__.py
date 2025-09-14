"""Model Registry Package.

A comprehensive model registry system with authentication, authorization,
and multi-provider support for managing machine learning models.

Example:
    Basic usage with the facade:

    >>> from model_registry import ModelRegistry, ModelRegistryConfig, ModelStage
    >>>
    >>> config = ModelRegistryConfig(host="http://localhost:5000")
    >>> registry = ModelRegistry(config)
    >>>
    >>> if registry.health_check():
    ...     models = registry.list_models(stage=ModelStage.DEV)
    ...     print(f"Found {len(models)} development models")

Created by @pytholic on 2025.03.17
"""

# Core domain models and types
# Auth components for advanced usage
from model_registry.auth import AuthProviderFactory
from model_registry.core import (
    AuthProviderType,
    ModelRegistryConfig,
    ModelStage,
    ModelVersion,
    ProviderType,
    RegisteredModel,
)

# Main facade interface
from model_registry.facade import ModelRegistry

# Factory classes for advanced usage
from model_registry.infrastructure.factories import RepositoryFactory, ServiceFactory

__all__ = [
    # Advanced components (for custom integrations)
    "AuthProviderFactory",
    # Enums
    "AuthProviderType",
    # Main facade (primary interface)
    "ModelRegistry",
    # Core configuration and models
    "ModelRegistryConfig",
    "ModelStage",
    "ModelVersion",
    "ProviderType",
    "RegisteredModel",
    "RepositoryFactory",
    "ServiceFactory",
]
