"""
Error Highlighter Module

This module handles highlighting errors in XML content by adding
[ERROR_START] and [ERROR_END] markers around problematic elements.
"""

from typing import Optional
from lxml import etree


class ErrorHighlighter:
    """
    Highlights errors in XML content by adding markers around problematic elements.
    
    This class handles:
    1. Finding target elements by ID in XML content
    2. Getting container and parent elements for context
    3. Adding error highlighting markers
    4. Generating clean output XML
    """
    
    def highlight_error_in_xml(
        self, 
        xml_content: str, 
        error_id: str, 
        error_message: str, 
        element_id: str, 
        main_xml_content: str
    ) -> str:
        """
        Highlight the error in XML content by adding [ERROR_START] and [ERROR_END] markers.
        
        Args:
            xml_content: The XML content to highlight
            error_id: Type of error for context-specific highlighting
            error_message: The error message to include in input
            element_id: ID of the problematic element
            main_xml_content: Content of the main XML file to find the element
            
        Returns:
            Formatted input string with error message and highlighted XML
        """
        try:
            # Find the element with the given ID in the main XML
            parser = etree.XMLParser(recover=True)
            tree = etree.fromstring(main_xml_content.encode(), parser=parser)
            
            # Find element by ID
            target_element = None
            for elem in tree.iter():
                if elem.get("id") == element_id:
                    target_element = elem
                    break
            
            if target_element is None:
                # Fallback: return original content with error message
                return f"Error Message: {error_message}\n\nXML:\n{xml_content}"
            
            # Get the container element for input XML (grandparent level)
            container_element = self._get_container_element_for_input(target_element, tree)
            
            # Get the parent element for highlighting (immediate parent)
            parent_element = self._get_parent_element_for_highlighting(target_element, tree)
            
            if container_element is None:
                container_element = parent_element  # fallback to parent if no container
            
            if parent_element is None:
                parent_element = target_element  # fallback to target if no parent
            
            # Convert container element to string for input XML
            container_xml = etree.tostring(container_element, pretty_print=True, encoding="unicode")
            
            # Highlight the problematic element within the container
            highlighted_xml = self._highlight_element_within_container(container_xml, target_element, error_id)
            
            # Format the final input string
            formatted_input = f"Error Message: {error_message}\n\nXML:\n{highlighted_xml}"
            
            return formatted_input
            
        except Exception as e:
            print(f"Error highlighting XML: {e}")
            # Fallback: return original content with error message
            return f"Error Message: {error_message}\n\nXML:\n{xml_content}"
    
    def get_clean_output_xml(self, element_id: str, completed_xml_content: str) -> str:
        """
        Get the clean output XML for the given element ID.
        
        Args:
            element_id: ID of the element
            completed_xml_content: Content of the completed XML file
            
        Returns:
            Clean output XML string
        """
        try:
            parser = etree.XMLParser(recover=True)
            tree = etree.fromstring(completed_xml_content.encode(), parser=parser)
            
            # Find element by ID
            target_element = None
            for elem in tree.iter():
                if elem.get("id") == element_id:
                    target_element = elem
                    break
            
            if target_element is None:
                return ""
            
            # Get the parent element for output
            parent_element = self._get_parent_element_for_highlighting(target_element, tree)
            
            if parent_element is None:
                parent_element = target_element
            
            # Return clean parent XML
            return etree.tostring(parent_element, pretty_print=True, encoding="unicode")
            
        except Exception as e:
            print(f"Error getting clean output XML: {e}")
            return ""
    
    def _get_parent_element_for_highlighting(self, target_element: etree._Element, tree: etree._Element) -> Optional[etree._Element]:
        """
        Get the parent element for highlighting, similar to get_parent_tag_by_line in parent mode.
        
        Args:
            target_element: The element that has the error
            tree: The XML tree
            
        Returns:
            The parent element, or None if not found
        """
        try:
            # Get all ancestors of the target element
            ancestors = list(target_element.iterancestors())
            ancestors.reverse()  # Now [root, ..., container, parent, target]
            
            # Return the immediate parent (similar to "parent" mode)
            if len(ancestors) >= 1:
                return ancestors[-1]
            
            return None
            
        except Exception as e:
            print(f"Error getting parent element: {e}")
            return None
    
    def _get_container_element_for_input(self, target_element: etree._Element, tree: etree._Element) -> Optional[etree._Element]:
        """
        Get the container element for input XML, similar to get_parent_tag_by_line in container mode.
        
        Args:
            target_element: The element that has the error
            tree: The XML tree
            
        Returns:
            The container element (grandparent), or None if not found
        """
        try:
            # Get all ancestors of the target element
            ancestors = list(target_element.iterancestors())
            ancestors.reverse()  # Now [root, ..., container, parent, target]
            
            # Return the container element (similar to "container" mode)
            if len(ancestors) >= 2:
                return ancestors[-2]  # Container is 2 levels up
            
            return None
            
        except Exception as e:
            print(f"Error getting container element: {e}")
            return None
    
    def _highlight_element_within_container(self, container_xml: str, target_element: etree._Element, error_id: str) -> str:
        """
        Highlight the problematic element within the container XML.
        
        Args:
            container_xml: The container element XML as string (grandparent level)
            target_element: The element that has the error
            error_id: Type of error for context-specific highlighting
            
        Returns:
            Container XML with the target element highlighted
        """
        try:
            target_element_id = target_element.get("id", "")
            target_element_xml = etree.tostring(target_element, pretty_print=True, encoding="unicode")
            
            # Add error highlighting markers
            highlighted_element = f"[ERROR_START]{target_element_xml}[ERROR_END]"
            
            # Try to find and replace the target element in the container XML
            # First, try exact match
            if target_element_xml in container_xml:
                highlighted_container = container_xml.replace(target_element_xml, highlighted_element)
                return highlighted_container
            
            # If exact match fails, try to find by ID attribute
            # Parse the container XML and find the element by ID
            parser = etree.XMLParser(recover=True)
            container_tree = etree.fromstring(container_xml.encode(), parser=parser)
            
            # Find the element with the same ID in the container
            for elem in container_tree.iter():
                if elem.get("id") == target_element_id:
                    # Get the original element XML from container
                    original_element_xml = etree.tostring(elem, pretty_print=True, encoding="unicode")
                    
                    # Try to replace it with highlighted version
                    if original_element_xml in container_xml:
                        highlighted_container = container_xml.replace(original_element_xml, highlighted_element)
                        return highlighted_container
            
            # If all else fails, append the highlighted element to the end
            # This is the most reliable approach since exact string matching is difficult
            return f"{container_xml}\n<!-- Highlighted problematic element: -->\n{highlighted_element}"
            
        except Exception as e:
            print(f"Error highlighting element within parent: {e}")
            return container_xml
