"""
Main Dataset Generator Class

This class orchestrates the entire XML dataset generation process,
coordinating between different components and managing the workflow.
"""

import os
from pathlib import Path
from typing import List, Dict, Any
from src.core.folder_processor import FolderProcessor
from src.utils.file_manager import FileManager
from src.utils.summary_generator import SummaryGenerator


class DatasetGenerator:
    """
    Main class for generating XML datasets from validation errors.
    
    This class coordinates the entire process:
    1. Discovers folders to process
    2. Processes each folder for errors
    3. Generates dataset entries
    4. Creates summary reports
    """
    
    def __init__(self, data_dir: str = "data"):
        """
        Initialize the dataset generator.
        
        Args:
            data_dir: Path to the data directory containing not-completed and completed folders
        """
        self.data_dir = Path(data_dir)
        self.not_completed_dir = self.data_dir / "not-completed"
        self.completed_dir = self.data_dir / "completed"
        
        # Initialize components
        self.file_manager = FileManager()
        self.folder_processor = FolderProcessor()
        self.summary_generator = SummaryGenerator()
        
        # Dataset storage
        self.all_dataset_entries: List[Dict[str, Any]] = []
        self.folder_stats: Dict[str, Dict[str, int]] = {}
        
    def discover_folders(self) -> List[Path]:
        """
        Discover all folders in the not-completed directory.
        
        Returns:
            List of folder paths to process
        """
        if not self.not_completed_dir.exists():
            raise FileNotFoundError(f"Not-completed directory not found: {self.not_completed_dir}")
        
        folders = [f for f in self.not_completed_dir.iterdir() if f.is_dir()]
        print(f"Found {len(folders)} folders to process")
        return folders
    
    def process_folders(self) -> None:
        """
        Process all discovered folders and generate dataset entries.
        """
        folders = self.discover_folders()
        
        for folder in folders:
            folder_name = folder.name
            print(f"Processing folder: {folder_name}")
            
            # Initialize folder statistics
            self.folder_stats[folder_name] = {
                "processed": 0,
                "skipped": 0,
                "skipped_errors": 0,
                "total_errors": 0
            }
            
            # Process the folder
            self.folder_processor.process_folder(
                folder=folder,
                not_completed_dir=self.not_completed_dir,
                completed_dir=self.completed_dir,
                all_dataset_entries=self.all_dataset_entries,
                folder_stats=self.folder_stats
            )
    
    def generate_dataset(self, output_file: str = "xml_dataset.json") -> None:
        """
        Generate the complete dataset and save it to a file.
        
        Args:
            output_file: Name of the output JSON file
        """
        print("Starting XML dataset generation...")
        
        # Process all folders
        self.process_folders()
        
        # Save dataset to file
        self.file_manager.save_dataset(self.all_dataset_entries, output_file)
        
        # Generate and display summary
        self.summary_generator.print_summary(
            all_dataset_entries=self.all_dataset_entries,
            folder_stats=self.folder_stats,
            output_file=output_file
        )
        
        print(f"\nDataset generation completed! Output saved to: {output_file}")
    
    def get_dataset_stats(self) -> Dict[str, Any]:
        """
        Get statistics about the generated dataset.
        
        Returns:
            Dictionary containing dataset statistics
        """
        return {
            "total_entries": len(self.all_dataset_entries),
            "unique_folders": len(set(entry.get("folder_name", "unknown") for entry in self.all_dataset_entries)),
            "folder_stats": self.folder_stats
        }
