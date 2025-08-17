"""
Folder Processor Logic

This module contains the main logic for processing individual folders and extracting dataset entries.
"""

from pathlib import Path
from typing import List, Dict, Optional

from utils.xml_parser import (
    find_element_with_id_around_line,
    extract_id_from_element,
    find_element_by_id_in_xml,
    get_parent_tag_by_id
)
from utils.error_parser import parse_vtool_errors, extract_line_number_from_position
from utils.file_utils import find_completed_main_xml, read_file_content
from utils.error_highlighter import highlight_error_in_xml, get_clean_output_xml


def process_folder(folder_path: Path, not_completed_dir: Path, completed_dir: Path, 
                  all_dataset_entries: List[Dict], folder_stats: Dict) -> None:
    """
    Process a single folder to extract dataset entries.
    
    Args:
        folder_path: Path to the folder being processed
        not_completed_dir: Path to not-completed directory
        completed_dir: Path to completed directory
        all_dataset_entries: List to append dataset entries to
        folder_stats: Dictionary to track statistics
    """
    folder_name = folder_path.name
    
    print(f"Processing folder: {folder_name}")
    
    # Check if corresponding completed folder exists
    completed_folder = completed_dir / folder_name
    if not completed_folder.exists():
        print(f"  No completed folder found for {folder_name}, skipping...")
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Find vtool.xml in not-completed folder
    vtool_file = folder_path / "vtool.xml"
    if not vtool_file.exists():
        print(f"  No vtool.xml found in {folder_name}, skipping...")
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Read vtool.xml content
    vtool_content = read_file_content(vtool_file)
    if vtool_content is None:
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Parse errors from vtool.xml
    errors = parse_vtool_errors(vtool_content)
    if not errors:
        print(f"  No errors found in vtool.xml for {folder_name}")
        folder_stats[folder_name]["skipped"] += 1
        return
    
    print(f"  Found {len(errors)} total errors in vtool.xml")
    
    # Store total errors count in folder stats
    folder_stats[folder_name]["total_errors"] = len(errors)
    
    # Categorize errors for better understanding
    error_categories = {}
    for error in errors:
        category = error.get("error_category", "unknown")
        error_categories[category] = error_categories.get(category, 0) + 1
    
    if error_categories:
        print(f"  Error types found:")
        for category, count in error_categories.items():
            if category == "line_specific":
                print(f"    Errors with line numbers: {count}")
            else:
                print(f"    Errors with unknown position: {count}")
    
    # Check if completed folder exists and has the main XML file
    # We don't care about vtool.xml in completed folder - only need the main XML for output
    
    # Find MML file
    mml_file = folder_path / f"{folder_name}-mml.xml"
    if not mml_file.exists():
        print(f"  No MML file found for {folder_name}, skipping...")
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Read MML file content
    mml_content = read_file_content(mml_file)
    if mml_content is None:
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Find main XML file in not-completed folder
    main_xml_file = folder_path / f"{folder_name}.xml"
    if not main_xml_file.exists():
        print(f"  No main XML file found for {folder_name}, skipping...")
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Read main XML file content
    main_xml_content = read_file_content(main_xml_file)
    if main_xml_content is None:
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Find main XML file in completed folder
    completed_main_xml = find_completed_main_xml(completed_folder, folder_name)
    if not completed_main_xml:
        print(f"  No completed main XML file found for {folder_name}, skipping...")
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Read completed main XML file content
    completed_xml_content = read_file_content(completed_main_xml)
    if completed_xml_content is None:
        folder_stats[folder_name]["skipped"] += 1
        return
    
    # Process each error (with duplicate detection)
    skipped_errors_count = 0
    processed_errors = set()  # Track processed errors to avoid duplicates
    
    for error in errors:
        try:
            # Extract line number from position first
            line_number = extract_line_number_from_position(error["error_position"])
            
            # Create unique key for this error to detect duplicates
            error_key = f"{error['error_id']}_{line_number if line_number else 'unknown'}"
            
            # Check if we've already processed this error
            if error_key in processed_errors:
                print(f"    [{folder_name}] Skipping duplicate error: {error['error_id']} at line {line_number if line_number else 'unknown'}")
                continue
            
            if line_number is None:
                print(f"    [{folder_name}] Skipping error with unknown position: {error['error_id']} - {error['error_message'][:50]}...")
                skipped_errors_count += 1
                continue
            
            # First find the element at error line in MML file to get the ID
            # Try to find element with ID around the target line (recursive search)
            mml_element = find_element_with_id_around_line(mml_content, line_number, search_range=15)
            if mml_element is None:
                print(f"    [{folder_name}] Could not find element with ID around line {line_number} in MML file - skipping error {error['error_id']} (search range: ±15 lines)")
                continue
            
            # Extract ID from MML element
            element_id = extract_id_from_element(mml_element)
            if element_id is None:
                print(f"    [{folder_name}] Could not extract ID from MML element around line {line_number} - skipping error {error['error_id']}")
                continue
            
            # Find element with same ID in main XML file (not-completed) and get its parent tag
            input_element = find_element_by_id_in_xml(main_xml_content, element_id)
            if input_element is None:
                print(f"    [{folder_name}] Could not find element with ID {element_id} in main XML file - skipping error {error['error_id']}")
                continue
            
            # Find element with same ID in completed XML file and get its parent tag
            output_element = find_element_by_id_in_xml(completed_xml_content, element_id)
            if output_element is None:
                print(f"    [{folder_name}] Could not find element with ID {element_id} in completed XML file - skipping error {error['error_id']}")
                continue
            
            # Create highlighted input with error message and XML
            highlighted_input = highlight_error_in_xml(
                mml_element,  # This will be replaced with the actual element content
                error["error_id"],
                error["error_message"],
                element_id,
                main_xml_content
            )
            
            # Get clean output XML (parent element)
            clean_output = get_clean_output_xml(element_id, completed_xml_content)
            
            if not clean_output:
                # Fallback to original method
                output_parent = get_parent_tag_by_id(completed_xml_content, element_id, "parent")
                if output_parent is None:
                    output_parent = output_element
                clean_output = output_parent.strip()
            
            # Create dataset entry with new format
            dataset_entry = {
                "input": highlighted_input,
                "output": clean_output,
                "error_id": error["error_id"],
                "error_position": error["error_position"],
                "folder_name": folder_name
            }
            
            all_dataset_entries.append(dataset_entry)
            folder_stats[folder_name]["processed"] += 1
            processed_errors.add(error_key)  # Mark as processed
            print(f"    [{folder_name}] Successfully processed error {error['error_id']} at line {line_number}")
            
        except Exception as e:
            print(f"    [{folder_name}] Error processing error {error['error_id']}: {e}")
            continue
    
    # Store skipped errors count
    if skipped_errors_count > 0:
        folder_stats[folder_name]["skipped_errors"] = skipped_errors_count
