"""
Summary Utilities

This module contains utility functions for generating summaries and reports.
"""

from typing import List, Dict


def print_summary(all_dataset_entries: List[Dict], folder_stats: Dict, output_file: str) -> None:
    """
    Print a summary of the dataset generation results.
    
    Args:
        all_dataset_entries: List of all dataset entries
        folder_stats: Dictionary with stats per folder
        output_file: Name of the output file
    """
    print("\n" + "="*60)
    print("DATASET GENERATION SUMMARY")
    print("="*60)
    
    # Count unique files
    unique_folders = set()
    for entry in all_dataset_entries:
        unique_folders.add(entry.get("folder_name", "unknown"))
    
    print(f"Total unique files processed: {len(unique_folders)}")
    print(f"Total dataset entries generated: {len(all_dataset_entries)}")
    print(f"Output file: {output_file}")
    
    # Show new format info
    print(f"Dataset format: Error message + highlighted XML input, clean XML output")
    
    print("\n" + "="*60)
    print("ERRORS PER FILE (Successfully Processed)")
    print("="*60)
    
    # Count errors per folder and show total vs processed breakdown
    errors_per_folder = {}
    for entry in all_dataset_entries:
        folder_name = entry.get("folder_name", "unknown")
        errors_per_folder[folder_name] = errors_per_folder.get(folder_name, 0) + 1
    
    # Sort by number of errors (descending)
    sorted_folders = sorted(errors_per_folder.items(), key=lambda x: x[1], reverse=True)
    
    for folder_name, processed_count in sorted_folders:
        # Get total errors and skipped errors for this folder
        total_errors = folder_stats.get(folder_name, {}).get("total_errors", 0)
        skipped_errors = folder_stats.get(folder_name, {}).get("skipped_errors", 0)
        
        if total_errors > 0:
            print(f"{folder_name}: {processed_count} processed out of {total_errors} total errors")
        else:
            print(f"{folder_name}: {processed_count} errors")
    
    # Show skipped errors count
    print("\n" + "="*60)
    print("SKIPPED ERRORS (Unknown Position)")
    print("="*60)
    
    # Count skipped errors from folder_stats
    total_skipped_errors = 0
    skipped_errors_per_folder = {}
    
    for folder_name, stats in folder_stats.items():
        if stats.get("skipped_errors", 0) > 0:
            skipped_errors_per_folder[folder_name] = f"{stats['skipped_errors']} schematron errors (unknown position)"
            total_skipped_errors += stats["skipped_errors"]
    
    if total_skipped_errors > 0:
        print(f"Total skipped errors: {total_skipped_errors}")
        print()
        for folder_name, reason in skipped_errors_per_folder.items():
            print(f"{folder_name}: {reason}")
    else:
        print("No errors were skipped")
    
    # Show skipped files
    if folder_stats:
        print("\n" + "="*60)
        print("SKIPPED FILES")
        print("="*60)
        
        skipped_folders = []
        for folder_name, stats in folder_stats.items():
            if stats["processed"] == 0 and stats["skipped"] > 0:
                skipped_folders.append(folder_name)
        
        if skipped_folders:
            print(f"Total skipped files: {len(skipped_folders)}")
            print()
            for folder_name in sorted(skipped_folders):
                print(f"{folder_name}: skipped")
        else:
            print("No files were skipped")
    
    print("="*60)
