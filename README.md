# XML Dataset Generator

A Python tool for generating machine learning datasets from XML validation errors. This tool processes XML documents with validation errors and creates structured datasets with highlighted problematic elements.





## 📊 Data Organization

The script expects your data to be organized in a specific structure. Here's how to organize your files:

### Required Directory Structure

```
data/
├── not-completed/                # Source documents with errors
│   ├── FOLDER_NAME_1/           # Each folder represents a document
│   │   ├── vtool.xml            # Validation error file (REQUIRED)
│   │   ├── FOLDER_NAME_1-mml.xml # MML file for element mapping (REQUIRED)
│   │   └── FOLDER_NAME_1.xml    # Main XML file with errors (REQUIRED)
│   ├── FOLDER_NAME_2/
│   │   ├── vtool.xml
│   │   ├── FOLDER_NAME_2-mml.xml
│   │   └── FOLDER_NAME_2.xml
│   └── ...
└── completed/                    # Corrected documents
    ├── FOLDER_NAME_1/           # Same folder names as not-completed
    │   ├── FOLDER_NAME_1-ms.xml # Corrected XML file (REQUIRED)
    │   └── ...                  # Other naming patterns supported
    ├── FOLDER_NAME_2/
    │   └── FOLDER_NAME_2-ms.xml
    └── ...
```

### File Naming Conventions

#### Not-Completed Files (Source)
- **`vtool.xml`**: Contains validation error messages
- **`{FOLDER_NAME}-mml.xml`**: MML file for element ID mapping
- **`{FOLDER_NAME}.xml`**: Main XML file containing the errors

#### Completed Files (Target)
The script automatically looks for corrected files with these naming patterns:
- **`{FOLDER_NAME}-ms.xml`** (preferred)
- **`{FOLDER_NAME}-ms-mml.xml`**
- **`{FOLDER_NAME}.xml`**

### Example Folder Structure

```
data/
├── not-completed/
│   ├── AJOPHT13510/
│   │   ├── vtool.xml
│   │   ├── AJOPHT13510-mml.xml
│   │   └── AJOPHT13510.xml
│   └── YSROE50950/
│       ├── vtool.xml
│       ├── YSROE50950-mml.xml
│       └── YSROE50950.xml
└── completed/
    ├── AJOPHT13510/
    │   └── AJOPHT13510-ms.xml
    └── YSROE50950/
        └── YSROE50950-ms.xml
```

## 🔧 Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd xml-workflow
   ```

2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Verify installation**:
   ```bash
   python main.py --help
   ```

## 📖 Usage

### Basic Usage

```bash
# Generate dataset using default settings
python main.py

# Use custom data directory
python main.py --data-dir ./my_data

# Use custom output file
python main.py --output-file my_dataset.json

# Combine both options
python main.py --data-dir ./my_data --output-file my_dataset.json
```

### Command Line Options

- **`--data-dir`**: Path to data directory (default: `data`)
- **`--output-file`**: Output JSON file name (default: `xml_dataset.json`)
- **`--help`**: Show help message

## 🎯 How It Works

### 1. **Error Discovery**
- Scans `not-completed` folders for `vtool.xml` files
- Parses error messages and extracts:
  - Error ID (e.g., "EMC501")
  - Error position (e.g., "925:41")
  - Error message text
  - Error category (line-specific, schematron, parser)

### 2. **Element Mapping**
- Uses MML files to find elements at error line positions
- Extracts element IDs from MML elements
- Searches recursively around target lines (±15 lines by default)

### 3. **XML Processing**
- Finds elements with matching IDs in source XML files
- Identifies container (grandparent) and parent elements
- Generates highlighted input with error context

### 4. **Dataset Generation**
- Creates input: Error message + container XML with highlighted parent element
- Creates output: Clean, corrected parent XML
- Stores metadata: error ID, position, folder name

### 5. **Output Format**

Each dataset entry contains:

```json
{
  "input": "Error Message: Element 'ce:legend' may not consist solely of a font-changing element.\n\nXML:\n<ce:table ...>\n<ce:legend ...>\n<ce:simple-para id=\"spara010\">[ERROR_START]<ce:italic>Definitions...</ce:italic>[ERROR_END]</ce:simple-para>\n</ce:legend>\n</ce:table>",
  "output": "<ce:legend ...>\n<ce:simple-para id=\"spara010\">Definitions...</ce:simple-para>\n</ce:legend>",
  "error_id": "FOS502b",
  "error_position": "147:12",
  "folder_name": "YSROE50950"
}
```



## 📊 Output and Reports

### Dataset Summary

The script provides comprehensive processing reports:

```
============================================================
DATASET GENERATION SUMMARY
============================================================
Total unique files processed: 6
Total dataset entries generated: 31
Output file: xml_dataset.json
Dataset format: Error message + highlighted XML input, clean XML output

