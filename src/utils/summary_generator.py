"""
Summary Generator Module

This module generates comprehensive summary reports of the dataset generation process,
including statistics on processed files, errors, and skipped items.
"""

from typing import List, Dict, Any


class SummaryGenerator:
    """
    Generates summary reports for the dataset generation process.
    
    This class handles:
    1. Calculating processing statistics
    2. Generating formatted summary reports
    3. Displaying error and file counts
    """
    
    def print_summary(
        self, 
        all_dataset_entries: List[Dict[str, Any]], 
        folder_stats: Dict[str, Dict[str, int]], 
        output_file: str
    ) -> None:
        """
        Print a comprehensive summary of the dataset generation process.
        
        Args:
            all_dataset_entries: List of all generated dataset entries
            folder_stats: Statistics for each processed folder
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
        
        print("\n" + "="*60)
        print("SKIPPED ERRORS (Unknown Position)")
        print("="*60)
        
        # Count total skipped errors
        total_skipped_errors = sum(
            folder_stats.get(folder_name, {}).get("skipped_errors", 0)
            for folder_name in folder_stats
        )
        
        print(f"Total skipped errors: {total_skipped_errors}")
        
        # Show breakdown by folder
        for folder_name, stats in folder_stats.items():
            skipped_errors = stats.get("skipped_errors", 0)
            if skipped_errors > 0:
                total_errors = stats.get("total_errors", 0)
                if total_errors > 0:
                    print(f"{folder_name}: {skipped_errors} schematron errors (unknown position)")
        
        print("\n" + "="*60)
        print("SKIPPED FILES")
        print("="*60)
        
        # Count total skipped files
        total_skipped_files = sum(
            folder_stats.get(folder_name, {}).get("skipped", 0)
            for folder_name in folder_stats
        )
        
        print(f"Total skipped files: {total_skipped_files}")
        
        # Show breakdown by folder
        for folder_name, stats in folder_stats.items():
            skipped = stats.get("skipped", 0)
            if skipped > 0:
                print(f"{folder_name}: skipped")
