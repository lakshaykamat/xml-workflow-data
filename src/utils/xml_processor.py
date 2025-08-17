"""
XML Processor Module

This module handles XML file operations including reading, parsing,
and finding elements by various criteria.
"""

from pathlib import Path
from typing import Optional, Any
from lxml import etree


class XMLProcessor:
    """
    Handles XML file operations and element finding.
    
    This class handles:
    1. Reading XML file content safely
    2. Finding elements by ID, line number, or position
    3. Extracting element attributes and content
    4. Finding parent and container elements
    """
    
    def read_file_content(self, file_path: Path) -> Optional[str]:
        """
        Read file content safely.
        
        Args:
            file_path: Path to the file to read
            
        Returns:
            File content as string, or None if reading fails
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                return f.read()
        except Exception as e:
            print(f"Error reading file {file_path}: {e}")
            return None
    
    def find_completed_main_xml(self, completed_dir: Path, folder_name: str) -> Optional[Path]:
        """
        Find the completed main XML file for a given folder.
        
        Args:
            completed_dir: Path to the completed directory
            folder_name: Name of the folder
            
        Returns:
            Path to the completed main XML file, or None if not found
        """
        completed_folder = completed_dir / folder_name
        if not completed_folder.exists():
            return None
        
        # Try different naming patterns for completed files
        possible_names = [
            f"{folder_name}-ms.xml",
            f"{folder_name}-ms-mml.xml",
            f"{folder_name}.xml"
        ]
        
        for name in possible_names:
            file_path = completed_folder / name
            if file_path.exists():
                return file_path
        
        return None
    
    def find_element_by_id_in_xml(self, xml_content: str, element_id: str) -> Optional[str]:
        """
        Find an element by ID in XML content.
        
        Args:
            xml_content: XML content as string
            element_id: ID to search for
            
        Returns:
            Element XML as string, or None if not found
        """
        try:
            parser = etree.XMLParser(recover=True)
            tree = etree.fromstring(xml_content.encode(), parser=parser)
            
            for elem in tree.iter():
                if elem.get("id") == element_id:
                    return etree.tostring(elem, pretty_print=True, encoding="unicode")
            
            return None
            
        except Exception as e:
            print(f"Error finding element by ID: {e}")
            return None
    
    def find_element_with_id_around_line(self, xml_content: str, target_line: int, search_range: int = 15) -> Optional[str]:
        """
        Find an element with an ID around a target line number.
        
        Args:
            xml_content: XML content as string
            target_line: Target line number
            search_range: Number of lines to search above and below
            
        Returns:
            Element XML as string, or None if not found
        """
        try:
            parser = etree.XMLParser(recover=True)
            tree = etree.fromstring(xml_content.encode(), parser=parser)
            
            closest_element = None
            min_distance = float('inf')
            
            for elem in tree.iter():
                if elem.sourceline is not None:
                    distance = abs(elem.sourceline - target_line)
                    if distance <= search_range and distance < min_distance:
                        # Check if this element has an ID
                        if elem.get("id"):
                            closest_element = elem
                            min_distance = distance
            
            if closest_element is not None:
                return etree.tostring(closest_element, pretty_print=True, encoding="unicode")
            
            return None
            
        except Exception as e:
            print(f"Error finding element around line: {e}")
            return None
    
    def extract_id_from_element(self, element_xml: str) -> Optional[str]:
        """
        Extract ID attribute from element XML.
        
        Args:
            element_xml: Element XML as string
            
        Returns:
            ID value, or None if not found
        """
        try:
            parser = etree.XMLParser(recover=True)
            elem = etree.fromstring(element_xml.encode(), parser=parser)
            return elem.get("id")
        except Exception as e:
            print(f"Error extracting ID from element: {e}")
            return None
    
    def get_parent_tag_by_id(self, xml_content: str, element_id: str, mode: str = "parent") -> Optional[str]:
        """
        Get parent tag by finding element with ID and getting its parent.
        
        Args:
            xml_content: XML content as string
            element_id: ID of the element
            mode: Parent mode ("parent", "container", "root")
            
        Returns:
            Parent element XML as string, or None if not found
        """
        try:
            parser = etree.XMLParser(recover=True)
            tree = etree.fromstring(xml_content.encode(), parser=parser)
            
            # Find the target element
            target_element = None
            for elem in tree.iter():
                if elem.get("id") == element_id:
                    target_element = elem
                    break
            
            if target_element is None:
                return None
            
            # Get ancestors
            ancestors = list(target_element.iterancestors())
            ancestors.reverse()
            
            if mode == "parent" and len(ancestors) >= 1:
                return etree.tostring(ancestors[-1], pretty_print=True, encoding="unicode")
            elif mode == "container" and len(ancestors) >= 2:
                return etree.tostring(ancestors[-2], pretty_print=True, encoding="unicode")
            elif mode == "root":
                return etree.tostring(tree, pretty_print=True, encoding="unicode")
            
            return None
            
        except Exception as e:
            print(f"Error getting parent tag by ID: {e}")
            return None
