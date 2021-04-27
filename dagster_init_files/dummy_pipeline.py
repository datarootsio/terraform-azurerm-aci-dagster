from dagster import pipeline, solid

@solid
def dummy(context):
    # Assumes the dataset is in the same directory as this Python file
    context.log.info(f"I'm a dummy pipeline")

@pipeline
def hello_dummy_pipeline():
    dummy()