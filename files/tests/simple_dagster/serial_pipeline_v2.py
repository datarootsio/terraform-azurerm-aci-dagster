import csv
import os

from dagster import pipeline, solid, repository


@solid
def hello_cereal(context):
    # Assumes the dataset is in the same directory as this Python file
    dataset_path = os.path.join(os.path.dirname(__file__), "cereal.csv")
    with open(dataset_path, "r") as fd:
        # Read the rows in using the standard csv library
        cereals = [row for row in csv.DictReader(fd)]

    context.log.info(f"Found {len(cereals)} cereals")

@pipeline
def hello_cereal_pipeline():
    hello_cereal()

@repository
def hello_cereal_repository():
    return [hello_cereal_pipeline]
