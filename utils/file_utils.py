"""
File Utilities

This module contains utility functions for file operations and path handling.
"""

from pathlib import Path
from typing import Optional


def find_completed_main_xml(completed_folder: Path, folder_name: str) -> Optional[Path]:
    """
    Find the main XML file in the completed folder.
    Tries multiple naming patterns.
    
    Args:
        completed_folder: Path to the completed folder
        folder_name: Name of the folder
        
    Returns:
        Path to the main XML file, or None if not found
    """
    # Try different naming patterns
    possible_names = [
        f"{folder_name}-ms.xml",
        f"{folder_name}.xml", 
        f"{folder_name}-ms-mml.xml"
    ]
    
    for name in possible_names:
        file_path = completed_folder / name
        if file_path.exists():
            return file_path
    
    return None


def read_file_content(file_path: Path) -> Optional[str]:
    """
    Read file content with error handling.
    
    Args:
        file_path: Path to the file to read
        
    Returns:
        File content as string, or None if error
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return f.read()
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return None
