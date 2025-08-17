#!/usr/bin/env python3
"""
XML Dataset Generator

This program processes XML files to generate a dataset containing:
- input: the problematic XML element from not-completed files
- output: the corrected XML element from completed files  
- error_message: the validation error message
- error_position: line and column position of the error
- error_id: the unique error identifier
"""

import os
import json
from pathlib import Path
from typing import List, Dict

from logic.folder_processor import process_folder
from utils.summary_utils import print_summary


def generate_dataset(data_dir: str, output_file: str = "xml_dataset.json"):
    """
    Generate dataset from XML files in the data directory.
    
    Args:
        data_dir: Path to the data directory
        output_file: Name of the output JSON file
    """
    data_path = Path(data_dir)
    not_completed_dir = data_path / "not-completed"
    completed_dir = data_path / "completed"
    
    if not not_completed_dir.exists():
        print(f"Error: not-completed directory not found at {not_completed_dir}")
        return
    
    if not completed_dir.exists():
        print(f"Error: completed directory not found at {completed_dir}")
        return
    
    # Get all folders in not-completed directory
    folders = [f for f in not_completed_dir.iterdir() if f.is_dir()]
    
    if not folders:
        print("No folders found in not-completed directory")
        return
    
    print(f"Found {len(folders)} folders to process")
    
    all_dataset_entries = []
    folder_stats = {}  # Track stats per folder
    
    # Process each folder
    for folder in folders:
        folder_name = folder.name
        folder_stats[folder_name] = {"processed": 0, "skipped": 0, "skipped_errors": 0, "total_errors": 0}
        process_folder(folder, not_completed_dir, completed_dir, all_dataset_entries, folder_stats)
    
    # Save dataset to JSON file
    if all_dataset_entries:
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(all_dataset_entries, f, indent=2, ensure_ascii=False)
            
            print_summary(all_dataset_entries, folder_stats, output_file)
            
        except Exception as e:
            print(f"Error saving dataset to {output_file}: {e}")
    else:
        print("\nNo dataset entries were generated.")


if __name__ == "__main__":
    # Generate dataset from the current data directory
    generate_dataset("data")
