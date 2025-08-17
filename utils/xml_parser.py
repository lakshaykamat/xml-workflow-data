"""
XML Parser Utilities

This module contains utility functions for parsing XML files and extracting information.
"""

from typing import Optional, List, Dict
from lxml import etree


def get_parent_tag_by_line(xml_content: str, line_number: int, mode="container"):
    """
    Given XML content and a line number, return an element based on mode:
      - "leaf"      → the element starting on that line (e.g. <item>)
      - "parent"    → the immediate parent (e.g. <deep>)
      - "container" → the next enclosing parent (e.g. <another>)
      - "root"      → the document root
    """
    try:
        parser = etree.XMLParser(recover=True, huge_tree=True)
        tree = etree.fromstring(xml_content.encode(), parser=parser)

        # Find the leaf element starting at the line
        target = None
        for elem in tree.iter():
            if elem.sourceline == line_number:
                target = elem
                break

        if target is None:
            return None

        if mode == "leaf":
            return etree.tostring(target, pretty_print=True, encoding="unicode")

        ancestors = list(target.iterancestors())
        ancestors.reverse()  # now [root, another, deep]

        if mode == "parent" and len(ancestors) >= 1:
            return etree.tostring(ancestors[-1], pretty_print=True, encoding="unicode")

        if mode == "container" and len(ancestors) >= 2:
            return etree.tostring(ancestors[-2], pretty_print=True, encoding="unicode")

        if mode == "root":
            return etree.tostring(tree, pretty_print=True, encoding="unicode")

        # fallback: return leaf
        return etree.tostring(target, pretty_print=True, encoding="unicode")

    except Exception as e:
        return f"Error: {e}"


def find_element_by_id_in_xml(xml_content: str, target_id: str) -> Optional[str]:
    """
    Find an XML element by its ID attribute.
    
    Returns:
        The element as string, or None if not found
    """
    try:
        parser = etree.XMLParser(recover=True)
        tree = etree.fromstring(xml_content.encode(), parser=parser)
        
        # Find element with matching ID
        for elem in tree.iter():
            if elem.get("id") == target_id:
                return etree.tostring(elem, pretty_print=True, encoding="unicode")
                
    except Exception as e:
        print(f"Error finding element by ID: {e}")
        
    return None


def find_element_with_id_around_line(xml_content: str, target_line: int, search_range: int = 10) -> Optional[str]:
    """
    Find an XML element with an ID attribute around a specific line number.
    Searches recursively above and below the target line.
    
    Args:
        xml_content: The XML content to search in
        target_line: The target line number
        search_range: How many lines above and below to search (default: 10)
        
    Returns:
        The element as string with ID, or None if not found
    """
    try:
        parser = etree.XMLParser(recover=True)
        tree = etree.fromstring(xml_content.encode(), parser=parser)
        
        # Collect all elements with their line numbers and IDs
        elements_with_lines = []
        for elem in tree.iter():
            if elem.sourceline is not None:
                elem_id = elem.get("id")
                if elem_id:  # Only collect elements that have IDs
                    elements_with_lines.append({
                        'element': elem,
                        'line': elem.sourceline,
                        'id': elem_id
                    })
        
        if not elements_with_lines:
            return None
        
        # Find the closest element with ID within the search range
        closest_element = None
        min_distance = float('inf')
        
        for elem_info in elements_with_lines:
            distance = abs(elem_info['line'] - target_line)
            if distance <= search_range and distance < min_distance:
                min_distance = distance
                closest_element = elem_info['element']
        
        if closest_element is not None:
            return etree.tostring(closest_element, pretty_print=True, encoding="unicode")
        
        return None
        
    except Exception as e:
        print(f"Error finding element with ID around line: {e}")
        return None


def find_element_by_line_in_xml(xml_content: str, line_number: int) -> Optional[str]:
    """
    Find an XML element at a specific line number.
    
    Returns:
        The element as string, or None if not found
    """
    try:
        parser = etree.XMLParser(recover=True)
        tree = etree.fromstring(xml_content.encode(), parser=parser)
        
        # Find element at the specified line
        for elem in tree.iter():
            if elem.sourceline == line_number:
                return etree.tostring(elem, pretty_print=True, encoding="unicode")
                
    except Exception as e:
        print(f"Error finding element by line: {e}")
        
    return None


def extract_id_from_element(element_xml: str) -> Optional[str]:
    """
    Extract the ID attribute from an XML element.
    
    Returns:
        ID string, or None if not found
    """
    try:
        parser = etree.XMLParser(recover=True)
        element = etree.fromstring(element_xml.encode(), parser=parser)
        return element.get("id")
    except Exception as e:
        print(f"Error extracting ID from element: {e}")
        return None


def get_parent_tag_by_id(xml_content: str, target_id: str, mode="container"):
    """
    Find an element by ID and return its parent based on mode.
    
    Args:
        xml_content: The XML content to search in
        target_id: The ID to search for
        mode: "leaf", "parent", "container", or "root"
        
    Returns:
        The parent element as string, or None if not found
    """
    try:
        parser = etree.XMLParser(recover=True)
        tree = etree.fromstring(xml_content.encode(), parser=parser)
        
        # Find element with matching ID
        target_element = None
        for elem in tree.iter():
            if elem.get("id") == target_id:
                target_element = elem
                break
        
        if target_element is None:
            return None
        
        # Use the existing get_parent_tag_by_line function logic
        if mode == "leaf":
            return etree.tostring(target_element, pretty_print=True, encoding="unicode")
        
        ancestors = list(target_element.iterancestors())
        ancestors.reverse()  # now [root, another, deep]
        
        if mode == "parent" and len(ancestors) >= 1:
            return etree.tostring(ancestors[-1], pretty_print=True, encoding="unicode")
        
        if mode == "container" and len(ancestors) >= 2:
            return etree.tostring(ancestors[-2], pretty_print=True, encoding="unicode")
        
        if mode == "root":
            return etree.tostring(tree, pretty_print=True, encoding="unicode")
        
        # fallback: return leaf
        return etree.tostring(target_element, pretty_print=True, encoding="unicode")
        
    except Exception as e:
        print(f"Error getting parent tag by ID: {e}")
        return None
