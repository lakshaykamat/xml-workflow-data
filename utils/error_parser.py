"""
Error Parser Utilities

This module contains utility functions for parsing error messages from vtool.xml files.
"""

import re
from typing import List, Dict, Optional


def parse_vtool_errors(vtool_content: str) -> List[Dict]:
    """
    Parse vtool.xml to extract error messages with positions and IDs.
    
    Returns:
        List of dictionaries containing error information
    """
    errors = []
    
    # Parse the XML content
    try:
        from lxml import etree
        parser = etree.XMLParser(recover=True)
        tree = etree.fromstring(vtool_content.encode(), parser=parser)
        
        # Find all message elements
        for message in tree.findall(".//message"):
            msg_id = message.get("id", "")
            msg_type = message.get("type", "")
            position = message.get("position", "")
            text = message.text.strip() if message.text else ""
            
            # Only process error messages, completely ignore warnings and other types
            if msg_type == "error":
                # Categorize the error based on position
                if position == "unknown":
                    category = "schematron"
                elif ":" in position:
                    category = "line_specific"
                else:
                    category = "unknown"
                
                error_info = {
                    "error_id": msg_id,
                    "error_message": text,
                    "error_position": position,
                    "error_category": category
                }
                errors.append(error_info)
            # Skip all non-error messages (warnings, info, etc.) completely
                
    except Exception as e:
        print(f"Error parsing vtool.xml: {e}")
    
    return errors


def extract_line_number_from_position(position: str) -> Optional[int]:
    """
    Extract line number from position string like "925:41".
    
    Returns:
        Line number as integer, or None if invalid
    """
    if not position or position == "unknown":
        return None
    
    try:
        # Extract line number from "line:column" format
        line_part = position.split(":")[0]
        return int(line_part)
    except (ValueError, IndexError):
        return None


def get_error_category_description(category: str) -> str:
    """
    Get a simple description of the error category.
    
    Returns:
        Simple description string for the error category
    """
    descriptions = {
        "line_specific": "Error with line number",
        "structural": "Error with unknown position",
        "schematron": "Error with unknown position", 
        "no_position": "Error with unknown position",
        "unknown": "Unknown error type"
    }
    return descriptions.get(category, "Unknown error type")
