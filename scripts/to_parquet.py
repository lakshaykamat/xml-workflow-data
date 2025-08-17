import pandas as pd
import sys
import os

def json_to_parquet(json_file, parquet_file=None):
    # Check if file exists
    if not os.path.exists(json_file):
        print(f"Error: File '{json_file}' does not exist.")
        return

    # Read JSON file
    try:
        df = pd.read_json(json_file, lines=True)  # use lines=True if JSON is line-delimited
    except ValueError:
        df = pd.read_json(json_file)  # fallback for normal JSON

    # Set output parquet filename if not provided
    if parquet_file is None:
        base_name = os.path.splitext(json_file)[0]
        parquet_file = f"{base_name}.parquet"

    # Save as Parquet
    df.to_parquet(parquet_file, engine='pyarrow', index=False)
    print(f"Converted '{json_file}' to '{parquet_file}' successfully.")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python json_to_parquet.py <json_file> [output_parquet_file]")
    else:
        json_file = sys.argv[1]
        parquet_file = sys.argv[2] if len(sys.argv) > 2 else None
        json_to_parquet(json_file, parquet_file)
