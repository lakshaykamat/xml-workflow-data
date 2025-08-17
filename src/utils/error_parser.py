"""
Error Parser Module

This module handles parsing of validation error messages from vtool.xml files
and extracting relevant information like line numbers and error categories.
"""

import re
from typing import List, Dict, Any
from lxml import etree


class ErrorParser:
    """
    Parses validation error messages and extracts relevant information.
    
    This class handles:
    1. Parsing vtool.xml files for error messages
    2. Extracting line numbers from position strings
    3. Categorizing errors by type
    4. Filtering out warnings and non-error messages
    """
    
    def parse_vtool_errors(self, vtool_content: str) -> List[Dict[str, Any]]:
        """
        Parse vtool.xml content and extract error messages.
        
        Args:
            vtool_content: Content of the vtool.xml file
            
        Returns:
            List of error dictionaries with error details
        """
        try:
            parser = etree.XMLParser(recover=True)
            tree = etree.fromstring(vtool_content.encode(), parser=parser)
            
            errors = []
            
            # Find all message elements
            for message_elem in tree.findall(".//message"):
                message_type = message_elem.get("type", "")
                
                # Only process error messages, completely ignore warnings
                if message_type != "error":
                    continue
                
                # Extract error information
                error_id = message_elem.get("id", "")
                position = message_elem.get("position", "")
                message_text = message_elem.text or ""
                
                # Determine error category
                error_category = self._get_error_category(position, message_text)
                
                error_info = {
                    "error_id": error_id,
                    "error_position": position,
                    "error_message": message_text,
                    "error_category": error_category
                }
                
                errors.append(error_info)
            
            return errors
            
        except Exception as e:
            print(f"Error parsing vtool.xml: {e}")
            return []
    
    def extract_line_number_from_position(self, position: str) -> int:
        """
        Extract line number from position string (e.g., "925:41" -> 925).
        
        Args:
            position: Position string in format "line:column" or "unknown"
            
        Returns:
            Line number as integer, or None if position is unknown
        """
        if position == "unknown":
            return None
        
        # Try to extract line number from position string
        match = re.match(r"(\d+):", position)
        if match:
            return int(match.group(1))
        
        return None
    
    def _get_error_category(self, position: str, message: str) -> str:
        """
        Categorize error based on position and message content.
        
        Args:
            position: Position string from the error
            message: Error message text
            
        Returns:
            Error category string
        """
        if position == "unknown":
            return "schematron"
        
        if "parser" in message.lower():
            return "parser"
        
        return "line_specific"
