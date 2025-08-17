# XML Dataset Generator

A Python program to generate datasets from XML files by processing validation errors and extracting corrected elements.

## Overview

This program processes XML files to generate a dataset containing:
- **input**: the problematic XML element from not-completed files
- **output**: the corrected XML element from completed files  
- **error_message**: the validation error message
- **error_position**: line and column position of the error
- **error_id**: the unique error identifier

## Project Structure

```
xml-workflow/
├── xml_dataset_generator.py    # Main entry point
├── logic/
│   └── folder_processor.py     # Core folder processing logic
├── utils/
│   ├── xml_parser.py          # XML parsing utilities
│   ├── error_parser.py        # Error parsing utilities
│   ├── file_utils.py          # File operation utilities
│   └── summary_utils.py       # Summary and reporting utilities
├── data/
│   ├── not-completed/         # Source XML files with errors
│   └── completed/             # Corrected XML files
└── xml_dataset.json           # Generated dataset output
```

## Features

### ✅ Successfully Processed Files
- **MOLSTR143586**: 8 errors (bibliography reference issues)
- **YSROE50950**: 4 errors (legend formatting issues)
- **YMDR1409**: 4 errors (mixed types)
- **TCM7254**: 4 errors (mixed types)
- **AJOPHT13510**: 1 error (empty alt-text)

### ❌ Skipped Files
- **AJOPHT13514**: No vtool.xml found
- **AMGP2541**: Completed folder still has errors
- **JINJ112654**: No MML file found
- **JMIG5608**: No vtool.xml found
- **JMIG5613**: No errors found in vtool.xml

## Requirements

```bash
pip install lxml>=4.9.0
```

## Usage

```bash
python3 xml_dataset_generator.py
```

## How It Works

1. **Error Detection**: Reads `vtool.xml` files to find validation errors
2. **Position Mapping**: Maps error positions to XML elements using MML files
3. **Element Extraction**: Finds corresponding elements in not-completed and completed XML files
4. **Parent Context**: Extracts parent elements for better context
5. **Dataset Generation**: Creates JSON entries with input/output pairs

## Error Types

### Processable Errors (with line numbers)
- `EMC501`: Empty content errors
- `FOS502b`: Legend formatting issues
- `IDS503a`: Bibliography reference issues
- `DTS504`: Document structure issues

### Skipped Errors (unknown position)
- Schematron validation rules
- Structural/content validation errors
- Reference citation range issues
- Punctuation and formatting rules

## Output Format

```json
[
  {
    "input": "<ce:table>...</ce:table>",
    "output": "<ce:table>...</ce:table>",
    "error_message": "Element 'ce:alt-text' may not have empty content.",
    "error_position": "925:41",
    "error_id": "EMC501",
    "folder_name": "AJOPHT13510"
  }
]
```

## Summary Output

The program provides a comprehensive summary showing:
- Total unique files processed
- Total dataset entries generated
- Errors per file (successfully processed)
- Skipped files with reasons

## Maintainable Code Structure

The code is organized into logical modules:

- **`logic/`**: Core business logic for processing folders
- **`utils/`**: Reusable utility functions
  - **`xml_parser.py`**: XML parsing and element finding
  - **`error_parser.py`**: Error message parsing and categorization
  - **`file_utils.py`**: File operations and path handling
  - **`summary_utils.py`**: Summary generation and reporting

This modular structure makes the code:
- Easy to maintain and extend
- Testable and reusable
- Clear separation of concerns
- Well-documented and organized
