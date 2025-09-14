"""Main script for testing purposes.

Created by @pytholic on 2024.02.25
"""

import os

from dotenv import find_dotenv, load_dotenv

from model_registry.api import ModelRegistryAPI
from model_registry.config import ModelRegistryAPIConfigModel

load_dotenv(find_dotenv(), override=True)

if __name__ == "__main__":
    config_data = {
        "host": os.getenv("MODEL_REGISTRY_HOST"),
        "user": os.getenv("USERNAME"),
        "password": os.getenv("PASSWORD"),
    }
    config = ModelRegistryAPIConfigModel(**config_data)
    client = ModelRegistryAPI(config)

    # client.create_experiment("test-experiment")
    client.set_experiment("test-experiment")

    model_path = "./tests/fixtures/model/model.onnx"
    run_id, model_name = client.log_model(
        model_path=model_path,
        run_name="test_run",
        run_description="This is a test run.",
        tags={"task": "classification"},
    )
