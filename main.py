#!/usr/bin/env python3
"""
XML Dataset Generator - Main Entry Point

This script generates datasets from XML validation errors by processing
folders containing vtool.xml files and corresponding XML documents.

Usage:
    python main.py [--data-dir DATA_DIR] [--output-file OUTPUT_FILE]
"""

import argparse
import sys
from pathlib import Path

# Add src to path for imports
sys.path.insert(0, str(Path(__file__).parent / "src"))

from src.core.dataset_generator import DatasetGenerator


def main():
    """Main entry point for the XML dataset generator."""
    parser = argparse.ArgumentParser(
        description="Generate XML datasets from validation errors",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python main.py                           # Use default data directory
    python main.py --data-dir ./my_data      # Use custom data directory
    python main.py --output-file my_dataset.json  # Use custom output file
        """
    )
    
    parser.add_argument(
        "--data-dir",
        default="data",
        help="Path to data directory containing not-completed and completed folders (default: data)"
    )
    
    parser.add_argument(
        "--output-file",
        default="xml_dataset.json",
        help="Output JSON file name (default: xml_dataset.json)"
    )
    
    args = parser.parse_args()
    
    try:
        # Initialize and run the dataset generator
        generator = DatasetGenerator(data_dir=args.data_dir)
        generator.generate_dataset(output_file=args.output_file)
        
        # Print final statistics
        stats = generator.get_dataset_stats()
        print(f"\nFinal Statistics:")
        print(f"  Total entries: {stats['total_entries']}")
        print(f"  Unique folders: {stats['unique_folders']}")
        
    except FileNotFoundError as e:
        print(f"Error: {e}")
        print("Please ensure the data directory structure is correct:")
        print("  data/")
        print("  ├── not-completed/")
        print("  │   ├── folder1/")
        print("  │   │   ├── vtool.xml")
        print("  │   │   ├── folder1-mml.xml")
        print("  │   │   └── folder1.xml")
        print("  │   └── folder2/")
        print("  └── completed/")
        print("      ├── folder1/")
        print("      │   └── folder1-ms.xml")
        print("      └── folder2/")
        sys.exit(1)
        
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