============================================================
ERRORS PER FILE (Successfully Processed)
============================================================
AMGP2541: 11 processed out of 14 total errors
MOLSTR143586: 8 processed out of 26 total errors
YSROE50950: 4 processed out of 4 total errors
...

============================================================
SKIPPED ERRORS (Unknown Position)
============================================================
Total skipped errors: 59
JINJ112668: 33 schematron errors (unknown position)
...

============================================================
SKIPPED FILES
============================================================
Total skipped files: 4
AJOPHT13514: skipped
...
```

### Error Categories

- **Line-specific**: Errors with known line positions (processable)
- **Schematron**: Validation errors without line positions (skipped)
- **Parser**: XML parsing errors (processable)

## 🚨 Troubleshooting

### Common Issues

1. **"No vtool.xml found"**
   - Ensure each folder contains a `vtool.xml` file
   - Check file permissions and encoding

2. **"No MML file found"**
   - Verify MML files follow naming pattern: `{FOLDER_NAME}-mml.xml`
   - Check file exists and is readable

3. **"No completed main XML file found"**
   - Ensure completed folder has corresponding XML files
   - Check naming patterns: `-ms.xml`, `-ms-mml.xml`, or `.xml`

4. **Import errors**
   - Verify Python path includes `src` directory
   - Check all dependencies are installed

### Debug Mode

For troubleshooting, you can add debug logging to specific components:

```python
# In src/utils/error_highlighter.py
print(f"DEBUG: Processing element {element_id}")
```

## 🔄 Extending the Tool

### Adding New Error Types

The tool automatically categorizes errors into different types. If you encounter new error types that need special handling, you can easily extend the error categorization system.

**Why we have this section:**

1. **Error Categorization**: The tool needs to understand different types of errors to process them correctly
2. **Custom Processing**: Some error types might need different handling logic
3. **Extensibility**: As you work with more XML files, you'll encounter new error patterns
4. **Maintenance**: Easy to add support for new validation rules or error formats

**How to add new error types:**

1. **Modify `ErrorParser`** in `src/utils/error_parser.py`:
   ```python
   def _get_error_category(self, position: str, message: str) -> str:
       if "new_error_type" in message.lower():
           return "new_category"
       elif "another_error" in message.lower():
           return "another_category"
       # ... existing logic
       return "line_specific"
   ```

2. **Update processing logic** in `FolderProcessor` if the new error type needs special handling

**Example use case**: If you encounter a new validation error like "Missing required attribute 'id'" that should be treated differently from line-specific errors, you can add a new category and handle it appropriately.

### Custom Output Formats

1. **Modify `FileManager.save_dataset()`** for different output formats
2. **Add new export methods** (CSV, Parquet, etc.)

### Additional Validation Rules

1. **Extend `XMLProcessor`** with new validation methods
2. **Add custom error detection** logic

## 📝 Requirements

- **Python**: 3.7+
- **Dependencies**: See `requirements.txt`
  - `lxml`: XML parsing and manipulation
  - `pathlib`: Path operations (built-in)


---

**Happy XML Processing! 🚀**
