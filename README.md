

# XML Dataset Generator

**EXCLUSIVELY FOR BUSINESS USE ONLY**

A proprietary Python tool developed exclusively for internal business operations to generate machine learning training datasets from XML validation errors. This internal business tool processes XML documents with validation errors and creates structured datasets with highlighted problematic elements for AI model training purposes within our organization only.





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

## ⚠️ BUSINESS USE ONLY

**This tool is developed exclusively for internal business operations and is not intended for distribution, sharing, or external use.**

## 🔧 Installation

1. **Install the tool** in your authorized business environment
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

## 🔄 Customizing for Internal Business Needs

### Adding New Error Types

The tool automatically categorizes errors into different types. As our internal business operations encounter new XML validation patterns, you can easily extend the error categorization system.

**Why this matters for internal AI training:**

1. **Better Error Understanding**: More accurate error categorization leads to better training data for our models
2. **Domain-Specific Errors**: Our business has unique validation rules that need special handling
3. **Improved Model Performance**: Better categorized errors help our AI models learn more effectively
4. **Internal Process Integration**: Custom error types can align with our specific business workflows

**How to add new error types:**

1. **Modify `ErrorParser`** in `src/utils/error_parser.py`:
   ```python
   def _get_error_category(self, position: str, message: str) -> str:
       if "business_specific_error" in message.lower():
           return "business_error"
       elif "industry_validation" in message.lower():
           return "industry_error"
       # ... existing logic
       return "line_specific"
   ```

2. **Update processing logic** in `FolderProcessor` if the new error type needs special handling

**Internal business example**: If our industry has specific validation rules like "Missing required business identifier" or "Invalid industry code format", you can add these as new error categories for better AI training.

### Custom Output Formats for AI Training

1. **Modify `FileManager.save_dataset()`** for different training data formats
2. **Add export methods** for specific AI frameworks (TensorFlow, PyTorch, etc.)
3. **Customize dataset structure** for your specific model architecture

### Internal Business-Specific Validation Rules

1. **Extend `XMLProcessor`** with our industry-specific validation methods
2. **Add custom error detection** logic for our business domain
3. **Integrate with our internal validation systems** for comprehensive error coverage

## 📝 Requirements

- **Python**: 3.7+
- **Dependencies**: See `requirements.txt`
  - `lxml`: XML parsing and manipulation
  - `pathlib`: Path operations (built-in)

## 🎯 Internal Business Purpose

This tool is designed exclusively for **internal AI model training** in XML validation and correction tasks within our organization. It generates high-quality training datasets that help our machine learning models learn to:

- **Identify XML validation errors** from error messages
- **Locate problematic elements** within XML documents
- **Understand error context** through highlighted problematic sections
- **Generate corrected XML** based on error patterns
- **Learn from real-world validation scenarios** in our internal business domain


## 🤖 AI Model Training Benefits

### **High-Quality Training Data**
- **Structured Input-Output Pairs**: Clear examples of problematic XML and corrected versions
- **Error Context**: Models learn to understand error messages and their relationship to XML content
- **Highlighted Elements**: Precise marking of problematic sections for better learning

### **Internal Business-Specific Learning**
- **Domain Adaptation**: Models learn from our specific XML validation rules
- **Industry Patterns**: Training on real internal business documents improves domain expertise
- **Error Pattern Recognition**: Models identify common validation issues in our internal workflow

### **Scalable Training Pipeline**
- **Automated Dataset Generation**: Generate thousands of training examples automatically
- **Consistent Format**: Standardized data structure for efficient model training
- **Continuous Learning**: Easy to add new error types and regenerate datasets

---

**Transform our internal XML validation workflow with AI-powered error correction! 🚀**
