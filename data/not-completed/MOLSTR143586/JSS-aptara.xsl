<?xml version="1.0" encoding="utf-8"?>




<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:jss="http://www.elsevier.com/xml/schema/journalStylesheets"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>Journal Style Sheet</title>
                
                <style type="text/css">
                    .heading{
                        font-weight:bold;
                        color:#B8860B;
                        font-size:200%
                    }
                    .head2{
                        color:MediumVioletRed;
                        background-color:#D0D0D0;
                    }
                    .base_head2{
                        color:MediumVioletRed;
                    }
                    
                    .head3{
                        font-variant:small-caps;
                        color:#8B4513;
                        text-align:left;
                    }
                    .head4{
                        font-style:italic;
                        color:#C00000;
                        text-align:left;
                    }
                    .head5{
                        font-variant:small-caps;
                        font-weight:bold;
                        color:blue;
                        text-align:centre;
                    }
                    .lhs-head{
                        color:brown;
                        font-variant:small-caps;
                        font-weight:bold;
                    }
                    .lhs-thead{
                        color:#008B8B;
                        font-variant:small-caps;
                    }
                    .lhs{
                        color:#2F4F4F;
                    }
                    .rhs{
                        color:#A52A2A;
                    }
                    .rhs_nodata{
                        color:#FA5858;
                    }
                    .lhsb{
                        color:brown;
                        font-weight:bold;
                    }
                    .rhsb{
                        color:green;
                        font-weight:bold;
                    }
                    .tbl1{
                        color:#808080;
                    }
                    .rhs-wd{
                        color:red;
                        font-weight:bold;
                    }
                    .rhs-nd{
                        color:red;
                        font-style:italic;
                    }
                    body{
                        background-color:#FAFAD2;
                        font-family:'Cambria';
                        margin-left:10%;
                        margin-right:10%;
                    }</style>
            </head>
            <body onkeyup="keyDown=0" onkeydown="keyDown=1">
                <h2 align="center">
                    <table width="1000pt">
                        <tr>
                            <td align="left" width="3%" style="color:orange"> ELSEVIER </td>
                            <td align="center">
                                <font style="font-size:14pt; color:#B8860B; font-weight:bold">
                                    <xsl:text>Journal Style Sheet for the Journal</xsl:text>
                                    <br/>
                                </font>
                                <font class="heading">
                                    <xsl:value-of
                                        select="jss:journalStylesheet/jss:baseData/jss:ptsData/jss:journalTitle"
                                    />
                                </font>
                            </td>
                        </tr>
                    </table>
                </h2>
                <div class="content" id="main">
                    <xsl:call-template name="main"/>
                </div>
                <div class="content" id="cu">
                    <xsl:call-template name="cu"/>
                </div>
                <div class="content" id="s0">
                    <xsl:call-template name="s0"/>
                </div>
                <div class="content" id="s100">
                    <xsl:call-template name="s100"/>
                </div>
                <div class="content" id="s200">
                    <xsl:call-template name="s200"/>
                </div>
                <div class="content" id="p100">
                    <xsl:call-template name="p100"/>
                </div>
                <div class="content" id="s300">
                    <xsl:call-template name="s300"/>
                </div>
                <div class="content" id="print">
                    <xsl:call-template name="print"/>
                </div>
                
                <div class="content" id="editors">
                    <xsl:call-template name="editors"/>
                </div>
                <table width="1000" border="1" style="margin-top:20pt;">
                    <tr>
                        <td colspan="2" align="center" style="font-weight:bold;">Version 2025.1 | ©
                            2009-2025 Elsevier | Contact: Rives-Roberts Becky <span
                                style="font-size:14; font-weight:normal"
                                >(r.rivesroberts@elsevier.com)</span></td>
                    </tr>
                </table>

            </body>
        </html>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:baseData" name="main">



        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">BASE DATA</th>
            </tr>
            <tr>
                <th class="head3" colspan="2">PTS Data and JM Edit Data</th>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Journal code</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:apply-templates select="//jss:ptsData/jss:journalCode"/>
                    </font>
                </td>
            </tr>
    
            
            <tr>
                <td>
                    <font class="lhsb">
                        <xsl:text>Non-PTS data last modified on</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:dateModified=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhsb">
                                <xsl:apply-templates select="//jss:JM-EditData/jss:dateModified"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>

                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhsb">
                        <xsl:text>Modified by</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:modifiedBy=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhsb">
                                <xsl:apply-templates select="//jss:JM-EditData/jss:modifiedBy"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal number</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:apply-templates select="//jss:ptsData/jss:journalNumber"/>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal title</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:value-of select="//jss:ptsData/jss:journalTitle"
                            disable-output-escaping="yes"/>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>PMG</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:pmg!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:pmg"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:pmg=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>PMC</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:pmc!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:pmc"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:pmc=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>ISSN</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:issn!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:issn"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:issn=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>epGroup</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:epGroup!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:epGroup"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:epGroup=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>

                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Production site</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:productionSite!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:productionSite"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:productionSite=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal DOI code</xsl:text>
                    </font>
                </td>
                <td>

                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:journalDOICode!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:journalDOICode"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:journalDOICode=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal DOI content type</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:journalDOIContentType!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:journalDOIContentType"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:journalDOIContentType=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Expiry date</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:expiryDate!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:expiryDate"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:expiryDate=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Typeset model</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:typesetModel!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:typesetModel"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:typesetModel=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            
            

            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Copyright holder</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:copyrightHolder = 'S'">
                            <font class="rhs">
                                <xsl:text>Society owned</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:copyrightHolder = 'E'">
                            <font class="rhs">
                                <xsl:text>Elsevier owned</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:copyrightHolder = 'J'">
                            <font class="rhs">
                                <xsl:text>Joint copyright ownership</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:apply-templates select="//jss:ptsData/jss:copyrightHolder"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Society affiliation</xsl:text>
                    </font>
                </td>
                <td>

                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:societyAffiliation!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:societyAffiliation"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:societyAffiliation=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Copyright Statement</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:copyrightStatement!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:copyrightStatement"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:copyrightStatement=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Reference style</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:refStyle!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:refStyle"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:refStyle=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            
            
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Expanded and abbreviated journal titles</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when
                            test="//jss:JM-EditData/jss:expandedOrAbbreviatedJournalTitles = 0">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:JM-EditData/jss:expandedOrAbbreviatedJournalTitles = 1">
                            <font class="rhs">
                                <xsl:text>Expanded</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when
                            test="//jss:JM-EditData/jss:expandedOrAbbreviatedJournalTitles = 2">
                            <font class="rhs">
                                <xsl:text>Abbreviated</xsl:text>
                            </font>
                        </xsl:when>

                    </xsl:choose>
                </td>
            </tr>


            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Free reference style at submission</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:freeReferenceStyle = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:freeReferenceStyle = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                        
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Reference style comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:referenceStyleComment/jss:p">
                            <xsl:for-each select="//jss:JM-EditData/jss:referenceStyleComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                                <xsl:if test="//jss:JM-EditData/jss:referenceStyleComment/jss:p=''">
                                    <font class="rhs_nodata">
                                        <xsl:text>Contains no data</xsl:text>
                                    </font>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:referenceStyleComment">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:JM-EditData/jss:referenceStyleComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>


                    </xsl:choose>
                </td>
            </tr>
            
            
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>OPCO</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:opco!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:opco"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:opco=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>

                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Paper type inside</xsl:text>
                    </font>
                </td>
                <td>

                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:paperTypeInside!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:paperTypeInside"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:paperTypeInside=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>

                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Paper type cover</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:paperTypeCover!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:paperTypeCover"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:paperTypeCover=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Print type</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:printType!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:printType"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:printType=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Cover finishing</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:coverFinishing!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:coverFinishing"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:coverFinishing=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Bind Type</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:bindType!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:bindType"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:bindType=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Back margin</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:backMargin!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:backMargin"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:backMargin=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Head margin</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:headMargin!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:headMargin"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:headMargin=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Right-hand start</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:righthandStart = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:righthandStart = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                        
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Trim size</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:trimSize!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:trimSize"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:trimSize=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Time Based Publ Ind</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:timeBasedPublInd = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:timeBasedPublInd = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                        
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Fixed Plan Ind</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:fixedPlanInd = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:fixedPlanInd = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                        
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>CAP light plus journal?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:capLightPlus = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:capLightPlus = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Copy-Edit Level</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:copyEditLevel!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:copyEditLevel"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:copyEditLevel=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>CrossMark required for S5 stage?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:cmS5Required = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:cmS5Required = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>CrossMark required for S100 stage?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:cmS100Required = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:cmS100Required = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                        
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>CrossMark required for S200 stage?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:cmS200Required = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:cmS200Required = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>CrossMark required for S250 stage?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:cmS250Required = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:cmS250Required = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>CrossMark required for S300 stage?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:cmS300Required = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:cmS300Required = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Language</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:apply-templates select="//jss:ptsData/jss:language"/>
                    </font>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Default Item Prod</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:defaultItemProd!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:defaultItemProd"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:defaultItemProd=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Required ABP?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:ABP = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:ABP = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Zero Warehousing</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:zeroWarehousing = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:zeroWarehousing = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>ORCID: Primary Editorial System</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:primaryEditorialSystem!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:ptsData/jss:primaryEditorialSystem"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:primaryEditorialSystem=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Special Issues?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:specialIssues = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:specialIssues = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Special issues comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:specialIssuesComment/jss:p">
                            <xsl:for-each select="//jss:JM-EditData/jss:specialIssuesComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:specialIssuesComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:JM-EditData/jss:specialIssuesComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
            


            
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Highlights for ToC</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:highlightsForToC = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:highlightsForToC = 1">
                            <font class="rhs">
                                <xsl:text>E-only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:highlightsForToC = 2">
                            <font class="rhs">
                                <xsl:text>Print only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:highlightsForToC = 3">
                            <font class="rhs">
                                <xsl:text>Electronic and Print</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Is journal bail out?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:indUnsupportedJournal = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:indUnsupportedJournal = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Uses Article Numbers</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:usesArticleNumbers = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:usesArticleNumbers = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
			
			
			<tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Priority Open Access Journal</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:priorityOpenAccessJournal = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:priorityOpenAccessJournal = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
			
			
			<tr>
                <td>
                    <font class="lhs">
                        <xsl:text>LeMans</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:leMans = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:leMans = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
			
			<tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Complex Content</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:complexContent = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:complexContent = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
			
			<tr>
                <td>
                    <font class="lhs">
                        <xsl:text>CPC</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:cpc = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:cpc = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
			
			<tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Quick Transmittal</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:quickTransmittal = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:quickTransmittal = 1">
                            <font class="rhs">
                                <xsl:text>QT</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:quickTransmittal = 2">
                            <font class="rhs">
                                <xsl:text>AQT</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="base_head2" colspan="2">Doc and Section Heads</th>
            </tr>
            <tr>
                <th class="head3" colspan="2">Doc Head</th>
            </tr>
            <tr>
                <th width="30%" class="lhs-thead">Dochead PIT</th>
                <th class="lhs-thead">Dochead Description</th>
            </tr>
            <xsl:for-each select="//jss:docSecInfo/jss:docHeads/jss:docHead">
                <xsl:if test="jss:docheadExpired = 0">
                    <tr>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:docheadPIT"/>
                            </font>
                        </td>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:docheadDescription"/>
                            </font>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Dochead Comments</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:docheadComments/jss:p">
                            <xsl:for-each select="//jss:JM-EditData/jss:docheadComments/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>

                        <xsl:when test="//jss:JM-EditData/jss:docheadComments=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:JM-EditData/jss:docheadComments"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Section Head</th>
            </tr>
            <tr>
                <th width="30%" class="lhs-thead">Section Code</th>
                <th class="lhs-thead">Section Description</th>
            </tr>
            <xsl:for-each select="//jss:docSecInfo/jss:sectionHeads/jss:sectionHead">
                <xsl:if test="jss:sectionExpired = 0">
                    <tr>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:sectionCode"/>
                            </font>
                        </td>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:sectionDescription"/>
                            </font>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Section Comments</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:sectionComments/jss:p">
                            <xsl:for-each select="//jss:JM-EditData/jss:sectionComments/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:sectionComments=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of disable-output-escaping="yes"
                                    select="//jss:JM-EditData/jss:sectionComments"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">CrossMark PITs</th>
            </tr>
            <tr>
                <td colspan="2">



                    <xsl:text>&#8195;</xsl:text>
                    <xsl:for-each select="//jss:docSecInfo/jss:crossMark/jss:cmPIT">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>&#8194;&#9830;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>
            <tr>
                <th class="base_head2" colspan="2">PILOT</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Is the journal included in any Pilot</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:pilot/jss:pilotIncluded = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:pilot/jss:pilotIncluded = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Pilot Specific Information</xsl:text>
                    </font>
                </td>

                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:pilot/jss:pilotSpecificComment/jss:p">
                            <xsl:for-each select="//jss:pilot/jss:pilotSpecificComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:pilot/jss:pilotSpecificComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:pilot/jss:pilotSpecificComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="base_head2" colspan="2">ADDITIONAL INFO</th>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Additional information</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:otherInstructions/jss:p">
                            <xsl:for-each select="//jss:otherInstructions/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:otherInstructions=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of disable-output-escaping="yes"
                                    select="//jss:otherInstructions"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="base_head2" colspan="2">TYPESETTING</th>
            </tr>
            <tr>
                <td colspan="2" class="head3">
                    <xsl:text>Non-standard typeset model information</xsl:text>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Masthead</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:nonStandardTypesetModel/jss:masthead/jss:p">
                            <xsl:for-each select="//jss:nonStandardTypesetModel/jss:masthead/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:nonStandardTypesetModel/jss:masthead=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:additionalSnonStandardTypesetModel100/jss:masthead"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Article head and body layout</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when
                            test="//jss:nonStandardTypesetModel/jss:articleHeadBodyLayout/jss:p">
                            <xsl:for-each
                                select="//jss:nonStandardTypesetModel/jss:articleHeadBodyLayout/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:nonStandardTypesetModel/jss:articleHeadBodyLayout=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:additionalSnonStandardTypesetModel100/jss:articleHeadBodyLayout"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            

            <tr>
                <td class="lhs">
                    <xsl:text>Style Guide On ESG</xsl:text>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:JM-EditData/jss:StyleGuideOnESG = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:JM-EditData/jss:StyleGuideOnESG = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

        </table>
        <br/>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:s0" name="s0">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">S0</th>
            </tr>
            <tr>
                <th class="head3" colspan="2">Item receipt</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>External Login</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:itemreceipt/jss:extLogin = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:itemreceipt/jss:extLogin = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Quick book in?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:itemreceipt/jss:quickBook = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:itemreceipt/jss:quickBook = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Quick book comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:itemreceipt/jss:quickBookComment/jss:p">
                            <xsl:for-each select="//jss:itemreceipt/jss:quickBookComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:itemreceipt/jss:quickBookComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:itemreceipt/jss:quickBookComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
            
            
			
			
			
            <tr>
                <th class="head3" colspan="2">Executors</th>
            </tr>


            <xsl:choose>
                <xsl:when test="//jss:ptsData/jss:executors!=''">
                    <xsl:for-each select="//jss:ptsData/jss:executors/jss:executor">
                        <xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
                        <tr>
                            <td>
                                <font class="lhs">
                                    <xsl:value-of select="@description"/>
                                </font>
                            </td>
                            <td>
                                <font class="lhs">
                                    <xsl:text>Name:</xsl:text>
                                </font>
                                <font class="rhs">
                                    <xsl:value-of select="."
                                    />
                                </font>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>Role:</xsl:text>
                                </font>
                                <font class="rhs">
                                    <xsl:value-of select="@role"/>
                                </font>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>Email ID:</xsl:text>
                                </font>
                                <font class="rhs">
                                    <xsl:value-of select="@emailId"/>
                                </font>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>Country:</xsl:text>
                                </font>
                                <font class="rhs">
                                    <xsl:value-of select="@country"/>
                                </font>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="//jss:ptsData/jss:executors=''">
                    <tr>
                        <td class="lhs">Executor</td>
                        <td>
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </td>
                    </tr>
                </xsl:when>
            </xsl:choose>
			
            <tr>
                <th class="head3" colspan="2">Additional information</th>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Additional journal-specific login instructions</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:additionalLoginInstructions/jss:p">
                            <xsl:for-each select="//jss:additionalLoginInstructions/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:additionalLoginInstructions=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:additionalLoginInstructions"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

			
            <tr>
                <th class="head3" colspan="2">Quick Transmittal Dates</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>From Date</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:value-of
                            select="jss:journalStylesheet/jss:baseData/jss:ptsData/jss:quickTransmittalDates/jss:journalAttrDateFrom_QT"
                        />
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>To Date</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:value-of
                            select="jss:journalStylesheet/jss:baseData/jss:ptsData/jss:quickTransmittalDates/jss:journalAttrDateTo_QT"
                        />
                    </font>
                </td>
            </tr>

        </table>
        <br/>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:pit" name="pit">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">PIT</th>
            </tr>
            <tr>
                <th class="head3" colspan="2">Doc Head</th>
            </tr>
            <tr>
                <th width="30%" class="lhs-thead">Dochead PIT</th>
                <th class="lhs-thead">Dochead Description</th>
            </tr>
            <xsl:for-each select="//jss:docHeads/jss:docHead">
                <xsl:if test="jss:docheadExpired = 0">
                    <tr>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:docheadPIT"/>
                            </font>
                        </td>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:docheadDescription"/>
                            </font>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Dochead Comments</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:docHeads/jss:docheadComments/jss:p">
                            <xsl:for-each select="//jss:docHeads/jss:docheadComments/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:docHeads/jss:docheadComments=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:docHeads/jss:docheadComments"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </table>
        <br/>
        <table border="4" width="1000pt">
            <tr>
                <th class="head3" colspan="2">Section Head</th>
            </tr>
            <tr>
                <th width="30%" class="lhs-thead">Section Code</th>
                <th class="lhs-thead">Section Description</th>
            </tr>
            <xsl:for-each select="//jss:sectionHeads/jss:sectionHead">
                <xsl:if test="jss:sectionExpired = 0">
                    <tr>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:sectionCode"/>
                            </font>
                        </td>
                        <td>
                            <font class="tbl1">
                                <xsl:apply-templates select="jss:sectionDescription"/>
                            </font>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Section Comments</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:sectionHeads/jss:sectionComments/jss:p">
                            <xsl:for-each select="//jss:sectionHeads/jss:sectionComments/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:sectionHeads/jss:sectionComments=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:sectionHeads/jss:sectionComments"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </table>
        <br/>
        <table border="4" width="1000pt">
            <tr>
                <th class="head3" colspan="2">CrossMark PITs</th>
            </tr>
            <tr>
                <td colspan="2">
                    <xsl:text>&#8195;</xsl:text>
                    <xsl:for-each select="//jss:crossMark/jss:cmPIT">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>&#8194;&#9830;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
        <br/>
    </xsl:template>


    

    <xsl:template match="jss:journalStylesheet/jss:cu" name="cu">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="4">C&amp;U</th>
            </tr>
            <tr>
                <th class="head3" colspan="4">History</th>
            </tr>

            
            <tr>
                <td colspan="4">
                    <font class="rhs">Regular Issue</font>
                </td>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Received date</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:received = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:received = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:received = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:received = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:received = 4">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Revised date</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:revised = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:revised = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:revised = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:revised = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:history/jss:regularIssue/jss:revised = 4">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>

                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Accepted date</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:accepted = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:accepted = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:accepted = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:accepted = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:history/jss:regularIssue/jss:accepted = 4">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Relevant PITS</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:regularIssue/jss:PITs_ri=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:for-each select="//jss:history/jss:regularIssue/jss:PITs_ri/jss:PIT_ri">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>

            <tr>
                <td colspan="4">
                    <font class="rhs">Special Issue</font>
                </td>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Special issue received date</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:received_si = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:received_si = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:received_si = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:received_si = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:received_si = 4">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Special issue revised date</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:revised_si = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:revised_si = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:revised_si = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:revised_si = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:revised_si = 4">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Special issue accepted date</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:accepted_si = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:accepted_si = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:accepted_si = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:accepted_si = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:accepted_si = 4">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Relevant PITS</xsl:text>
                    </font>
                </td>
                <td colspan="3">

                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:specialIssue/jss:PITs_si=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:for-each select="//jss:history/jss:specialIssue/jss:PITs_si/jss:PIT_si">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal specific history comments</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:journalSpecificHistoryComment/jss:p">
                            <xsl:for-each
                                select="//jss:history/jss:journalSpecificHistoryComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:journalSpecificHistoryComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:history/jss:journalSpecificHistoryComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>History dates for items linked to an item group</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:historyItemGroup = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:historyItemGroup = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:historyItemGroup = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:historyItemGroup = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:historyItemGroup = 4">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>History item group comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:historyItemGroupComment/jss:p">
                            <xsl:for-each select="//jss:history/jss:historyItemGroupComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:historyItemGroupComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:history/jss:historyItemGroupComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Online publication date</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:onlinePubDate = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:onlinePubDate = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Online publication date comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:onlinePubDateComment/jss:p">
                            <xsl:for-each select="//jss:history/jss:onlinePubDateComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:onlinePubDateComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:history/jss:onlinePubDateComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Add Editor name?</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorName = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorName = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Editor name comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorNameComment/jss:p">
                            <xsl:for-each
                                select="//jss:history/jss:editorInfo/jss:editorNameComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorNameComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:history/jss:editorInfo/jss:editorNameComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Editor display name</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorDisplayName = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorDisplayName = 1">
                            <font class="rhs">
                                <xsl:text>Full name</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorDisplayName = 2">
                            <font class="rhs">
                                <xsl:text>Initial and surname</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:editorDisplayName = 3">
                            <font class="rhs">
                                <xsl:text>Initials</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>


            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Editor display text</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:displayText">
                            <xsl:for-each select="//jss:history/jss:editorInfo/jss:displayText">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:history/jss:editorInfo/jss:displayText=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:history/jss:editorInfo/jss:displayText"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="head3" colspan="4">Abstract</th>
            </tr>
            <tr>
                <td colspan="4">
                    <font class="rhs">
                        <xsl:text>PIT specific requirement</xsl:text>
                    </font>
                </td>
            </tr>

            <xsl:if test="//jss:abstractPITspecificRequirement/@action='1'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Use if supplied</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:for-each
                                select="//jss:abstractPITspecificRequirement[@action='1']/jss:abstractPITS/jss:abstractPIT">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </font>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Word Count: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:apply-templates
                                select="//jss:abstractPITspecificRequirement[@action='1']/jss:PITspecificWordCount"
                            />
                        </font>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Structuring: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:choose>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='1']/jss:abstractStructure = 0">
                                    <font class="rhs-nd">
                                        <xsl:text>Option not selected</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='1']/jss:abstractStructure = 1">
                                    <font class="tbl1">
                                        <xsl:text>Structured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='1']/jss:abstractStructure = 2">
                                    <font class="tbl1">
                                        <xsl:text>Unstructured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='1']/jss:abstractStructure = 3">
                                    <font class="tbl1">
                                        <xsl:text>Use as supplied</xsl:text>
                                    </font>
                                </xsl:when>
                            </xsl:choose>
                        </font>

                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="//jss:abstractPITspecificRequirement/@action='2'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Query JM if not supplied</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:for-each
                                select="//jss:abstractPITspecificRequirement[@action='2']/jss:abstractPITS/jss:abstractPIT">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </font>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Word Count: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:apply-templates
                                select="//jss:abstractPITspecificRequirement[@action='2']/jss:PITspecificWordCount"
                            />
                        </font>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Structuring: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:choose>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='2']/jss:abstractStructure = 0">
                                    <font class="rhs-nd">
                                        <xsl:text>Option not selected</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='2']/jss:abstractStructure = 1">
                                    <font class="tbl1">
                                        <xsl:text>Structured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='2']/jss:abstractStructure = 2">
                                    <font class="tbl1">
                                        <xsl:text>Unstructured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='2']/jss:abstractStructure = 3">
                                    <font class="tbl1">
                                        <xsl:text>Use as supplied</xsl:text>
                                    </font>
                                </xsl:when>
                            </xsl:choose>
                        </font>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="//jss:abstractPITspecificRequirement/@action='3'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Send missing items letter if not supplied </xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <xsl:for-each
                            select="//jss:abstractPITspecificRequirement[@action='3']/jss:abstractPITS/jss:abstractPIT">
                            <font class="tbl1">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </font>
                        </xsl:for-each>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Word Count: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:apply-templates
                                select="//jss:abstractPITspecificRequirement[@action='3']/jss:PITspecificWordCount"
                            />
                        </font>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Structuring: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:choose>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='3']/jss:abstractStructure = 0">
                                    <font class="rhs-nd">
                                        <xsl:text>Option not selected</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='3']/jss:abstractStructure = 1">
                                    <font class="tbl1">
                                        <xsl:text>Structured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='3']/jss:abstractStructure = 2">
                                    <font class="tbl1">
                                        <xsl:text>Unstructured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='3']/jss:abstractStructure = 3">
                                    <font class="tbl1">
                                        <xsl:text>Use as supplied</xsl:text>
                                    </font>
                                </xsl:when>
                            </xsl:choose>
                        </font>
                    </td>
                </tr>
            </xsl:if>

            <xsl:if test="//jss:abstractPITspecificRequirement/@action='4'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Query author on AQF</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <xsl:for-each
                            select="//jss:abstractPITspecificRequirement[@action='4']/jss:abstractPITS/jss:abstractPIT">
                            <font class="tbl1">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </font>
                        </xsl:for-each>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Word Count: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:apply-templates
                                select="//jss:abstractPITspecificRequirement[@action='4']/jss:PITspecificWordCount"
                            />
                        </font>
                        <br/>
                        <font class="rhs">
                            <b>
                                <xsl:text>Structuring: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:choose>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='4']/jss:abstractStructure = 0">
                                    <font class="rhs-nd">
                                        <xsl:text>Option not selected</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='4']/jss:abstractStructure = 1">
                                    <font class="tbl1">
                                        <xsl:text>Structured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='4']/jss:abstractStructure = 2">
                                    <font class="tbl1">
                                        <xsl:text>Unstructured</xsl:text>
                                    </font>
                                </xsl:when>
                                <xsl:when
                                    test="//jss:abstractPITspecificRequirement[@action='4']/jss:abstractStructure = 3">
                                    <font class="tbl1">
                                        <xsl:text>Use as supplied</xsl:text>
                                    </font>
                                </xsl:when>
                            </xsl:choose>
                        </font>

                    </td>
                </tr>
            </xsl:if>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific abstract requirements comment</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:abstract/jss:abstractComment/jss:p">
                            <xsl:for-each select="//jss:abstract/jss:abstractComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:abstract/jss:abstractComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:abstract/jss:abstractComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="head3" colspan="4">Graphical Abstract</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific graphical abstract requirements</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when
                            test="//jss:graphicalAbstract/jss:journalSpecificGraphicalAbstract = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:graphicalAbstract/jss:journalSpecificGraphicalAbstract = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:graphicalAbstract/jss:journalSpecificGraphicalAbstract = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific graphical abstract requirements comment</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when
                            test="//jss:graphicalAbstract/jss:journalSpecificGraphicalAbstractComment/jss:p">
                            <xsl:for-each
                                select="//jss:graphicalAbstract/jss:journalSpecificGraphicalAbstractComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when
                            test="//jss:graphicalAbstract/jss:journalSpecificGraphicalAbstractComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:graphicalAbstract/jss:journalSpecificGraphicalAbstractComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>GA Format if Colour</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:graphicalAbstract/jss:gaFormat = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:graphicalAbstract/jss:gaFormat = 1">
                            <font class="rhs">
                                <xsl:text>E-ONLY-COLOUR</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:graphicalAbstract/jss:gaFormat = 2">
                            <font class="rhs">
                                <xsl:text>COLOUR-IN-PRINT billing No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:graphicalAbstract/jss:gaFormat = 3">
                            <font class="rhs">
                                <xsl:text>COLOUR</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific GA TOC</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:graphicalAbstract/jss:journalSpecificGATOC = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:graphicalAbstract/jss:journalSpecificGATOC = 1">
                            <font class="rhs">
                                <xsl:text>E-only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:graphicalAbstract/jss:journalSpecificGATOC = 2">
                            <font class="rhs">
                                <xsl:text>Print only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:graphicalAbstract/jss:journalSpecificGATOC = 3">
                            <font class="rhs">
                                <xsl:text>Electronic and Print</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific GA Title Page</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:graphicalAbstract/jss:journalSpecificGATitlePage = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:graphicalAbstract/jss:journalSpecificGATitlePage = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            
            


            <tr>
                <th class="head3" colspan="4">Keywords</th>
            </tr>
            <tr>
                <td colspan="4">
                    <font class="rhs">
                        <xsl:text>Keyword PIT specific requirement</xsl:text>
                    </font>
                </td>
            </tr>
            <xsl:if test="//jss:keywordPITspecificRequirement/@action='1'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Use if supplied</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:for-each
                                select="//jss:keywordPITspecificRequirement[@action='1']/jss:keywordPITs/jss:keywordPIT">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </font>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="//jss:keywordPITspecificRequirement/@action='2'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Query JM if not supplied</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:for-each
                                select="//jss:keywordPITspecificRequirement[@action='2']/jss:keywordPITs/jss:keywordPIT">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </font>
                    </td>
                </tr>
            </xsl:if>


            <xsl:if test="//jss:keywordPITspecificRequirement/@action='3'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Send missing items letter if not supplied</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:for-each
                                select="//jss:keywordPITspecificRequirement[@action='3']/jss:keywordPITs/jss:keywordPIT">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </font>
                    </td>
                </tr>
            </xsl:if>

            <xsl:if test="//jss:keywordPITspecificRequirement/@action='4'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Query author on AQF if not supplied</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:for-each
                                select="//jss:keywordPITspecificRequirement[@action='4']/jss:keywordPITs/jss:keywordPIT">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </font>
                    </td>
                </tr>
            </xsl:if>

            <xsl:if test="//jss:keywordPITspecificRequirement/@action='5'">
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Do not use even if supplied</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <b>
                                <xsl:text>PITs: </xsl:text>
                            </b>
                        </font>
                        <font class="tbl1">
                            <xsl:for-each
                                select="//jss:keywordPITspecificRequirement[@action='5']/jss:keywordPITs/jss:keywordPIT">
                                <xsl:apply-templates/>
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </font>
                    </td>
                </tr>
            </xsl:if>



            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Keyword source</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:keywords/jss:keywordSource = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:keywords/jss:keywordSource = 1">
                            <font class="rhs">
                                <xsl:text>Free text</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:keywords/jss:keywordSource = 2">
                            <font class="rhs">
                                <xsl:text>Journal-specific list (add details to comments field)</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>


            <tr>
                <td colspan="4">
                    <font class="rhs">
                        <xsl:text>Keyword count requirement</xsl:text>
                    </font>
                </td>
            </tr>


            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Minimum number of keywords</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:keywords/jss:keywordCount/jss:keywordsMin!=''">
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:keywords/jss:keywordCount/jss:keywordsMin"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:keywords/jss:keywordCount/jss:keywordsMin=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Maximum number of keywords</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:keywords/jss:keywordCount/jss:keywordsMax!=''">
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:keywords/jss:keywordCount/jss:keywordsMax"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:keywords/jss:keywordCount/jss:keywordsMax=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific keywords requirements comment</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:keywords/jss:keywordComments/jss:p">
                            <xsl:for-each select="//jss:keywords/jss:keywordComments/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:keywords/jss:keywordComments=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of disable-output-escaping="yes"
                                    select="//jss:keywords/jss:keywordComments"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="4">Highlights</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific highlights requirements</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:highlights/jss:journalSpecificHighlights = 0">
                            <font class="rhs">
                                <xsl:text>JM to select an option</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:highlights/jss:journalSpecificHighlights = 1">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:highlights/jss:journalSpecificHighlights = 2">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific highlights requirements comment</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:highlights/jss:journalSpecificHighlightsComment/jss:p">
                            <xsl:for-each
                                select="//jss:highlights/jss:journalSpecificHighlightsComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:highlights/jss:journalSpecificHighlightsComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:highlights/jss:journalSpecificHighlightsComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="4">Classification</th>
            </tr>

            



            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Classification requirements</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:classification/jss:classificationRequirement = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classification/jss:classificationRequirement = 1">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classification/jss:classificationRequirement = 2">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classification/jss:classificationRequirement = 3">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classification/jss:classificationRequirement = 4">
                            <font class="rhs">
                                <xsl:text>Send missing item letter if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classification/jss:classificationRequirement = 5">
                            <font class="rhs">
                                <xsl:text>Query author on AQF if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classification/jss:classificationRequirement = 6">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Classification source</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:apply-templates select="//jss:classification/jss:classificationSource"
                        />
                    </font>
                </td>
            </tr>

            <tr>
                <td colspan="4">
                    <font class="rhs">
                        <xsl:text>Classification Count</xsl:text>
                    </font>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Minimum number of classification codes</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:classificationCount/jss:classificationMin!=''">
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:classificationCount/jss:classificationMin"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classificationCount/jss:classificationMin=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Maximum number of classification codes</xsl:text>
                    </font>
                </td>
                <td colspan="3">

                    <xsl:choose>
                        <xsl:when test="//jss:classificationCount/jss:classificationMax!=''">
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:classificationCount/jss:classificationMax"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:classificationCount/jss:classificationMax=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>

                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Classification Comments</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:classification/jss:classificationComment/jss:p">
                            <xsl:for-each
                                select="//jss:classification/jss:classificationComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>

                        <xsl:when test="//jss:classification/jss:classificationComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:classification/jss:classificationComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="4">Support for Transparency document</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Transparency document (only for PMG 604)</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:cu/jss:transparencyDocument = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:cu/jss:transparencyDocument = 1">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:cu/jss:transparencyDocument = 2">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:cu/jss:transparencyDocument = 3">
                            <font class="rhs">
                                <xsl:text>Query author on AQF if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:cu/jss:transparencyDocument = 4">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="4">Artwork</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Check artwork for patient anonymity</xsl:text>
                    </font>
                </td>

                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:artwork_PA/jss:artworkForPatientAnonymity = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:artwork_PA/jss:artworkForPatientAnonymity = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="4">Ethics</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Informed consent</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:ethics/jss:informedConsent = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ethics/jss:informedConsent = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>


            <tr>
                <th class="head3" colspan="4">Colour</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Waiving instruction for colour figures in print</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:colour/jss:colourFiguresInPrint = 0">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:colour/jss:colourFiguresInPrint = 1">
                            <font class="rhs">
                                <xsl:text>Free color for all figures</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:colour/jss:colourFiguresInPrint = 2">
                            <font class="rhs">
                                <xsl:text>E-only journals</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:colour/jss:colourFiguresInPrint = 3">
                            <font class="rhs">
                                <xsl:text>Editor/Author/Society decision</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:colour/jss:colourFiguresInPrint = 4">
                            <font class="rhs">
                                <xsl:text>Others</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Free Printed Colour</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:colour/jss:freePrintedColour = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:colour/jss:freePrintedColour = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>No Free Web Colour</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:colour/jss:noFreeWebColour = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:colour/jss:noFreeWebColour = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Which colour figure letter to the author?</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:colour/jss:colourFiguresCorrespondence = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:colour/jss:colourFiguresCorrespondence = 1">
                            <font class="rhs">
                                <xsl:text>Colour letter</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:colour/jss:colourFiguresCorrespondence = 2">
                            <font class="rhs">
                                <xsl:text>Colour confirmation letter</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:colour/jss:colourFiguresCorrespondence = 3">
                            <font class="rhs">
                                <xsl:text>Do not send colour letter</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Colour Comments</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:colour/jss:colourComment/jss:p">
                            <xsl:for-each select="//jss:colour/jss:colourComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:colour/jss:colourComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:colour/jss:colourComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="head3" colspan="4">Author Correspondence</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Can suppliers contact author directly?</xsl:text>
                    </font>
                </td>
                <td colspan="3">

                    <xsl:choose>
                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 1">
                            <font class="rhs">
                                <xsl:text>Yes, contact author for Forms</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 2">
                            <font class="rhs">
                                <xsl:text>Yes, contact author for Missing Item</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 3">
                            <font class="rhs">
                                <xsl:text>Yes, contact author for Others</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 4">
                            <font class="rhs">
                                <xsl:text>Yes, contact author for Forms and Missing Item</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 5">
                            <font class="rhs">
                                <xsl:text>Yes, contact author for Forms and Others</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 6">
                            <font class="rhs">
                                <xsl:text>Yes, contact author for Missing Item and Others</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:correspondence/jss:contactAuthor = 7">
                            <font class="rhs">
                                <xsl:text>No, contact JM</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific Author correspondence comments</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:correspondence/jss:correspondenceAuthorComment/jss:p">
                            <xsl:for-each
                                select="//jss:correspondence/jss:correspondenceAuthorComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:correspondence/jss:correspondenceAuthorComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:correspondence/jss:correspondenceAuthorComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="4">Offprints and free issues</th>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Extra journal specific offprint instructions</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:offprints/jss:extraOffprintInstructions/jss:p">
                            <xsl:for-each
                                select="//jss:offprints/jss:extraOffprintInstructions/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:offprints/jss:extraOffprintInstructions=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of disable-output-escaping="yes"
                                    select="//jss:offprints/jss:extraOffprintInstructions"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Free Issues Comment</xsl:text>
                    </font>
                </td>
                <td colspan="3">
                    <xsl:choose>
                        <xsl:when test="//jss:offprints/jss:freeIssuesComment/jss:p">
                            <xsl:for-each select="//jss:offprints/jss:freeIssuesComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:offprints/jss:freeIssuesComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:offprints/jss:freeIssuesComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
        </table>
        <br/>
    </xsl:template>
    
    <xsl:template match="jss:journalStylesheet/jss:s100" name="s100">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">S100</th>
            </tr>
            <tr>
                <th class="head3" colspan="2">Journal Title</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Abbreviated Journal Title</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:abbreviatedJournalTitle!=''">
                            <font class="rhs">
                                <xsl:value-of select="//jss:abbreviatedJournalTitle"/>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:abbreviatedJournalTitle=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Heading</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Numbering style</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:heading/jss:numberingStyle = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:heading/jss:numberingStyle = 1">
                            <font class="rhs">
                                <xsl:text>Numbered</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:heading/jss:numberingStyle = 2">
                            <font class="rhs">
                                <xsl:text>UnNumbered</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:heading/jss:numberingStyle = 3">
                            <font class="rhs">
                                <xsl:text>Non-Standard, see comment</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Numbering style comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:heading/jss:NSComment/jss:p">
                            <xsl:for-each select="//jss:heading/jss:NSComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>

                        <xsl:when test="//jss:heading/jss:NSComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:heading/jss:NSComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Degrees and titles</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific degrees and titles</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when
                            test="//jss:degreesAndTitles/jss:journalSpecificDegreesTitles = '1'">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:degreesAndTitles/jss:journalSpecificDegreesTitles = '3'">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:degreesAndTitles/jss:journalSpecificDegreesTitles = '4'">
                            <font class="rhs">
                                <xsl:text>Query author on AQF if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            
            <tr>
                <th class="head3" colspan="2">Logo Placement</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Right</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:logoPlacement/jss:right = '0'">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:right = '1'">
                            <font class="rhs">
                                <xsl:text>Society</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:right = '2'">
                            <font class="rhs">
                                <xsl:text>Elsevier</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:right = '3'">
                            <font class="rhs">
                                <xsl:text>Production &amp; Hosting</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:right = '4'">
                            <font class="rhs">
                                <xsl:text>Journal cover</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Left</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:logoPlacement/jss:left = '0'">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:left = '1'">
                            <font class="rhs">
                                <xsl:text>Society</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:left = '2'">
                            <font class="rhs">
                                <xsl:text>Elsevier</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:left = '3'">
                            <font class="rhs">
                                <xsl:text>Production &amp; Hosting</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:logoPlacement/jss:left = '4'">
                            <font class="rhs">
                                <xsl:text>Journal cover</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="head3" colspan="2">Author info</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Multiple corresponding authors permitted?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:authorInfo/jss:multipleCorrespondingAuthors = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:authorInfo/jss:multipleCorrespondingAuthors = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>



            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Authors’ e-mail addresses, URLs, and social media links</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:authorInfo/jss:authorLinks = '0'">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:authorInfo/jss:authorLinks = '1'">
                            <font class="rhs">
                                <xsl:text>Include e-mail addresses only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:authorInfo/jss:authorLinks = '2'">
                            <font class="rhs">
                                <xsl:text>Include all social media links</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:authorInfo/jss:authorLinks = '3'">
                            <font class="rhs">
                                <xsl:text>Include specific social media links (see comments)</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Authors’ e-mail addresses, URLs, and social media links comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:authorInfo/jss:specificSocialMediaLinksComment/jss:p">
                            <xsl:for-each
                                select="//jss:authorInfo/jss:specificSocialMediaLinksComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:authorInfo/jss:specificSocialMediaLinksComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:authorInfo/jss:specificSocialMediaLinksComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Should ORCID logos be included?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:authorInfo/jss:orcidLogo = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:authorInfo/jss:orcidLogo = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="head3" colspan="2">Acknowledgement(s)</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Funding subsection</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:fundingSubsection = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:fundingSubsection = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Funding comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:fundingComment/jss:p">
                            <xsl:for-each select="//jss:acknowledgements/jss:fundingComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:fundingComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:acknowledgements/jss:fundingComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Contributing subsection</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:contributingSubsection = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:contributingSubsection = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Contributing comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:contributingComment/jss:p">
                            <xsl:for-each
                                select="//jss:acknowledgements/jss:contributingComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:contributingComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:acknowledgements/jss:contributingComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Supporting subsection</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:supportingSubsection = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:supportingSubsection = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Supporting comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:supportingComment/jss:p">
                            <xsl:for-each
                                select="//jss:acknowledgements/jss:supportingComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:supportingComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:acknowledgements/jss:supportingComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>


            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Facilities subsection</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:facilitiesSubsection = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:facilitiesSubsection = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Facilities comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:facilitiesComment/jss:p">
                            <xsl:for-each
                                select="//jss:acknowledgements/jss:facilitiesComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:facilitiesComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:acknowledgements/jss:facilitiesComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Supplies subsection</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:suppliesSubsection = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:suppliesSubsection = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Supplies comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:suppliesComment/jss:p">
                            <xsl:for-each select="//jss:acknowledgements/jss:suppliesComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:suppliesComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:acknowledgements/jss:suppliesComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Conflict-of-interest subsection</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:CoISubsection = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:CoISubsection = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Conflict-of-interest comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:CoISubsectionComment/jss:p">
                            <xsl:for-each
                                select="//jss:acknowledgements/jss:CoISubsectionComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:CoISubsectionComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:acknowledgements/jss:CoISubsectionComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Sponsor-role subsection</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:sponsorRoleSubsection = '0'">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:sponsorRoleSubsection = '1'">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Sponsor-role comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgements/jss:sponsorRoleComment/jss:p">
                            <xsl:for-each
                                select="//jss:acknowledgements/jss:sponsorRoleComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:acknowledgements/jss:sponsorRoleComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:acknowledgements/jss:sponsorRoleComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Acknowledgement(s) PITs</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:acknowledgementsPITs/jss:ackPIT=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>

                    <xsl:for-each select="//jss:acknowledgementsPITs/jss:ackPIT">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>


            <tr>
                <th class="head3" colspan="2">Ethics Information</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Ethics</xsl:text>
                    </font>
                </td>

                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ethicsInfo/jss:ethicsDetails = '0'">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ethicsInfo/jss:ethicsDetails = '1'">
                            <font class="rhs">
                                <xsl:text>Use if Supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ethicsInfo/jss:ethicsDetails = '2'">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ethicsInfo/jss:ethicsDetails = '3'">
                            <font class="rhs">
                                <xsl:text>Query author on AQF if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ethicsInfo/jss:ethicsDetails = '4'">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>


            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Ethics PITs</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ethicsPITs/jss:ethicsPIT=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>

                    <xsl:for-each select="//jss:ethicsPITs/jss:ethicsPIT">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Ethics comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ethicsInfo/jss:ethicsComment/jss:p">
                            <xsl:for-each select="//jss:ethicsInfo/jss:ethicsComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:ethicsInfo/jss:ethicsComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:ethicsInfo/jss:ethicsComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <th class="head3" colspan="2">Introduction</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Introduction</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:intro/jss:introduction = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:intro/jss:introduction = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Title Requirement</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:intro/jss:titlereq = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:intro/jss:titlereq = 1">
                            <font class="rhs">
                                <xsl:text>Use as supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:intro/jss:titlereq = 2">
                            <font class="rhs">
                                <xsl:text>Rename as Background</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:intro/jss:titlereq = 3">
                            <font class="rhs">
                                <xsl:text>Rename as Summary</xsl:text>
                            </font>
                        </xsl:when>
                        
                        <xsl:when test="//jss:intro/jss:titlereq = 4">
                            <font class="rhs">
                                <xsl:text>Rename as Introduction</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:intro/jss:titlereq = 5">
                            <font class="rhs">
                                <xsl:text>Rename as Method details</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>PIT List</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:intro/jss:introPITs=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>

                    <xsl:for-each select="//jss:intro/jss:introPITs/jss:introPIT">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Introduction comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:intro/jss:introductionComment/jss:p">
                            <xsl:for-each select="//jss:intro/jss:introductionComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:intro/jss:introductionComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:intro/jss:introductionComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Conflict of Interest</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Conflict of Interest</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:CoI/jss:ConflictInterest = 0">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:CoI/jss:ConflictInterest = 1">
                            <font class="rhs">
                                <xsl:text>Use if Supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:CoI/jss:ConflictInterest = 2">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:CoI/jss:ConflictInterest = 3">
                            <font class="rhs">
                                <xsl:text>Query author on AQF if not supplied</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:when test="//jss:CoI/jss:ConflictInterest = 4">
                            <font class="rhs">
                                <xsl:text>Query JM if not supplied</xsl:text>
                            </font>
                        </xsl:when>
						<xsl:when test="//jss:CoI/jss:ConflictInterest = 5">
                            <font class="rhs">
                                <xsl:text>DoCI enabled</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>PIT List</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:CoI/jss:CoIPITs=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:for-each select="//jss:CoI/jss:CoIPITs/jss:CoIPIT">
                        <font class="tbl1">
                            <xsl:apply-templates select="."/>
                            <xsl:text>;&#8194;</xsl:text>
                        </font>
                    </xsl:for-each>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Conflict of Interest comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:CoI/jss:CoIComment/jss:p">
                            <xsl:for-each select="//jss:CoI/jss:CoIComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:CoI/jss:CoIComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:CoI/jss:CoIComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Biographical Information</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Required author details</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:bioInfo/jss:authorDetails = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:bioInfo/jss:authorDetails = 1">
                            <font class="rhs">
                                <xsl:text>Author biography only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:bioInfo/jss:authorDetails = 2">
                            <font class="rhs">
                                <xsl:text>Author photograph only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:bioInfo/jss:authorDetails = 3">
                            <font class="rhs">
                                <xsl:text>Author biography and photograph</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:bioInfo/jss:authorDetails = 4">
                            <font class="rhs">
                                <xsl:text>Use if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:bioInfo/jss:authorDetails = 5">
                            <font class="rhs">
                                <xsl:text>Do not use even if supplied</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:bioInfo/jss:authorDetails = 6">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Author details comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:bioInfo/jss:ADComment/jss:p">
                            <xsl:for-each select="//jss:bioInfo/jss:ADComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:bioInfo/jss:ADComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:bioInfo/jss:ADComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Non-standard label requirements</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Non-standard Fig./Table/Textbox label requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:floatLabel/jss:NSFloatLabel/jss:p">
                            <xsl:for-each select="//jss:floatLabel/jss:NSFloatLabel/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:floatLabel/jss:NSFloatLabel=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:floatLabel/jss:NSFloatLabel"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Non-Standard artwork requirements</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific artwork requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:artwork/jss:journalSpecificArtwork = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:artwork/jss:journalSpecificArtwork = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific artwork requirements comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:artwork/jss:journalSpecificArtworkComment/jss:p">
                            <xsl:for-each
                                select="//jss:artwork/jss:journalSpecificArtworkComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:artwork/jss:journalSpecificArtworkComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:artwork/jss:journalSpecificArtworkComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Latex</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Latex journal</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:latexInfo/jss:latex = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:latexInfo/jss:latex = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            
            <tr>
                <th class="head3" colspan="2">Copyright Information</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Copyright Lines</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:copyright/jss:copyrightLines/jss:p">
                            <xsl:for-each select="//jss:copyright/jss:copyrightLines/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:copyright/jss:copyrightLines=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:copyright/jss:copyrightLines"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="head3" colspan="2">Footnote</th>
            </tr>
            
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>SI Footnote</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:s100/jss:footnote/jss:SI_footnote = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:s100/jss:footnote/jss:SI_footnote = 1">
                            <font class="rhs">
                                <xsl:text>Yes – standard footnote</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:s100/jss:footnote/jss:SI_footnote = 2">
                            <font class="rhs">
                                <xsl:text>Yes – non-standard footnote</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>SI Footnote comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:s100/jss:footnote/jss:SI_footnoteComment/jss:p">
                            <xsl:for-each
                                select="//jss:s100/jss:footnote/jss:SI_footnoteComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:s100/jss:footnote/jss:SI_footnoteComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:s100/jss:footnote/jss:SI_footnoteComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Is a peer review footnote required</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:if test="//jss:s100/jss:footnote/jss:peerReviewFootnote">
                        <xsl:for-each
                            select="//jss:s100/jss:footnote/jss:peerReviewFootnote">
                            <font class="rhs">
                                <xsl:value-of select="." disable-output-escaping="yes"/>
                                <br/>
                            </font>
                        </xsl:for-each>
                    </xsl:if>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Article Footnote</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:footnote/jss:articleFootnote/jss:p">
                            <xsl:for-each select="//jss:footnote/jss:articleFootnote/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:footnote/jss:articleFootnote=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:footnote/jss:articleFootnote"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <th class="head3" colspan="2">Additional information</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Review contents</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:additionalS100/jss:reviewContents = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:additionalS100/jss:reviewContents = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
			
			
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Additional journal-specific S100 typesetting requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:additionalS100/jss:additionalS100Comment/jss:p">
                            <xsl:for-each
                                select="//jss:additionalS100/jss:additionalS100Comment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:additionalS100/jss:additionalS100Comment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:additionalS100/jss:additionalS100Comment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

        </table>
        <br/>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:s200" name="s200">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">S200</th>
            </tr>
            <tr>
                <th class="head3" colspan="2">Mastercopy</th>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>In-house MC</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:ptsData/jss:inHouseMC = 0">
                            <font class="rhs">
                                <xsl:text>supplier/typesetter</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:ptsData/jss:inHouseMC = 1">
                            <font class="rhs">
                                <xsl:text>elsevier internal</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Mastercopying comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:mc/jss:mastercopyingComment/jss:p">
                            <xsl:for-each select="//jss:mc/jss:mastercopyingComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:mc/jss:mastercopyingComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:mc/jss:mastercopyingComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Additional information</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Additional journal-specific S200 typesetting requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:additionalS200/jss:p">
                            <xsl:for-each select="//jss:additionalS200/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:additionalS200=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:additionalS200"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </table>
        <br/>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:p100" name="p100">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">P100</th>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Delivery requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:deliveryRequirements = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:deliveryRequirements = 1">
                            <font class="rhs">
                                <xsl:text>Cover and Prelims only</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:deliveryRequirements = 2">
                            <font class="rhs">
                                <xsl:text>Cover to cover (individual PDFs)</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:deliveryRequirements = 3">
                            <font class="rhs">
                                <xsl:text>Other, see comments</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:deliveryRequirements = 4">
                            <font class="rhs">
                                <xsl:text>None</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:deliveryRequirements = 5">
                            <font class="rhs">
                                <xsl:text>Cover to cover (combined PDF)</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Additional journal-specific P100 typesetting requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:additionalP100/jss:p">
                            <xsl:for-each select="//jss:additionalP100/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:additionalP100=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:additionalP100"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Barcode</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:barcode = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcode = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Barcode Placement</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:barcodePlacement = 0">
                            <font class="rhs">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcodePlacement = 1">
                            <font class="rhs">
                                <xsl:text>Outside front cover</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcodePlacement = 2">
                            <font class="rhs">
                                <xsl:text>Inside front cover</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcodePlacement = 3">
                            <font class="rhs">
                                <xsl:text>Outside back cover</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcodePlacement = 4">
                            <font class="rhs">
                                <xsl:text>Inside back cover</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcodePlacement = 5">
                            <font class="rhs">
                                <xsl:text>Front matter</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcodePlacement = 6">
                            <font class="rhs">
                                <xsl:text>Back matter</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:barcodePlacement = 7">
                            <font class="rhs">
                                <xsl:text>TOC</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>

            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Compact Journal?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:projectCompact/jss:compactJournal= 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:projectCompact/jss:compactJournal = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Compact Journal Comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:compactJournalComment/jss:p">
                            <xsl:for-each select="//jss:compactJournalComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:compactJournalComment/jss:p=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:compactComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

        </table>
        <br/>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:s300" name="s300">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">S300</th>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Journal-specific cover artwork requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:journalSpecificCover = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:journalSpecificCover = 1">
                            <font class="rhs">
                                <xsl:text>Standard</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:journalSpecificCover = 2">
                            <font class="rhs">
                                <xsl:text>Different cover image for each issue</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:journalSpecificCover = 3">
                            <font class="rhs">
                                <xsl:text>Different cover image for each volume</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:journalSpecificCover = 4">
                            <font class="rhs">
                                <xsl:text>Other (see comments)</xsl:text>
                            </font>
                        </xsl:when>

                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal specific cover comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:journalSpecificCoverComment/jss:p">
                            <xsl:for-each select="//jss:journalSpecificCoverComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:journalSpecificCoverComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:journalSpecificCoverComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Different cover for special issues?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:specialIssueCover = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:specialIssueCover = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Special issue cover comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:specialIssueCoverComment/jss:p">
                            <xsl:for-each select="//jss:specialIssueCoverComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:specialIssueCoverComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:specialIssueCoverComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Run-on items?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:runOnItems = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:runOnItems = 1">
                            <font class="rhs">
                                <xsl:text>None</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:runOnItems = 2">
                            <font class="rhs">
                                <xsl:text>Book reviews</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:runOnItems = 3">
                            <font class="rhs">
                                <xsl:text>Correspondence</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:runOnItems = 4">
                            <font class="rhs">
                                <xsl:text>Book reviews and correspondence</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:runOnItems = 5">
                            <font class="rhs">
                                <xsl:text>Other (see comments)</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Run-on items comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:runOnItemsComment/jss:p">
                            <xsl:for-each select="//jss:runOnItemsComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:runOnItemsComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:runOnItemsComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific indexing instructions</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:journalSpecificIndex = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:journalSpecificIndex = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific indexing comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:journalSpecificIndexComment/jss:p">
                            <xsl:for-each select="//jss:journalSpecificIndexComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:journalSpecificIndexComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:journalSpecificIndexComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Style Printed Issue</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of article title</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleTitle = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleTitle = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleTitle = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleTitle = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of article dochead</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleDochead = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleDochead = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleDochead = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleDochead = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of article section titles</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleSectionTitle = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleSectionTitle = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleSectionTitle = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapArticleSectionTitle = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of issue section headings first order (H1)</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH1 = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH1 = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH1 = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH1 = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of issue section headings second order (H2)</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH2 = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH2 = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH2 = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapIssueH2 = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of special issue information</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapSI = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapSI = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapSI = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:printCapSI = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Additional print style information</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:stylePrintedIssue/jss:additionalPrint/jss:p">
                            <xsl:for-each select="//jss:stylePrintedIssue/jss:additionalPrint/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:stylePrintedIssue/jss:additionalPrint=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:stylePrintedIssue/jss:additionalPrint"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Style e-issue</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of article title</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleTitle = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleTitle = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleTitle = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleTitle = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of article dochead</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleDochead = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleDochead = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleDochead = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleDochead = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of article section titles</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleSectionTitle = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleSectionTitle = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleSectionTitle = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapArticleSectionTitle = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of issue section headings first order (H1)</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH1 = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH1 = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH1 = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH1 = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of issue section headings second order (H2)</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH2 = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH2 = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH2 = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapIssueH2 = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Capitalization of special issue information</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:style-e-issue/jss:eCapSI = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapSI = 1">
                            <font class="rhs">
                                <xsl:text>sentence case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapSI = 2">
                            <font class="rhs">
                                <xsl:text>Title case</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:eCapSI = 3">
                            <font class="rhs">
                                <xsl:text>All caps</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Additional electronic style information</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:style-e-issue/jss:additionalE/jss:p">
                            <xsl:for-each select="//jss:style-e-issue/jss:additionalE/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:style-e-issue/jss:additionalE=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>

                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of disable-output-escaping="yes"
                                    select="//jss:style-e-issue/jss:additionalE"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <th class="head3" colspan="2">Additional information</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Additional journal-specific typesetting requirements</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:additionalJournalSpecificTypesetting/jss:p">
                            <xsl:for-each select="//jss:additionalJournalSpecificTypesetting/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:additionalJournalSpecificTypesetting=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of disable-output-escaping="yes"
                                    select="//jss:additionalJournalSpecificTypesetting"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            
            
        </table>
        <br/>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:editors" name="editors">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">PROOFING</th>
            </tr>

            <tr>
                <th class="head3" colspan="2">Proofing</th>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Journal-specific proofing instructions</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:journalSpecificProofing = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:journalSpecificProofing = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Send proofs to</xsl:text>
                    </font>
                </td>
                <td>
                    <font class="rhs">
                        <xsl:apply-templates
                            select="//jss:proofing/jss:proofingGeneric/jss:proofsSentTo"/>
                    </font>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Proofs send to comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:journalSpecificProofingComment/jss:p">
                            <xsl:for-each
                                select="//jss:proofing/jss:proofingGeneric/jss:journalSpecificProofingComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:journalSpecificProofingComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:proofing/jss:proofingGeneric/jss:journalSpecificProofingComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Text of PDF proof email</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 0">
                            <font class="rhs-nd">
                                <xsl:text>Option not selected</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 1">
                            <font class="rhs">
                                <xsl:text>Standard (English) text</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 2">
                            <font class="rhs">
                                <xsl:text>Use standard letter in language of article</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 3">
                            <font class="rhs">
                                <xsl:text>Standard text (French translation)</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 4">
                            <font class="rhs">
                                <xsl:text>Standard text (German translation)</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 5">
                            <font class="rhs">
                                <xsl:text>Standard text (Italian translation)</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 6">
                            <font class="rhs">
                                <xsl:text>Standard text (Spanish translation)</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofText = 7">
                            <font class="rhs">
                                <xsl:text>Non-standard (see comments)</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Text of PDF proof email comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofTextComment/jss:p">
                            <xsl:for-each
                                select="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofTextComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                            <xsl:if
                                test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofTextComment/jss:p=''">
                                <font class="rhs_nodata">
                                    <xsl:text>Contains no data</xsl:text>
                                </font>
                            </xsl:if>

                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofTextComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of
                                    select="//jss:proofing/jss:proofingGeneric/jss:changesPDFProofTextComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
			
			<tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Revised Proof Auto Email</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:proofingRevisedProofAutoEmail = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when
                            test="//jss:proofing/jss:proofingGeneric/jss:proofingRevisedProofAutoEmail = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
			
            
            <tr>
                <th class="head3" colspan="2">Proofing System</th>
            </tr>

            <xsl:choose>
                <xsl:when test="//jss:proofing/jss:proofingSystems/jss:proofingSystem">
                    <xsl:for-each select="//jss:proofing/jss:proofingSystems/jss:proofingSystem">
                        <tr>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="jss:name!=''">
                                        <font class="rhs">
                                            <xsl:value-of select="jss:name"/>
                                        </font>
                                    </xsl:when>
                                    <xsl:when test="jss:name=''">
                                        <font class="rhs_nodata">
                                            <xsl:text>Contains no data</xsl:text>
                                        </font>
                                    </xsl:when>
                                </xsl:choose>
                            </td>
                            <td>
                                <font class="lhs">
                                    <xsl:text>Reference Style:</xsl:text>
                                </font>
                                <xsl:choose>
                                    <xsl:when test="jss:referenceStyle!=''">
                                        <font class="rhs">
                                            <xsl:value-of select="jss:referenceStyle"/>
                                        </font>
                                    </xsl:when>
                                    <xsl:when test="jss:referenceStyle=''">
                                        <font class="rhs_nodata">
                                            <xsl:text>Contains no data</xsl:text>
                                        </font>
                                    </xsl:when>
                                </xsl:choose>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>Typeset Model:</xsl:text>
                                </font>
                                <xsl:choose>
                                    <xsl:when test="jss:typesetModel!=''">
                                        <font class="rhs">
                                            <xsl:value-of select="jss:typesetModel"/>
                                        </font>
                                    </xsl:when>
                                    <xsl:when test="jss:typesetModel=''">
                                        <font class="rhs_nodata">
                                            <xsl:text>Contains no data</xsl:text>
                                        </font>
                                    </xsl:when>
                                </xsl:choose>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>Version:</xsl:text>
                                </font>
                                <xsl:choose>
                                    <xsl:when test="jss:version!=''">
                                        <font class="rhs">
                                            <xsl:value-of select="jss:version"/>
                                        </font>
                                    </xsl:when>
                                    <xsl:when test="jss:version=''">
                                        <font class="rhs_nodata">
                                            <xsl:text>Contains no data</xsl:text>
                                        </font>
                                    </xsl:when>
                                </xsl:choose>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>Workflow:</xsl:text>
                                </font>
                                <xsl:choose>
                                    <xsl:when test="jss:workflow!=''">
                                        <font class="rhs">
                                            <xsl:value-of select="jss:workflow"/>
                                        </font>
                                    </xsl:when>
                                    <xsl:when test="jss:workflow=''">
                                        <font class="rhs_nodata">
                                            <xsl:text>Contains no data</xsl:text>
                                        </font>
                                    </xsl:when>
                                </xsl:choose>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>View Mode:</xsl:text>
                                </font>
                                <xsl:choose>
                                    <xsl:when test="jss:viewMode!=''">
                                        <font class="rhs">
                                            <xsl:value-of select="jss:viewMode"/>
                                        </font>
                                    </xsl:when>
                                    <xsl:when test="jss:viewMode=''">
                                        <font class="rhs_nodata">
                                            <xsl:text>Contains no data</xsl:text>
                                        </font>
                                    </xsl:when>
                                </xsl:choose>

                                <br/>
                                <font class="lhs">
                                    <xsl:text>Start Date:</xsl:text>
                                </font>
                                <font class="rhs">
                                    <xsl:value-of select="jss:dates/jss:startDate/@day"
                                        />-<xsl:value-of select="jss:dates/jss:startDate/@month"
                                        />-<xsl:value-of select="jss:dates/jss:startDate/@year"/>
                                </font>
                                <br/>
                                <font class="lhs">
                                    <xsl:text>End Date:</xsl:text>
                                </font>
                                <font class="rhs">
                                    <font class="rhs">
                                        <xsl:value-of select="jss:dates/jss:endDate/@day"
                                            />-<xsl:value-of select="jss:dates/jss:endDate/@month"
                                            />-<xsl:value-of select="jss:dates/jss:endDate/@year"/>
                                    </font>
                                </font>

                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>


            <xsl:for-each select="//jss:editor">
                <tr>
                    <td colspan="2">
                        <font class="lhs-head">
                            <xsl:text>Editor: </xsl:text>
                        </font>
                        <font class="rhs">
                            <xsl:apply-templates select="jss:editorName"/>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td width="30%">
                        <font class="lhs">
                            <xsl:text>Name of the editor</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <xsl:apply-templates select="jss:editorName"/>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Email address</xsl:text>
                        </font>
                    </td>
                    <td>
                        <font class="rhs">
                            <xsl:apply-templates select="jss:editorEmail"/>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Receives proof?</xsl:text>
                        </font>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="jss:emailProof = 0">
                                <font class="rhs-nd">
                                    <xsl:text>Option not selected</xsl:text>
                                </font>
                            </xsl:when>
                            <xsl:when test="jss:emailProof = 1">
                                <font class="rhs">
                                    <xsl:text>All proofs</xsl:text>
                                </font>
                            </xsl:when>
                            <xsl:when test="jss:emailProof = 2">
                                <font class="rhs">
                                    <xsl:text>Some proofs (see comments)</xsl:text>
                                </font>
                            </xsl:when>
                            <xsl:when test="jss:emailProof = 3">
                                <font class="rhs">
                                    <xsl:text>Never</xsl:text>
                                </font>
                            </xsl:when>
                            <xsl:when test="jss:emailProof = 4">
                                <font class="rhs">
                                    <xsl:text>bccOnly</xsl:text>
                                </font>
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>


                <tr>
                    <td>
                        <font class="lhs">
                            <xsl:text>Comment</xsl:text>
                        </font>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="jss:proofingComment/jss:p">
                                <xsl:for-each select="jss:proofingComment/jss:p">
                                    <font class="rhs">
                                        <xsl:value-of select="." disable-output-escaping="yes"/>
                                        <br/>
                                    </font>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="jss:proofingComment=''">
                                <font class="rhs_nodata">
                                    <xsl:text>Contains no data</xsl:text>
                                </font>
                            </xsl:when>

                            <xsl:otherwise>
                                <font class="rhs">
                                    <xsl:value-of select="jss:proofingComment"
                                        disable-output-escaping="yes"/>
                                </font>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:for-each>


        </table>
        <br/>
    </xsl:template>

    

    <xsl:template match="jss:journalStylesheet/jss:print" name="print">
        <table border="4" width="1000pt">
            <tr>
                <th class="head2" colspan="2">PRINT</th>
            </tr>
            <tr>
                <td width="30%">
                    <font class="lhs">
                        <xsl:text>Multiple versions?</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:multipleVersion = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:multipleVersion = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td>
                    <font class="lhs">
                        <xsl:text>Multiple versions comment</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:multipleVersionComment/jss:p">
                            <xsl:for-each select="//jss:multipleVersionComment/jss:p">
                                <font class="rhs">
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                    <br/>
                                </font>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="//jss:multipleVersionComment=''">
                            <font class="rhs_nodata">
                                <xsl:text>Contains no data</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:otherwise>
                            <font class="rhs">
                                <xsl:value-of select="//jss:multipleVersionComment"
                                    disable-output-escaping="yes"/>
                            </font>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            
			<tr>
                <td>
                    <font class="lhs">
                        <xsl:text>F300 From EWII To Printer</xsl:text>
                    </font>
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="//jss:f300FromEWIIToPrinter = 0">
                            <font class="rhs">
                                <xsl:text>No</xsl:text>
                            </font>
                        </xsl:when>
                        <xsl:when test="//jss:f300FromEWIIToPrinter = 1">
                            <font class="rhs">
                                <xsl:text>Yes</xsl:text>
                            </font>
                        </xsl:when>
                    </xsl:choose>
                </td>
            </tr>
        </table>
        <br/>
    </xsl:template>

    

    



<xsl:template match="jss:change">
<font color="blue" size="+2" style="background-color:yellow;"><xsl:apply-templates/></font>
</xsl:template>

</xsl:stylesheet>
