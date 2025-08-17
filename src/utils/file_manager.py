"""
File Manager Module

This module handles file operations including saving datasets
and managing file paths.
"""

import json
from pathlib import Path
from typing import List, Dict, Any


class FileManager:
    """
    Manages file operations for the dataset generator.
    
    This class handles:
    1. Saving datasets to JSON files
    2. Managing file paths and directories
    3. File validation and error handling
    """
    
    def save_dataset(self, dataset_entries: List[Dict[str, Any]], output_file: str) -> None:
        """
        Save dataset entries to a JSON file.
        
        Args:
            dataset_entries: List of dataset entries to save
            output_file: Name of the output file
        """
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(dataset_entries, f, indent=2, ensure_ascii=False)
            
            print(f"Dataset saved to {output_file}")
            
        except Exception as e:
            print(f"Error saving dataset: {e}")
            raise
    
    def validate_file_structure(self, data_dir: Path) -> bool:
        """
        Validate that the data directory has the required structure.
        
        Args:
            data_dir: Path to the data directory
            
        Returns:
            True if structure is valid, False otherwise
        """
        required_dirs = ["not-completed", "completed"]
        
        for dir_name in required_dirs:
            dir_path = data_dir / dir_name
            if not dir_path.exists() or not dir_path.is_dir():
                print(f"Required directory not found: {dir_path}")
                return False
        
        return True
