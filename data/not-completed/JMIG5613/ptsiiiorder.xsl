<?xml version="1.0" encoding="UTF-8"?>
<!--
     version 1.18  2021-10-08
     Copyright (c) 2011–2021 Elsevier B.V.
-->
<!--
    v1.18  2021-10-08 [PTS release 2021.? (CR 4818)]
    Changes with respect to v1.17
    - Added element 'milestone'
    - Reformatted whitespace using Oxygen
    - Added some comments
    - Removed todo-list from code

    v1.17  17 October 2018 [PTS release 2018.7 (CR 2687)]
    Changes with respect to v1.16
    - Displaying article numbers for more row types

    v1.16  25 June 2018  [PTS release 2018.5 (CR 2648)]
    Changes with respect to v1.15
    - Displaying new element bam-stage

    v1.15  11 April 2018  [PTS release 2018.3 (CR 2631)]
    Changes with respect to v1.14
    - Displaying article numbers in issue content (all modes)
    - Changed template insert-pages

    v1.14  7 June 2017  [PTS release 2017.2 (CR 2492)]
    Changes with respect to v1.13
    - Displaying new element item-info/issn

    v1.13  4 May 2017  [PTS release 2017.1 (CR 2428)]
    Changes with respect to v1.13
    - Added new step S300-F300RESUPPLY
    - Displaying new element item-info/revised-proof

    v1.12  10 October 2016  [PTS release 2016.5 (CR 2410)]
    Changes with respect to v1.11
    - Displaying new executor of type COMPOSITOR (two templates adapted)
    - Displaying new elements cpc and in-scope-cpc
    - Removed the display of "Offprint payments received" (row)

    v1.11  26 January 2016  [PTS release 2016.1 (CR 2352)]
    Changes with respect to v1.10
    - Displaying new element print-details/split-print-run

    v1.10  7 April  [PTS release 2015.2]
    Changes with respect to v1.9
    - Displaying new element assigned-to-issue/issn (two templates adapted)
    - Displaying new element item/article-number

    v1.9  28 August 2014 [PTS release 2014.3]
    Changes with respect to v1.8
    - Displaying new element figure/graphical-abstract

    v1.8  3 January 2014 [PTS release 2014.1]
    Changes with respect to v1.7
    * display of language, shifting the other cells in the first "column" downwards.
    * display of corrections-uri.
    * needed to rebuild the stucture of the item-info table: no tables in tables.
      simply 4 columns with colspans where needed
      also needed to correct the table and columns widths of other tables,
      using embedded CSS instead of td@width (deprecated in HTML4.01 and later)

    v1.7  11 December 2013  [PTS release 2013.3]
    Changes with respect to v1.6:
    - Displaying element employer in item-info
    - Displaying new elements paid-ads, license
    - Changed template insert-refers-to-document

    v1.6  25 June 2013  [PTS release 2013.2]
    Changes with respect to v1.5:
    - Displaying new element orcid

    v1.5  9 July 2012  [PTS release 2012.2]
    Changes with respect to v1.4:
    - Displaying new elements item-info/crossmark and row/crossmark

    v1.4  15 March 2012  [PTS release 2012.1]
    Changes with respect to v1.3:
    - Displaying new general-info/isbn element

    v1.3  2 December 2011  [PTS release 2011.3]
    Changes with respect to v1.2:
    - Displaying new refers-to-document subelements jid and aid

    v1.2  1 June 2011  [PTS release 2011.2]
    Changes with respect to v1.1:
    - Displaying new special-issue/si-editors element

    v1.1  27 April 2011  [PTS release 2011.1]
    Changes with respect to v1.0:
    - Displaying new special-issue/alt-title and special-issue/alt-subtitle elements
    - Displaying special issue information in print-bind orders
    - Displaying (new) cover info elements
    - Catered for colour-fig-nr-print_ROW elements

    v1.0  19 January 2011  [PTS release 2010.3]
    Stylesheet to style PTSIII Orders
    Based on the three PTSIII stylesheets (coversheet.xsl, issue.xsl, print.xsl)
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Setting ouput -->
    <xsl:output encoding="utf-8" method="html"/>

    <!-- Setting variables -->
    <xsl:variable name="ENDASH">
        <xsl:text>&#08211;</xsl:text>
    </xsl:variable>
    <xsl:variable name="GROUPSEP">
        <xsl:text>; </xsl:text>
    </xsl:variable>

    <xsl:variable name="ORDER">
        <!-- Possible values for stage/@step:
             RSVP | CU | PROOF | S5 | S100 | S200 | S250 | S300 | P100 | Q300 | S350 | F300 |
             S5RESUPPLY | S100RESUPPLY | S200RESUPPLY | S250RESUPPLY | S300RESUPPLY |
             P100RESUPPLY | Q300RESUPPLY | F300RESUPPLY | S300-F300RESUPPLY |
             FINALXML | FINALXMLRESUPPLY |
             PRINT | OFFPRINTS | E-OFFPRINT | BIND | ISSUE-LABELS |
             ITEM-OFFPRINTS | SEND-ITEM-OFFPRINTS |
             SEND-ISSUE | SEND-OFF-SYSTEM-ISSUE | SEND-OFFPRINTS |
             PUBACC | PUBACCRESUPPLY
        -->
        <xsl:choose>
            <xsl:when test="//stage[@step = 'P100' or @step = 'P100RESUPPLY' or @step = 'S300' or @step = 'S300RESUPPLY' or @step = 'F300' or @step = 'F300RESUPPLY' or @step = 'Q300']">
                <xsl:value-of select="'ISSUE'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'S250' or @step = 'S250RESUPPLY' or @step = 'S300-F300RESUPPLY']">
                <xsl:value-of select="'S250'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'OFFPRINTS']">
                <xsl:value-of select="'OFFPRINTS'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'SEND-OFFPRINTS']">
                <xsl:value-of select="'SEND-OFFPRINTS'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'ITEM-OFFPRINTS']">
                <xsl:value-of select="'ITEM-OFFPRINTS'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'SEND-ITEM-OFFPRINTS']">
                <xsl:value-of select="'SEND-ITEM-OFFPRINTS'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'PRINT' or @step = 'BIND']">
                <xsl:value-of select="'PRINT-BIND'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'ISSUE-LABELS']">
                <xsl:value-of select="'ISSUE-LABELS'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'SEND-ISSUE']">
                <xsl:value-of select="'SEND-ISSUE'"/>
            </xsl:when>
            <xsl:when test="//stage[@step = 'SEND-OFF-SYSTEM-ISSUE']">
                <xsl:value-of select="'SEND-OFF-SYSTEM-ISSUE'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'OTHER'"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:variable>

    <!-- 
		Matching Root 
	-->
    <xsl:template match="/">
        <xsl:apply-templates select="orders"/>
    </xsl:template>

    <!-- 
		Matching top element orders 
	-->
    <xsl:template match="orders">
        <html>
            <head>
                <title>PTSIII Order</title>
                <xsl:call-template name="insert-javascript"/>
                <xsl:call-template name="insert-style"/>
            </head>
            <!-- <body> -->
            <body style="font-family:'Arial Unicode MS'" onload="expColl(part0,expanded0,document.getElementById('xmlcode'))">
                <xsl:apply-templates/>
                <xsl:call-template name="insert-xml-code"/>
            </body>
        </html>
    </xsl:template>

    <!-- 
		Matching element order 
	-->
    <xsl:template match="order">
        <!-- 
				Choose order-title  
		-->
        <xsl:variable name="order-title">
            <xsl:choose>
                <xsl:when test="item-info">
                    <xsl:choose>
                        <xsl:when test="$ORDER = 'ITEM-OFFPRINTS'">
                            <xsl:text>ITEM OFFPRINTS ORDER</xsl:text>
                        </xsl:when>
                        <xsl:when test="$ORDER = 'SEND-ITEM-OFFPRINTS'">
                            <xsl:text>SEND ITEM OFFPRINTS ORDER</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>COVERSHEET</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="issue-info">
                    <xsl:choose>
                        <xsl:when test="$ORDER = 'ISSUE'">
                            <xsl:text>ISSUE PAGINATION SHEET</xsl:text>
                        </xsl:when>
                        <xsl:when test="$ORDER = 'OFFPRINTS'">
                            <xsl:text>OFFPRINTS SHEET</xsl:text>
                        </xsl:when>
                        <xsl:when test="$ORDER = 'SEND-OFFPRINTS'">
                            <xsl:text>SEND OFFPRINTS SHEET</xsl:text>
                        </xsl:when>
                        <xsl:when test="$ORDER = 'SEND-ISSUE'">
                            <xsl:text>SEND ISSUE</xsl:text>
                        </xsl:when>
                        <xsl:when test="$ORDER = 'SEND-OFF-SYSTEM-ISSUE'">
                            <xsl:text>SEND OFF-SYSTEM ISSUE</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>ISSUE SHEET</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="print-bind-info">
                    <xsl:text>PRINT/BIND ORDER</xsl:text>
                </xsl:when>
                <xsl:when test="issue-labels-info">
                    <xsl:text>ISSUE-LABELS INFO</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <h2>
            <xsl:value-of select="$order-title"/>
        </h2>
        <p>
            <table width="100%">
                <tr>
                    <td style="width:20%">
                        <xsl:text>Date:</xsl:text>
                    </td>
                    <td style="width:80%">
                        <xsl:apply-templates select="time"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Purchase order number:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="po-number"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Due date:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="due-date"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Production site:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="prod-site"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>OPCO:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="opco"/>
                    </td>
                </tr>
                <xsl:if test="item-info/issn">
                    <tr>
                        <td>
                            <xsl:text>ISSN:</xsl:text>
                        </td>
                        <td>
                            <xsl:apply-templates select="item-info/issn"/>
                        </td>
                    </tr>
                </xsl:if>
                <tr>
                    <td>
                        <xsl:text>Stage:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="stage"/>
                    </td>
                </tr>
                <xsl:call-template name="insert-executors"/>
                <xsl:if test="//hold-until-date">
                    <tr>
                        <td colspan="2">
                            <b>
                                <xsl:text>Held issue: DO NOT DISPATCH UNTIL </xsl:text>
                                <xsl:apply-templates select="//hold-until-date"/>
                            </b>
                        </td>
                    </tr>
                </xsl:if>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <p>
            <xsl:choose>
                <xsl:when test="$ORDER = 'ITEM-OFFPRINTS' or $ORDER = 'SEND-ITEM-OFFPRINTS'">
                    <xsl:apply-templates select="item-info" mode="abp"/>
                </xsl:when>
                <xsl:when test="$ORDER = 'S250'">
                    <xsl:apply-templates select="item-info"/>
                    <!-- <xsl:apply-templates select="item-info" mode="s250"/> -->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="item-info"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="issue-info"/>
            <xsl:apply-templates select="print-bind-info"/>
            <xsl:apply-templates select="issue-labels-info"/>
        </p>
    </xsl:template>

    <!-- item info -->

    <xsl:template match="item-info">
        <!-- Table with part of item information. Layout:

            01 | jid / aid
            02 | pii                      no-mns-pages
            03 | doi                      no-phys-figs
            04 | article-number           no-bw-figs
            05 | pit                      no-colour-figs
            06 | prd-type-as-sent         no-web-colour-figs
            07 | milestone                no-e-components
            08 | version nr               
            09 | language                 batch
            10 | CrossMark                refers-to-document
            11 | copyright status
            12 | employer
            13 | copyright received date  e-submission-item-nr
            14 | license                  eo-item-nr
            15 | embargo                  editor
            16 | embargo-until-stage      received date
            17 | righthand start          revised date
            18 | online publication date  accept date
            19 | online version           cpc
            20 | corrections              in-scope-cpc
            21 | corrections-uri          bam-stage
            22 | revised-proof
            23 | offprint payment
        -->
        <p>
            <!-- First part of item information -->
            <table width="100%" cols="4">
                <tr><!-- row 1 : jid / aid -->
                    <td style="width:20%">
                        <xsl:text>Item:</xsl:text>
                    </td>
                    <td colspan="3">
                        <xsl:call-template name="insert-jid-aid"/>
                    </td>
                </tr>
                <tr><!-- row 2 : pii                       | no-mns-pages-->
                    <td style="width:20%">
                        <xsl:text>PII:</xsl:text>
                    </td>
                    <td style="width:30%">
                        <xsl:apply-templates select="pii"/>
                    </td>
                    <td style="width:20%">
                        <xsl:text>Nr of ms pages:</xsl:text>
                    </td>
                    <td style="width:30%">
                        <xsl:apply-templates select="no-mns-pages"/>
                    </td>
                </tr>
                <tr><!-- row 3 : doi                       | no-phys-figs-->
                    <td>
                        <xsl:text>DOI:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="doi"/>
                    </td>
                    <td>
                        <xsl:text>Nr of figures:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-phys-figs"/>
                    </td>
                </tr>
                <tr><!-- row 4 : article-number            | no-bw-figs -->
                    <td>
                        <xsl:text>Article number:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:text>Nr of B/W figures:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-bw-figs"/>
                    </td>
                </tr>
                <tr><!-- row 5 : pit                       | no-colour-figs -->
                    <td>
                        <xsl:text>PIT:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:text>Nr of printed colour figures:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                </tr>
                <tr><!-- row 6 : prd-type-as-sent          | no-web-colour-figs -->
                    <td>
                        <xsl:text>Production type as sent:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type-as-sent"/>
                    </td>
                    <td>
                        <xsl:text>Nr of web colour figures:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-web-colour-figs"/>
                    </td>
                </tr>
                <tr><!-- row 7 : milestone                 | no-e-components -->
                    <td>
                        <xsl:text>Milestone:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="milestone"/>
                    </td>
                    <td>
                        <xsl:text>Nr of e-components:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-e-components"/>
                    </td>                    
                </tr>                
                <tr><!-- row 8 : version nr                -->
                    <td>
                        <xsl:text>Version nr:</xsl:text>
                    </td>
                    <td colspan="3">
                        <xsl:apply-templates select="version-no"/>
                    </td>
                </tr>
                <tr><!-- row 9 : language                  | batch -->
                    <td>
                        <xsl:text>Language:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="language"/>
                    </td>
                    <td>
                        <xsl:text>Batch:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="batch"/>
                    </td>
                </tr>
                <tr><!-- row 10 : CrossMark                | refers-to-document -->
                    <td>
                        <xsl:text>CrossMark:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="crossmark"/>
                    </td>
                    <td>
                        <xsl:text>Refers to:</xsl:text>
                    </td>
                    <td>
                        <xsl:call-template name="insert-refers-to-document">
                            <xsl:with-param name="type">
                                <xsl:value-of select="'item'"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </td>
                </tr>
                <tr><!-- row 11 : copyright status         -->
                    <td>
                        <xsl:text>Copyright status:</xsl:text>
                    </td>
                    <td colspan="3">
                        <xsl:apply-templates select="copyright-status"/>
                    </td>
                </tr>
                <tr><!-- row 12 : employer                 -->
                    <td>
                        <xsl:text>Employer:</xsl:text>
                    </td>
                    <td colspan="3">
                        <xsl:apply-templates select="employer"/>
                    </td>
                </tr>
                <tr><!-- row 13 : copyright received date  | e-submission-item-nr -->
                    <td>
                        <xsl:text>Copyright received date:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="copyright-recd-date"/>
                    </td>
                    <td>
                        <xsl:text>E submission item nr:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="e-submission-item-nr"/>
                    </td>
                </tr>
                <tr><!-- row 14 : license                  | eo-item-nr-->
                    <td>
                        <xsl:text>License:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="license"/>
                    </td>
                    <td>
                        <xsl:text>EO item nr:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="eo-item-nr"/>
                    </td>
                </tr>
                <tr><!-- row 15 :  embargo                 | editor-->
                    <td>
                        <xsl:text>Embargo:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="embargo"/>
                    </td>
                    <td>
                        <xsl:text>Editor:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="editor"/>
                    </td>
                </tr>
                <tr><!-- row 16 : embargo-until-stage      | received date -->
                    <td>
                        <xsl:text>Embargo until stage:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="embargo-until-stage"/>
                    </td>
                    <td>
                        <xsl:text>Received date:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="received-date"/>
                    </td>
                </tr>
                <tr><!-- row 17 : righthand start          | revised date -->
                    <td>
                        <xsl:text>Right-hand start:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="righthand-start"/>
                    </td>
                    <td>
                        <xsl:text>Revised date:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="revised-date"/>
                    </td>
                </tr>
                <tr><!-- row 18 : online publication date  | accept date -->
                    <td>
                        <xsl:text>Online publication date:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="online-publ-date"/>
                    </td>
                    <td>
                        <xsl:text>Acceptance date:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="accept-date"/>
                    </td>
                </tr>
                <tr><!-- row 19 : online version           | cpc -->
                    <td>
                        <xsl:text>Online version:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="online-version"/>
                    </td>
                    <td>
                        <!-- Centralized Page Composition -->
                        <xsl:text>CPC:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="cpc"/>
                    </td>
                </tr>
                <tr><!-- row 20 : corrections              | in-scope-cpc-->
                    <td>
                        <xsl:text>Corrections:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="corrections"/>
                    </td>
                    <td>
                        <xsl:text>In scope for CPC:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="in-scope-cpc"/>
                    </td>
                </tr>
                <tr><!-- row 21 : corrections-uri          | bam-stage -->
                    <td>
                        <xsl:text>Corrections-uri:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="corrections-uri"/>
                    </td>
                    <td>
                        <xsl:text>bam:stage:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="parent::node()/bam-stage"/>
                    </td>
                </tr>
                <tr><!-- row 22 : revised-proof             -->
                    <td>
                        <xsl:text>Revised proof required:</xsl:text>
                    </td>
                    <td colspan="3">
                        <xsl:apply-templates select="revised-proof"/>
                    </td>
                </tr>
                <tr><!-- row 23 : offprint payment          -->
                    <td>
                        <xsl:text>Offprint payment:</xsl:text>
                    </td>
                    <td colspan="3">
                        <xsl:call-template name="insert-offprint-payment"/>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <p>
            <!-- Second part of item information -->
            <table width="100%">
                <tr>
                    <td style="width:20%">
                        <xsl:text>Item title:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Item group:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-group"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Item group description:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-group-description"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Section:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="section"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Dochead:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="dochead"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Physical figures:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="physical-figures"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>E-components:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="e-components"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Funding:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="funding"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>First author:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="first-author"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Corresponding author:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author"/>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <xsl:if test="$ORDER = 'S250'">
            <xsl:apply-templates select="assigned-to-issue" mode="s250"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
        <!-- Last part of item information -->
        <xsl:if test="item-remarks">
            <xsl:apply-templates select="item-remarks"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
    </xsl:template>

    <!-- 
		Template matching element item-info (for which there are 2 modes) 
		*	abp
		*	s250
	-->
    <xsl:template match="item-info" mode="abp">
        <!-- Layout:

			Issue information

			Issue PII                Paper type interior
			ISSN                     Paper type cover
			Effect cover date        Trimmed size
			Volume/Issue             Head margin
			S250 sequence nr         Back margin
			Pages                    Typeset model

			Item information

            jid / aid
            pii
            article number
            doi
            pit
            Nr of PDF pages
            Nr of paid offprints
            Covers
            Offprint type
            Nr printed colour figures

            Delivery details

            Corresponding author
		-->
        <xsl:apply-templates select="assigned-to-issue"/>
        <xsl:call-template name="insert-hrule"/>
        <h4>Item information</h4>
        <p>
            <table width="100%">
                <tr>
                    <td style="width:20%">
                        <xsl:text>Item:</xsl:text>
                    </td>
                    <td style="width:80%">
                        <xsl:call-template name="insert-jid-aid"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Item title:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>PII:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pii"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Article number:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>DOI:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="doi"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>PIT:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Nr of PDF pages:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Nr of paid offprints:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-paid"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Covers:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="covers"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Offprint type:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="offprint-type"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Nr of printed colour figures:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <h4>Delivery details</h4>
        <p>
            <table width="50%">
                <tr>
                    <td>
                        <xsl:text>Corresponding author:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author"/>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <!-- Last part of item information -->
        <xsl:if test="item-remarks">
            <xsl:apply-templates select="item-remarks"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="item-info" mode="s250">
        <!-- Layout:

			Issue information

			Issue PII
			ISSN
			Effect cover date
			Volume/Issue
			S250 sequence nr
			Pages
			Typeset model

			Item information

			jid / aid
			pii
			article number
			doi
			pit
			Nr of PDF pages
			Nr of paid offprints
			Covers
			Offprint type
			Nr printed colour figures

			Delivery details

			Corresponding author
		-->
        <xsl:apply-templates select="assigned-to-issue" mode="s250"/>
        <xsl:call-template name="insert-hrule"/>
        <h4>Item information</h4>
        <p>
            <table width="100%">
                <tr>
                    <td style="width:20%">
                        <xsl:text>Item:</xsl:text>
                    </td>
                    <td>
                        <xsl:call-template name="insert-jid-aid"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Item title:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>PII:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pii"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Article number:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>DOI:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="doi"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>PIT:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Nr of PDF pages:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Nr of paid offprints:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-paid"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Covers:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="covers"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Offprint type:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="offprint-type"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Nr of printed colour figures:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <h4>Delivery details</h4>
        <p>
            <table width="50%">
                <tr>
                    <td>
                        <xsl:text>Corresponding author:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author"/>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <!-- Last part of item information -->
        <xsl:if test="item-remarks">
            <xsl:apply-templates select="item-remarks"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
    </xsl:template>

    <!-- 
		Template matching element issue info
	-->
    <!-- issue info -->

    <xsl:template match="issue-info">
        <!-- Table with part of issue information. Layout:

           1 | jid                      | journal title
           2 | volume/issue             | journal nr
           3 | pii                      | issn
           4 | version nr               | isbn
           5 | effect cover date        | cover info
           6 | cover date printed       | special issue
           7 | zero warehousing *       |
           8 | article based publishing | prelim pages
           9 | embargo                  | interior pages
          10 | issue production type    | extra pages
          11 | buffer status            | insert pages
          12 | hold-until-date          | backmatter pages
          13 |                          | nr pages print
          14 | paper type interior      | nr pages web
          15 | paper type cover         | nr pages total
          16 | cover finishing          | nr pages blank
          17 | cover print type         | nr pages adverts
          18 | print type               | typeset model
          19 | binding type             | right-hand start
          20 | offprint type            | paid-ads
          21 | trimmed size             | corrections
          22 | head margin
          23 | back margin
          24 | issue weight
          25 | spine width

            * Only for SEND-ISSUE and SEND-OFF-SYSTEM-ISSUE
        -->
        <p>
            <table width="100%">
                <tr>
                    <td width="50%">
                        <table width="100%">
                            <tr>
                                <td>
                                    <xsl:text>Journal:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/jid"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Volume/issue:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-volume-issue">
                                        <xsl:with-param name="vol-from">
                                            <xsl:value-of select="general-info/vol-from"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="vol-to">
                                            <xsl:value-of select="general-info/vol-to"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="iss-from">
                                            <xsl:value-of select="general-info/iss-from"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="iss-to">
                                            <xsl:value-of select="general-info/iss-to"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="supp">
                                            <xsl:value-of select="general-info/supp"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>PII:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/pii"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Version nr:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/version-no"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Effect cover date:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/effect-cover-date"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover date printed:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/cover-date-printed"/>
                                </td>
                            </tr>
                            <xsl:if test="$ORDER = 'SEND-ISSUE' or $ORDER = 'SEND-OFF-SYSTEM-ISSUE'">
                                <tr>
                                    <td>
                                        <xsl:text>Zero warehousing:</xsl:text>
                                    </td>
                                    <td>
                                        <xsl:apply-templates select="general-info/zero-warehousing"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <tr>
                                <td>
                                    <xsl:text>Article based publishing:</xsl:text>
                                </td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="general-info/article-based-publishing">
                                            <xsl:apply-templates select="general-info/article-based-publishing"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>no</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Embargo:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/embargo"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Issue production type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/issue-production-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Buffer status:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/buffer-status"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Hold-until-date:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/hold-until-date"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Paper type interior:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/paper-type-interior"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Paper type cover:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/paper-type-cover"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover finishing:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/cover-finishing"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover print type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/cover-print-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Print type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/print-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Binding type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/binding-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Offprint type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/offprint-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Trimmed size:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/trimmed-size"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Head margin:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/head-margin"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Back margin:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/back-margin"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Issue weight:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/issue-weight"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Spine width:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/spine-width"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        <table width="100%">
                            <tr>
                                <td>
                                    <xsl:text>Journal title:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/journal-title"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Journal nr:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/journal-no"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>ISSN:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/issn"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>ISBN:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/isbn"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover info:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-cover-info"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Special issue:</xsl:text>
                                </td>
                                <td>
                                    <a href="#specialissue">
                                        <xsl:apply-templates select="general-info/special-issue/special-issue-id"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Prelim pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-pages">
                                        <xsl:with-param name="type" select="'PRELIM'"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Interior pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-pages">
                                        <xsl:with-param name="type" select="'INTERIOR'"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Extra pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-pages-from-rows">
                                        <xsl:with-param name="rows" select="issue-content/row[prefix = 'EX']"/>
                                        <xsl:with-param name="type" select="'EX'"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Insert pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-pages-from-rows">
                                        <xsl:with-param name="rows" select="issue-content/row[prefix = 'IN']"/>
                                        <xsl:with-param name="type" select="'IN'"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Backmatter pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-pages">
                                        <xsl:with-param name="type" select="'BACKMATTER'"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr pages print:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-print"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr pages web:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-web"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr pages total:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-total"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr pages blank:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-blank"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr pages adverts:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-adverts"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Typeset model:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/typeset-model"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Right-hand start:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/righthand-start"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Paid ads:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/paid-ads"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Corrections:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/corrections"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <!-- issue content -->
        <xsl:choose>
            <xsl:when test="$ORDER = 'ISSUE'">
                <xsl:apply-templates select="issue-content" mode="ISSUE"/>
            </xsl:when>
            <xsl:when test="$ORDER = 'OFFPRINTS'">
                <xsl:apply-templates select="issue-content" mode="OFFPRINTS"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="issue-content" mode="OTHER"/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- issue remarks -->
        <xsl:if test="issue-remarks/issue-remark[remark-type != 'Advert details' and remark-type != 'ADV']">
            <xsl:apply-templates select="issue-remarks"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
        <!-- special issue info -->
        <xsl:if test="general-info/special-issue">
            <xsl:apply-templates select="general-info/special-issue"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
        <!-- advert details -->
        <xsl:if test="issue-remarks/issue-remark[remark-type = 'Advert details' or remark-type = 'ADV']">
            <xsl:call-template name="insert-advert-details"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="print-bind-info">
        <!-- Table with information from general-info and from print-details. Layout:

            issn                    nr of copies
            jid                     nr of author copies
            journal title           nr of mark/prom copies
            journal nr              nr of voucher copies
            volume/issue            nr of grace copies
            cover date printed      nr of extra copies
            cover info              total print run
            special issue
            zero warehousing        nr pages prelim
                                    nr pages interior
            paper type interior     nr pages extra
            paper type cover        nr pages insert
            cover finishing         nr pages backmatter
            cover print type        nr pages total
            print type              nr pages blank
            binding type
            offprint type           nr pages cover
            typeset model           nr pages adverts
            right-hand start        nr pages coated
            issue weight
            spine width             out-sort
            trimmed size            insert
            head margin             split-print-run
            back margin
        -->
        <p>
            <table width="100%">
                <tr>
                    <td width="50%">
                        <table width="100%">
                            <tr>
                                <td>
                                    <xsl:text>ISSN:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/issn"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Journal:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/jid"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Journal title:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/journal-title"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Journal nr:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/journal-no"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Volume/issue:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-volume-issue">
                                        <xsl:with-param name="vol-from">
                                            <xsl:value-of select="general-info/vol-from"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="vol-to">
                                            <xsl:value-of select="general-info/vol-to"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="iss-from">
                                            <xsl:value-of select="general-info/iss-from"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="iss-to">
                                            <xsl:value-of select="general-info/iss-to"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="supp">
                                            <xsl:value-of select="general-info/supp"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover date printed:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/cover-date-printed"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover info:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-cover-info"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Special issue:</xsl:text>
                                </td>
                                <td>
                                    <a href="#specialissue">
                                        <xsl:apply-templates select="general-info/special-issue/special-issue-id"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Zero warehousing:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/zero-warehousing"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Paper type interior:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/paper-type-interior"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Paper type cover:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/paper-type-cover"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover finishing:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/cover-finishing"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover print type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/cover-print-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Print type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/print-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Binding type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/binding-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Offprint type:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/offprint-type"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Typeset model:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/typeset-model"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Right-hand start:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/righthand-start"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Issue weight:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/issue-weight"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Spine width:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/spine-width"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Trimmed size:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/trimmed-size"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Head margin:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/head-margin"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Back margin:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/back-margin"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        <table width="100%">
                            <tr>
                                <td>
                                    <xsl:text>Nr of copies:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-copies"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of author copies:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-author-copies"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of mark/prom copies:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-mark-prom-copies"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of voucher copies:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-voucher-copies"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of grace copies:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-grace-copies"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Total nr of extra copies</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-extra-copies"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Total print run:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/total-print-run"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of prelim pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-prelims"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of interior pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-interior"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of extra pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-extra"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of insert pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-insert"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Nr of backmatter pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-bm"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Total nr of pages printed:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-print"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Total nr of blank pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-blank"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Cover:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-pages-cover"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Adverts:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="general-info/no-pages-adverts"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Coated:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/no-pages-coated"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Out-sort:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/out-sort"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Insert:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/insert"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Split print run:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="print-details/split-print-run"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </p>
        <xsl:call-template name="insert-hrule"/>
        <!-- issue content -->
        <xsl:choose>
            <xsl:when test="$ORDER = 'PRINT-BIND'">
                <xsl:apply-templates select="issue-content" mode="PRINT-BIND"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="issue-content" mode="OTHER"/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- issue remarks -->
        <xsl:if test="issue-remarks/issue-remark[remark-type != 'Advert details' and remark-type != 'ADV']">
            <xsl:apply-templates select="issue-remarks"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
        <!-- special issue info -->
        <xsl:if test="general-info/special-issue">
            <xsl:apply-templates select="general-info/special-issue"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
        <!-- advert details -->
        <xsl:if test="issue-remarks/issue-remark[remark-type = 'Advert details' or remark-type = 'ADV']">
            <xsl:call-template name="insert-advert-details"/>
            <xsl:call-template name="insert-hrule"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="issue-labels-info">
        <xsl:apply-templates select="issue-labels-details"/>
        <xsl:call-template name="insert-hrule"/>
    </xsl:template>

    <!-- / issue info -->

    <!-- Templates matching issue-content in 4 different modes =======
		Templates matching issue-content in different modes
		There are 4 modes
		*	ISSUE
		*	OFFPRINTS
		*	PRINT-BIND
		*	OTHER (doesn't do anything)
	-->
    <xsl:template match="issue-content" mode="ISSUE">
        <!--
			table
			26 columns
			content selected from //issue-content/row
		-->
        <p>
            <table width="100%">
            <!--
			 Set header
            -->
                <tr>
                    <th>
                        <xsl:text>Ms ID</xsl:text>
                    </th>
                    <th>
                        <xsl:text>PII</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Ver. nr</xsl:text>
                    </th>
                    <th>
                        <xsl:text>CsMk</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Title</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Copyrt type</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Corr. author</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Ed. office nr</xsl:text>
                    </th>
                    <th>
                        <xsl:text>PIT</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Prod. type</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Pg from</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Pg to</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Art. nr</xsl:text>
                    </th>
                    <th>
                        <xsl:text># pgs</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Web pg from</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Web pg to</xsl:text>
                    </th>
                    <th>
                        <xsl:text>S250 seq. nr</xsl:text>
                    </th>
                    <th>
                        <xsl:text>CPC</xsl:text>
                    </th>
                    <th>
                        <xsl:text>E-suite</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Clr</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Print col. graph. nrs</xsl:text>
                    </th>
                    <th>
                        <xsl:text># e- comps</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Onl. pub. date</xsl:text>
                    </th>
                    <th>
                        <xsl:text>License</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Copyrt recd date</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Remark</xsl:text>
                    </th>
                </tr>
                <!-- 
					Fetch rows
				-->
                <xsl:apply-templates select="row" mode="ISSUE"/>
            </table>
            <xsl:call-template name="insert-hrule"/>
        </p>
    </xsl:template>

    <xsl:template match="issue-content" mode="OFFPRINTS">
        <!--
			table
			20 columns
			content selected from //issue-content/row
		-->
        <p>
            <table width="100%">
                <tr>
                    <th>
                        <xsl:text>Ms ID</xsl:text>
                    </th>
                    <th>
                        <xsl:text>PII</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Corr. author</xsl:text>
                    </th>
                    <th>
                        <xsl:text>PIT</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Prod. type</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Pg from</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Pg to</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Art. nr</xsl:text>
                    </th>
                    <th>
                        <xsl:text># pgs</xsl:text>
                    </th>
                    <th>
                        <xsl:text># offpr. paid</xsl:text>
                    </th>
                    <th>
                        <xsl:text># offpr. free</xsl:text>
                    </th>
                    <th>
                        <xsl:text># offpr. total</xsl:text>
                    </th>
                    <th>
                        <xsl:text># issues paid</xsl:text>
                    </th>
                    <th>
                        <xsl:text># issues free</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Cvrs</xsl:text>
                    </th>
                    <th>
                        <xsl:text>E-suite</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Clr</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Offpr. paym. received</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Pg charge</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Remark</xsl:text>
                    </th>
                </tr>
                <!-- 
					Fetch rows
				-->
                <xsl:apply-templates select="row" mode="OFFPRINTS"/>
            </table>
            <xsl:call-template name="insert-hrule"/>
        </p>
    </xsl:template>

    <xsl:template match="issue-content" mode="PRINT-BIND">
        <!-- 
        	table, 
        	15 columns, 
        	content selected from //issue-content/row 
        -->
        <p>
            <table width="100%">
                <!--
				set header
			-->
                <tr>
                    <th>
                        <xsl:text>Ms ID</xsl:text>
                    </th>
                    <th>
                        <xsl:text>PII</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Title</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Copyrt type</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Corr. author</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Ed. office nr</xsl:text>
                    </th>
                    <th>
                        <xsl:text>PIT</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Prod. type</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Pg from</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Pg to</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Art. nr</xsl:text>
                    </th>
                    <th>
                        <xsl:text># pgs</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Clr</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Print col. graph. nrs</xsl:text>
                    </th>
                    <th>
                        <xsl:text>Remark</xsl:text>
                    </th>
                </tr>
                <!-- 
                    Fetch rows
                -->
                <xsl:apply-templates select="row" mode="PRINT-BIND"/>
            </table>
            <xsl:call-template name="insert-hrule"/>
        </p>
    </xsl:template>

    <xsl:template match="issue-content" mode="OTHER">
        <!-- 
			<xsl:call-template name="insert-hrule"/> 
		-->
    </xsl:template>

    <!-- Templates matching rows in 3 different modes ===============
		There are 3 modes
		*	ISSUE
		*	OFFPRINTS
		*	PRINT-BIND
	-->
    <xsl:template match="row" mode="ISSUE">
        <!-- 
			tr, 
			27 columns, 
			empty td's depending on row/@type
			Ther are 8 types:
			a	'ce'
			b	'non-ce'
			c	'blank'
			d	'advert'
			e	'remark'
			f	'h1' or 'he'
			g	'h2'
			h	'h3' or 'h4'
		-->
        <xsl:choose>
            <xsl:when test="@type = 'ce'">
                <tr>
                    <td>
                        <xsl:apply-templates select="aid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pii"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="version-no"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="crossmark"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="copyright-status"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author" mode="name-only"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="eo-item-nr"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="first-e-page"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="last-e-page"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="s250-sequence-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="cpc"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="e-suite"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="colour-fig-nr-print"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-e-components"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="online-publ-date"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="license"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="copyright-recd-date"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="remark"/>
                    </td>
                </tr>
                <xsl:if test="refers-to-document">
                    <tr>
                        <td colspan="8">
                            <i>
                                <xsl:text>&#x2014;&#xA0;Refers to document(s): </xsl:text>
                            </i>
                            <xsl:call-template name="insert-refers-to-document"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:when>
            <xsl:when test="@type = 'non-ce'">
                <tr>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="version-no"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="crossmark"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="copyright-status"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author" mode="name-only"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="eo-item-nr"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="cpc"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="e-suite"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="colour-fig-nr-print"/>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="remark"/>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'blank'">
                <tr>
                    <td/>
                    <td>
                        <xsl:text>Blank page</xsl:text>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td/>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'advert'">
                <tr>
                    <td>
                        <xsl:apply-templates select="aid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pii"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="version-no"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="crossmark"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="copyright-status"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author" mode="name-only"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="eo-item-nr"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="e-suite"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                    <td>
                        <xsl:call-template name="insert-offprint-payment"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="colour-fig-nr-print"/>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="remark"/>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'remark'">
                <tr>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="item-title"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="pit"/>
                        </i>
                    </td>
                    <td>
                        <i>
                            <xsl:apply-templates select="prd-type"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'h1' or @type = 'he'">
                <tr>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <b>
                            <xsl:apply-templates select="item-title"/>
                        </b>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <b>
                            <xsl:apply-templates select="pit"/>
                        </b>
                    </td>
                    <td>
                        <b>
                            <xsl:apply-templates select="prd-type"/>
                        </b>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'h2'">
                <tr>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <u>
                            <xsl:apply-templates select="item-title"/>
                        </u>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <u>
                            <xsl:apply-templates select="pit"/>
                        </u>
                    </td>
                    <td>
                        <u>
                            <xsl:apply-templates select="prd-type"/>
                        </u>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'h3' or @type = 'h4'">
                <tr>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="item-title"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="pit"/>
                        </i>
                    </td>
                    <td>
                        <i>
                            <xsl:apply-templates select="prd-type"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="row" mode="OFFPRINTS">
        <!--
			tr
			20 columns, 
			empty td's depending on row/@type 
			There are 4 types:
			a	'ce'
			b	'non-ce'
			c	'blank'
			d	'remark' or 'h1' or 'h2'
		-->
        <xsl:choose>
            <xsl:when test="@type = 'ce'">
                <tr>
                    <td>
                        <xsl:apply-templates select="aid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pii"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author"/>
                        <!-- mode="name-only" -->
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-paid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-free"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-tot"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-issues-paid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-issues-free"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="covers"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="e-suite"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                    <td>
                        <xsl:call-template name="insert-offprint-payment"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-charge"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="remark"/>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'non-ce'">
                <tr>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="corr-author" mode="name-only"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-paid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-free"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-offprints-tot"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-issues-paid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-issues-free"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="covers"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="e-suite"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                    <td>
                        <xsl:call-template name="insert-offprint-payment"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-charge"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="remark"/>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'blank'">
                <tr>
                    <td/>
                    <td>
                        <xsl:text>Blank page</xsl:text>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td/>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'remark' or @type = 'h1' or @type = 'h2'">
                <tr>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="item-title"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <!-- rows with @type=advert,h3,h4,he are not displayed -->
        </xsl:choose>
    </xsl:template>

    <xsl:template match="row" mode="PRINT-BIND">
        <!-- 
			tr, 
			15 columns, 
			empty td's depending on row/@type
			There are 4 types:
			a	'ce' or 'advert'
			b	'non-ce'
			c	'blank'
			d	'remark' or 'h3' or 'h4'
			e	'h1'
			f	'h2'
			g	'he' (not displayed)
		-->
        <xsl:choose>
            <xsl:when test="@type = 'ce' or @type = 'advert'">
                <tr>
                    <td>
                        <xsl:apply-templates select="aid"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pii"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="copyright-status"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author" mode="name-only"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="eo-item-nr"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="colour-fig-nr-print"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="remark"/>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'non-ce'">
                <tr>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="item-title"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="copyright-status"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="corr-author" mode="name-only"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="eo-item-nr"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pit"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="prd-type"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="article-number"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="no-colour-figs"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="colour-fig-nr-print"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="remark"/>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'blank'">
                <tr>
                    <td/>
                    <td>
                        <xsl:text>Blank page</xsl:text>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <xsl:apply-templates select="page-from"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="page-to"/>
                    </td>
                    <td/>
                    <td>
                        <xsl:apply-templates select="pdf-pages"/>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'remark' or @type = 'h3' or @tpe = 'h4'">
                <tr>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="item-title"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="pit"/>
                        </i>
                    </td>
                    <td>
                        <i>
                            <xsl:apply-templates select="prd-type"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <i>
                            <xsl:apply-templates select="pdf-pages"/>
                        </i>
                    </td>
                    <td>
                        <i>
                            <xsl:apply-templates select="no-colour-figs"/>
                        </i>
                    </td>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'h1'">
                <tr>
                    <td/>
                    <td/>
                    <td>
                        <b>
                            <xsl:apply-templates select="item-title"/>
                        </b>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <b>
                            <xsl:apply-templates select="pit"/>
                        </b>
                    </td>
                    <td>
                        <b>
                            <xsl:apply-templates select="prd-type"/>
                        </b>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <b>
                            <xsl:apply-templates select="pdf-pages"/>
                        </b>
                    </td>
                    <td>
                        <b>
                            <xsl:apply-templates select="no-colour-figs"/>
                        </b>
                    </td>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <xsl:when test="@type = 'h2'">
                <tr>
                    <td/>
                    <td/>
                    <td>
                        <u>
                            <xsl:apply-templates select="item-title"/>
                        </u>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <u>
                            <xsl:apply-templates select="pit"/>
                        </u>
                    </td>
                    <td>
                        <u>
                            <xsl:apply-templates select="prd-type"/>
                        </u>
                    </td>
                    <td/>
                    <td/>
                    <td/>
                    <td>
                        <u>
                            <xsl:apply-templates select="pdf-pages"/>
                        </u>
                    </td>
                    <td>
                        <u>
                            <xsl:apply-templates select="no-colour-figs"/>
                        </u>
                    </td>
                    <td/>
                    <td/>
                </tr>
            </xsl:when>
            <!-- rows with @type=he are not displayed -->
        </xsl:choose>
    </xsl:template>

    <!-- / issue content -->


    <!-- Element templates -->

    <!-- create pretty print -->
    <xsl:template match="*" mode="xml-source">
        <xsl:variable name="anc" select="count(ancestor::*) div 2"/>
        <div>
            <xsl:attribute name="style">
                <xsl:value-of select="concat('position: relative; margin-left:', $anc, '%;', 'overflow: scroll;')"/>
            </xsl:attribute>
            <span style="color:red">
                <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:for-each select="@*">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="name()"/>
                    <xsl:text>="</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>"</xsl:text>
                </xsl:for-each>
                <xsl:text>&gt;</xsl:text>
            </span>
            <xsl:apply-templates mode="xml-source"/>
            <span style="color:red">
                <xsl:text>&lt;/</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:text>&gt;</xsl:text>
            </span>
        </div>
    </xsl:template>
    <!-- ===============================================================================
		Element templates 
		208 templates are orderd alfabetically from a to z

			abbr-name, accept-date, additional-issue-info, address, address-contd, aff, affiliation, aid, alt-subtitle, alt-title, 
			article-based-publishing, article-number, assigned-to-issue (2 modes), back-margin, bam-stage, batch, batch-member, 
			binding-type, buffer-status, cny, colour-fig-nr-print, colour-fig-nr-print_ROW, conf-name, conference, conference-date, 
			copy-edit-content, copyright-recd-date, copyright-status, corr-author (2 modes), corrections, corrections-uri, cover-caption, 
			cover-copyright, cover-date, cover-date-printed, cover-finishing, cover-label, covers, cpc, crossmark, cty, date, date-range, 
			degree, degrees, dochead, doi, due-date, e-component, e-component-format, e-component-nr, e-component-remarks, e-components, 
			e-submission-item-nr, e-suite, ead, editor, editors, effect-cover-date, effect-date, embargo, embargo-until-stage, employer, 
			end-date, eo-item-nr, exec-code, exec-name, executor, expiry-date, fax, figure, figure-nr, figure-production-type, 
			figure-remarks, figure-type, file-name, first-author, first-e-page, first-page, fnm, full-name, funded-by, funding, 
			general-info, given-name, grant-number, head-margin, hold-despatch-date, hold-until-date, in-scope-cpc, insert, inst-contd, 
			institute, iss-from, iss-to, issn, issue-labels-details, issue-production-type, issue-remark, issue-remarks, issue-weight, 
			item-group, item-group-description, item-remark, item-remarks, item-title, jid, journal-no, journal-title, last-e-page, 
			last-page, license, milestone, nihms-id, no-author-copies, no-bw-figs, no-colour-figs, no-copies, no-e-components, no-extra-copies, 
			no-grace-copies, no-issues-free, no-issues-paid, no-mark-prom-copies, no-mns-pages, no-offprints-free, no-offprints-paid, 
			no-offprints-tot, no-pages-adverts, no-pages-blank, no-pages-bm, no-pages-coated, no-pages-cover, no-pages-extra, 
			no-pages-insert, no-pages-interior, no-pages-prelims, no-pages-print, no-pages-total, no-pages-web, no-phys-figs, 
			no-voucher-copies, no-web-colour-figs, offprint-payment, offprint-type, online-publ-date, online-version, opco, orcid, 
			organization, out-sort, page-charge, page-from, page-range, page-ranges, page-to, paid-ads, paper-type-cover, 
			paper-type-interior, pdf-pages, physical-figures, pii, pit, pmg, po-number, prd-type, prd-type-as-sent, prefix, 
			principal-investigator, print-details, print-type, prod-site, pubmedcentral-id, received-date, refers-to-document, remark, 
			remark-type, response, revised-date, revised-proof, righthand-start, row, section, sequence, si-editor, si-editors, snm, 
			special-issue, special-issue-id, spine-width, split-print-run, sponsor, stage, start-date, subtitle, suffix, supp, surname, 
			tel, time, total-print-run, trimmed-size, typeset-model, venue, version-no | language, vol-from, vol-to, zero-warehousing, zipcode, 
	-->
    <xsl:template match="abbr-name">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="accept-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="additional-issue-info">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="address">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="address-contd">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="aff">
        <xsl:if test="organization">
            <xsl:value-of select="organization"/>
            <br/>
        </xsl:if>
        <xsl:if test="institute">
            <xsl:value-of select="institute"/>
            <br/>
        </xsl:if>
        <xsl:if test="inst-contd">
            <xsl:value-of select="inst-contd"/>
            <br/>
        </xsl:if>
        <xsl:if test="address">
            <xsl:value-of select="address"/>
            <br/>
        </xsl:if>
        <xsl:if test="address-contd">
            <xsl:value-of select="address-contd"/>
            <br/>
        </xsl:if>
        <xsl:if test="zipcode or cty or cny">
            <xsl:call-template name="insert-cty-cny"/>
            <br/>
        </xsl:if>
        <xsl:if test="tel">
            <xsl:text>Phone: </xsl:text>
            <xsl:value-of select="tel"/>
            <br/>
        </xsl:if>
        <xsl:if test="fax">
            <xsl:text>Fax: </xsl:text>
            <xsl:value-of select="fax"/>
            <br/>
        </xsl:if>
        <xsl:if test="ead">
            <xsl:text>E-mail: </xsl:text>
            <xsl:for-each select="ead">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:text>; </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="affiliation">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="aid">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="alt-title">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="alt-subtitle">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="article-based-publishing">
        <xsl:value-of select="@abp"/>
    </xsl:template>

    <xsl:template match="article-number">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="assigned-to-issue">
        <h4>Issue information</h4>
        <p>
            <table width="100%">
                <tr>
                    <td width="50%">
                        <table width="100%">
                            <tr>
                                <td>
                                    <xsl:text>Issue PII:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="pii"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>ISSN:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="issn"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Effect cover date:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="effect-cover-date"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Volume/Issue:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-volume-issue">
                                        <xsl:with-param name="vol-from">
                                            <xsl:value-of select="vol-from"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="vol-to">
                                            <xsl:value-of select="vol-to"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="iss-from">
                                            <xsl:value-of select="iss-from"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="iss-to">
                                            <xsl:value-of select="iss-to"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="supp">
                                            <xsl:value-of select="supp"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>S250 sequence number:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="following-sibling::s250-sequence-number"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Pages:</xsl:text>
                                </td>
                                <td>
                                    <xsl:call-template name="insert-page-range">
                                        <xsl:with-param name="type">
                                            <xsl:value-of select="following-sibling::page-range/@type"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="prefix">
                                            <xsl:value-of select="following-sibling::prefix"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="suffix">
                                            <xsl:value-of select="following-sibling::suffix"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="first-page">
                                            <xsl:value-of select="following-sibling::page-range/first-page"/>
                                        </xsl:with-param>
                                        <xsl:with-param name="last-page">
                                            <xsl:value-of select="following-sibling::page-range/last-page"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                            <tr>
                                <td>&#x000A0;</td>
                                <td>&#x000A0;</td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        <table width="100%">
                            <tr>
                                <td>
                                    <xsl:text>Paper type interior:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="following-sibling::additional-issue-info/paper-type-interior"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Paper type cover:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="following-sibling::additional-issue-info/paper-type-cover"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Trimmed size:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="following-sibling::additional-issue-info/trimmed-size"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Head margin:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="following-sibling::additional-issue-info/head-margin"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Back margin:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="following-sibling::additional-issue-info/back-margin"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:text>Typeset model:</xsl:text>
                                </td>
                                <td>
                                    <xsl:apply-templates select="following-sibling::additional-issue-info/typeset-model"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </p>
    </xsl:template>

    <xsl:template match="assigned-to-issue" mode="s250">
        <h4>Issue information</h4>
        <p>
            <table width="50%">
                <tr>
                    <td>
                        <xsl:text>Issue PII:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="pii"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>ISSN:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="issn"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Effect cover date:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="effect-cover-date"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Volume/Issue:</xsl:text>
                    </td>
                    <td>
                        <xsl:call-template name="insert-volume-issue">
                            <xsl:with-param name="vol-from">
                                <xsl:value-of select="vol-from"/>
                            </xsl:with-param>
                            <xsl:with-param name="vol-to">
                                <xsl:value-of select="vol-to"/>
                            </xsl:with-param>
                            <xsl:with-param name="iss-from">
                                <xsl:value-of select="iss-from"/>
                            </xsl:with-param>
                            <xsl:with-param name="iss-to">
                                <xsl:value-of select="iss-to"/>
                            </xsl:with-param>
                            <xsl:with-param name="supp">
                                <xsl:value-of select="supp"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>S250 sequence number:</xsl:text>
                    </td>
                    <td>
                        <xsl:apply-templates select="following-sibling::s250-sequence-number"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:text>Pages:</xsl:text>
                    </td>
                    <td>
                        <xsl:call-template name="insert-page-range">
                            <xsl:with-param name="type">
                                <xsl:value-of select="following-sibling::page-range/@type"/>
                            </xsl:with-param>
                            <xsl:with-param name="prefix">
                                <xsl:value-of select="following-sibling::prefix"/>
                            </xsl:with-param>
                            <xsl:with-param name="suffix">
                                <xsl:value-of select="following-sibling::suffix"/>
                            </xsl:with-param>
                            <xsl:with-param name="first-page">
                                <xsl:value-of select="following-sibling::page-range/first-page"/>
                            </xsl:with-param>
                            <xsl:with-param name="last-page">
                                <xsl:value-of select="following-sibling::page-range/last-page"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </td>
                </tr>
                <tr>
                    <td>&#x000A0;</td>
                    <td>&#x000A0;</td>
                </tr>
            </table>
        </p>
    </xsl:template>

    <xsl:template match="bam-stage">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="back-margin">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="batch">
        <xsl:variable name="nr-batch-members">
            <xsl:value-of select="count(batch-member)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$nr-batch-members = 1">
                <xsl:text>1 batch member present</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$nr-batch-members"/>
                <xsl:text> batch members present</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="batch-member">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="binding-type">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="buffer-status">
        <xsl:value-of select="@status"/>
    </xsl:template>

    <xsl:template match="cny">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="colour-fig-nr-print">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::colour-fig-nr-print">
            <xsl:text>, </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="colour-fig-nr-print_ROW">
        <!-- "Hack" to ensure correct rendering in case of the issue pagination sheet -->
        <xsl:value-of select="colour-fig-nr-print"/>
        <xsl:if test="following-sibling::colour-fig-nr-print_ROW">
            <xsl:text>, </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="conference">
        <p>
            <xsl:if test="conf-name">
                <i>
                    <xsl:text>Conference name: </xsl:text>
                </i>
                <xsl:apply-templates select="conf-name"/>
                <br/>
            </xsl:if>
            <xsl:if test="abbr-name">
                <i>
                    <xsl:text>Abbreviation: </xsl:text>
                </i>
                <xsl:apply-templates select="abbr-name"/>
                <br/>
            </xsl:if>
            <xsl:if test="venue">
                <i>
                    <xsl:text>Location: </xsl:text>
                </i>
                <xsl:apply-templates select="venue"/>
                <br/>
            </xsl:if>
            <xsl:if test="conference-date">
                <i>
                    <xsl:text>Date: </xsl:text>
                </i>
                <xsl:apply-templates select="conference-date"/>
                <br/>
            </xsl:if>
            <xsl:if test="sponsor">
                <i>
                    <xsl:text>Sponsored by: </xsl:text>
                </i>
                <xsl:apply-templates select="sponsor"/>
                <br/>
            </xsl:if>
        </p>
    </xsl:template>

    <xsl:template match="conf-name">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="conference-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="copy-edit-content">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="copyright-recd-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="copyright-status">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="corr-author">
        <xsl:if test="degree">
            <xsl:value-of select="concat(degree, ' ')"/>
        </xsl:if>
        <xsl:if test="fnm">
            <xsl:value-of select="concat(fnm, ' ')"/>
        </xsl:if>
        <xsl:apply-templates select="snm"/>
        <xsl:if test="orcid">
            <xsl:value-of select="' '"/>
            <xsl:apply-templates select="orcid"/>
        </xsl:if>
        <br/>
        <xsl:apply-templates select="aff"/>
    </xsl:template>

    <xsl:template match="corr-author" mode="name-only">
        <xsl:if test="degree">
            <xsl:value-of select="concat(degree, ' ')"/>
        </xsl:if>
        <xsl:if test="fnm">
            <xsl:value-of select="concat(fnm, ' ')"/>
        </xsl:if>
        <xsl:apply-templates select="snm"/>
        <xsl:if test="orcid">
            <xsl:value-of select="' '"/>
            <xsl:apply-templates select="orcid"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="corrections">
        <xsl:value-of select="@type"/>
    </xsl:template>

    <xsl:template match="corrections-uri">
        <a href="{.}">
            <xsl:value-of select="."/>
        </a>
    </xsl:template>

    <xsl:template match="cover-caption">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="cover-copyright">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="cover-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="cover-date-printed">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="cover-finishing">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="cover-label">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="covers">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="cpc">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="crossmark">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="cty">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="date">
        <xsl:variable name="month">
            <xsl:call-template name="get-month">
                <xsl:with-param name="month" select="@month"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="concat(@day, ' ', $month, ' ', @yr)"/>
    </xsl:template>

    <xsl:template match="date-range">
        <xsl:value-of select="start-date"/>
        <xsl:if test="end-date">
            <xsl:value-of select="$ENDASH"/>
            <xsl:value-of select="end-date"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="degree">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="degrees">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="dochead">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="doi">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="due-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="e-component">
        <xsl:value-of select="e-component-nr"/>
        <xsl:if test="file-name">
            <xsl:text>; </xsl:text>
            <xsl:for-each select="file-name">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:text>; </xsl:text>
        <xsl:value-of select="e-component-format"/>
        <xsl:if test="e-component-remarks">
            <xsl:value-of select="concat('; ', e-component-remarks)"/>
        </xsl:if>
        <xsl:if test="following-sibling::e-component">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="e-component-format">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="e-component-nr">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="e-component-remarks">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="e-components">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="e-submission-item-nr">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="e-suite">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="ead">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="editor">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="editors">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="effect-cover-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="effect-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="embargo">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="embargo-until-stage">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="employer">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="end-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="eo-item-nr">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="exec-code">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="exec-name">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="executor">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="expiry-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="fax">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="figure">
        <xsl:value-of select="figure-nr"/>
        <xsl:value-of select="concat('; ', figure-type)"/>
        <xsl:if test="figure-production-type">
            <xsl:value-of select="concat('; ', figure-production-type)"/>
        </xsl:if>
        <xsl:if test="graphical-abstract/@grabs = 'yes'">
            <xsl:value-of select="'; graphical abstract'"/>
        </xsl:if>
        <xsl:if test="file-name">
            <xsl:text>; </xsl:text>
            <xsl:for-each select="file-name">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="figure-remarks">
            <xsl:value-of select="concat('; ', figure-remarks)"/>
        </xsl:if>
        <xsl:if test="following-sibling::figure">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="figure-nr">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="figure-production-type">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="figure-remarks">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="figure-type">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="file-name">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="first-author">
        <xsl:if test="degree">
            <xsl:value-of select="concat(degree, ' ')"/>
        </xsl:if>
        <xsl:if test="fnm">
            <xsl:value-of select="concat(fnm, ' ')"/>
        </xsl:if>
        <xsl:apply-templates select="snm"/>
        <xsl:if test="orcid">
            <xsl:value-of select="' '"/>
            <xsl:apply-templates select="orcid"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="first-e-page">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="first-page">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="fnm">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="full-name">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="funded-by">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="funding">
        <i>
            <xsl:text>Funded by: </xsl:text>
        </i>
        <xsl:value-of select="funded-by"/>
        <br/>
        <xsl:if test="grant-number">
            <i>
                <xsl:text>Grant number(s): </xsl:text>
            </i>
            <xsl:for-each select="grant-number">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:text>; </xsl:text>
                </xsl:if>
            </xsl:for-each>
            <br/>
        </xsl:if>
        <xsl:if test="principal-investigator">
            <i>
                <xsl:text>Principal investigator(s): </xsl:text>
            </i>
            <xsl:apply-templates select="principal-investigator"/>
            <br/>
        </xsl:if>
        <xsl:if test="nihms-id">
            <i>
                <xsl:text>NIHMS-ID: </xsl:text>
            </i>
            <xsl:apply-templates select="nihms-id"/>
            <br/>
        </xsl:if>
        <xsl:if test="pubmedcentral-id">
            <i>
                <xsl:text>PubMedCentral ID: </xsl:text>
            </i>
            <xsl:apply-templates select="pubmedcentral-id"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="general-info">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="given-name">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="grant-number">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="head-margin">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="hold-despatch-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="hold-until-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="in-scope-cpc">
        <xsl:value-of select="@type"/>
    </xsl:template>

    <xsl:template match="insert">
        <xsl:value-of select="@insert"/>
    </xsl:template>

    <xsl:template match="inst-contd">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="institute">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="iss-from">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="iss-to">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="issn">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="issue-labels-details">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="issue-production-type">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="issue-remark">
        <p>
            <i>
                <xsl:text>Type: </xsl:text>
            </i>
            <xsl:apply-templates select="remark-type"/>
            <br/>
            <i>
                <xsl:text>Remark: </xsl:text>
            </i>
            <xsl:apply-templates select="remark"/>
            <xsl:if test="response">
                <br/>
                <i>
                    <xsl:text>Response: </xsl:text>
                </i>
                <xsl:apply-templates select="response"/>
            </xsl:if>
        </p>
    </xsl:template>

    <xsl:template match="issue-remarks">
        <h4>
            <xsl:text>Issue remarks:</xsl:text>
        </h4>
        <xsl:if test="//buffer-status/@status = 'yes'">
            <p>
                <b>
                    <xsl:text>Buffer issue: do not despatch to the warehouse until instructed by the Production Site.</xsl:text>
                </b>
            </p>
        </xsl:if>
        <xsl:apply-templates select="issue-remark[remark-type != 'Advert details' and remark-type != 'ADV']"/>
    </xsl:template>

    <xsl:template match="issue-weight">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="item-group">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="item-group-description">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="item-remark">
        <p>
            <i>
                <xsl:text>Type: </xsl:text>
            </i>
            <xsl:apply-templates select="remark-type"/>
            <br/>
            <i>
                <xsl:text>Remark: </xsl:text>
            </i>
            <xsl:apply-templates select="remark"/>
            <xsl:if test="response">
                <br/>
                <i>
                    <xsl:text>Response: </xsl:text>
                </i>
                <xsl:apply-templates select="response"/>
            </xsl:if>
        </p>
    </xsl:template>

    <xsl:template match="item-remarks">
        <h4>
            <xsl:text>Item remarks:</xsl:text>
        </h4>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="item-title">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="jid">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="journal-no">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="journal-title">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="last-e-page">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="last-page">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="license">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="milestone">
        <xsl:value-of select="@type"/>
    </xsl:template>

    <xsl:template match="nihms-id">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-author-copies">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-bw-figs">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-colour-figs">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-copies">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-e-components">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-extra-copies">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-grace-copies">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-issues-free">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-issues-paid">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-mark-prom-copies">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-mns-pages">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-offprints-free">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-offprints-paid">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-offprints-tot">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-adverts">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-blank">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-bm">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-coated">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-cover">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-extra">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-insert">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-interior">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-prelims">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-print">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-total">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-pages-web">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-phys-figs">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-voucher-copies">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="no-web-colour-figs">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="offprint-payment">
        <xsl:value-of select="@payment"/>
    </xsl:template>

    <xsl:template match="offprint-type">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="online-publ-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="online-version">
        <xsl:value-of select="@type"/>
    </xsl:template>

    <xsl:template match="opco">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="orcid">
        <xsl:value-of select="concat('(ORCID: ', ., ')')"/>
    </xsl:template>

    <xsl:template match="organization">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="out-sort">
        <xsl:value-of select="@out-sort"/>
    </xsl:template>

    <xsl:template match="page-charge">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="page-from">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="page-range">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="page-ranges">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="page-to">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="paid-ads">
        <xsl:value-of select="@paid-ads"/>
    </xsl:template>

    <xsl:template match="paper-type-cover">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="paper-type-interior">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="pdf-pages">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="physical-figures">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="pii">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="pit">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="pmg">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="po-number">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="prd-type">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="prd-type-as-sent">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="prefix">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="principal-investigator">
        <xsl:if test="fnm">
            <xsl:value-of select="fnm"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:value-of select="snm"/>
        <xsl:if test="aff/ead">
            <xsl:text>, </xsl:text>
            <xsl:for-each select="aff/ead">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="following-sibling::principal-investigator">
            <xsl:text>; </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="print-details">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="prod-site">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="print-type">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="pubmedcentral-id">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="received-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="refers-to-document">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="remark">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="remark-type">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>

    <xsl:template match="response">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="revised-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="revised-proof">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="righthand-start">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="row">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="section">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="si-editors">
        <xsl:for-each select="si-editor">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>; </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="si-editor">
        <xsl:if test="degrees[position() = 1]">
            <xsl:apply-templates select="degrees[position() = 1]"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:if test="given-name">
            <xsl:apply-templates select="given-name"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:apply-templates select="surname"/>
        <xsl:if test="suffix">
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="suffix"/>
        </xsl:if>
        <xsl:if test="degrees[position() != 1]">
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="degrees[position() != 1]"/>
        </xsl:if>
        <xsl:if test="affiliation">
            <xsl:text> (</xsl:text>
            <xsl:apply-templates select="affiliation"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="snm">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="special-issue">
        <p>
            <a name="specialissue"/>
            <xsl:text>Special issue information:</xsl:text>
            <table>
                <tr width="100%">
                    <td>Working title:</td>
                    <td>
                        <xsl:apply-templates select="special-issue-id"/>
                    </td>
                </tr>
                <xsl:if test="full-name">
                    <tr>
                        <td>Title:</td>
                        <td>
                            <xsl:apply-templates select="full-name"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="subtitle">
                    <tr>
                        <td>Subtitle:</td>
                        <td>
                            <xsl:apply-templates select="subtitle"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="alt-title">
                    <tr>
                        <td>Alt. title:</td>
                        <td>
                            <xsl:apply-templates select="alt-title"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="alt-subtitle">
                    <tr>
                        <td>Alt. subtitle:</td>
                        <td>
                            <xsl:apply-templates select="alt-subtitle"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="conference">
                    <tr>
                        <td>Conference:</td>
                        <td>
                            <xsl:apply-templates select="conference"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="editors">
                    <tr>
                        <td>(Guest) Editors:</td>
                        <td>
                            <xsl:apply-templates select="editors"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="si-editors">
                    <tr>
                        <td>(Guest) Editors:</td>
                        <td>
                            <xsl:apply-templates select="si-editors"/>
                        </td>
                    </tr>
                </xsl:if>
            </table>
        </p>
    </xsl:template>

    <xsl:template match="special-issue-id">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="spine-width">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="split-print-run">
        <xsl:value-of select="@split"/>
    </xsl:template>

    <xsl:template match="sponsor">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="stage">
        <xsl:value-of select="@step"/>
    </xsl:template>

    <xsl:template match="start-date">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="subtitle">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="suffix">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="supp">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="surname">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tel">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="time">
        <!-- if no @hr, print date;
			 if @hr, print date and time, using 00 for min and sec if they are not present -->
        <xsl:variable name="month">
            <xsl:call-template name="get-month">
                <xsl:with-param name="month">
                    <xsl:value-of select="@month"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="min">
            <xsl:choose>
                <xsl:when test="@min">
                    <xsl:value-of select="@min"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'00'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="sec">
            <xsl:choose>
                <xsl:when test="@sec">
                    <xsl:value-of select="@sec"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'00'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="concat(@day, ' ', $month, ' ', @yr)"/>
        <xsl:if test="@hr">
            <xsl:value-of select="concat(' (', @hr, ':', $min, ':', $sec, ')')"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="total-print-run">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="trimmed-size">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="typeset-model">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="venue">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="version-no | language">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="vol-from">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="vol-to">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="zero-warehousing">
        <xsl:value-of select="@status"/>
    </xsl:template>

    <xsl:template match="zipcode">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- / Element templates -->


    <!-- Called templates -->

    <xsl:template name="insert-style">
        <style type="text/css">
        <xsl:comment>
            <xsl:text>
				*
					{
						font-family: 'Arial Unicode MS', 'Arial, sans-serif';
						font-size: 10pt;
						color: black; 
					}
				body
					{
						background-color: wheat;
						margin: 2em;
					}
				table
					{
						/* border: 2px solid darkgrey; */
						border-collapse: collapse;
					}
				tr
					{
						vertical-align: top; 
					}
				th
					{
						text-align: left;
					}
				td
					{
						/* border: 1px solid lightgrey; */
					}
				.content
					(
						font-size: 6pt; 
					}
				.warning
					{
						background-color: red;
					}
				.grey
					{
						background-color: #DDDDDD; 
					}
            </xsl:text>
        </xsl:comment>
        </style>
    </xsl:template>

    <xsl:template name="insert-javascript">
        <script>
<xsl:text>
    function expColl(dF,statusObj,object)
        {
            if (statusObj.status == 1)
            { //1 is open, so close now
                dF.appendChild(object.parentNode.removeChild(object.parentNode.lastChild));
                object.removeChild(object.lastChild); //remove minus !!!second takes away plus of first!?
                object.appendChild(document.createTextNode('+')); //put + in its place
                statusObj.status = 0;
            }
            else
            { //open
                object.removeChild(object.lastChild); //remove plus
                object.appendChild(document.createTextNode('-')); //put minus in its place
                object.parentNode.appendChild(dF);
                statusObj.status = 1;
            }
        }
        var part0 = document.createDocumentFragment();
        var expanded0 = {status:1};
</xsl:text>
        </script>
    </xsl:template>

    <xsl:template name="insert-xml-code">
        <div id="" style="background-color:#D7FFCF; position: relative; left:0.3%; border-style:solid; border-width:1; padding:5">
            <span style="font-size:70%">XML code</span>
            <br/>
            <span id="xmlcode" onclick="expColl(part0,expanded0,this)" style="color:red; font-weight:900; font-size:150%; font-family:courier" onmouseover="this.style.cursor='hand'">-</span>
            <xsl:apply-templates select="/" mode="xml-source"/>
        </div>
    </xsl:template>

    <xsl:template name="get-month">
        <xsl:param name="month"/>
        <xsl:choose>
            <xsl:when test="$month = '01'">
                <xsl:text>January</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '02'">
                <xsl:text>February</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '03'">
                <xsl:text>March</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '04'">
                <xsl:text>April</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '05'">
                <xsl:text>May</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '06'">
                <xsl:text>June</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '07'">
                <xsl:text>July</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '08'">
                <xsl:text>August</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '09'">
                <xsl:text>September</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '10'">
                <xsl:text>October</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '11'">
                <xsl:text>November</xsl:text>
            </xsl:when>
            <xsl:when test="$month = '12'">
                <xsl:text>December</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="insert-volume-issue">
        <xsl:param name="vol-from"/>
        <xsl:param name="vol-to"/>
        <xsl:param name="iss-from"/>
        <xsl:param name="iss-to"/>
        <xsl:param name="supp"/>
        <xsl:value-of select="$vol-from"/>
        <xsl:if test="$vol-to != ''">
            <xsl:value-of select="concat('-', $vol-to)"/>
        </xsl:if>
        <xsl:if test="$iss-from != ''">
            <xsl:value-of select="concat('/', $iss-from)"/>
        </xsl:if>
        <xsl:if test="$iss-to != ''">
            <xsl:value-of select="concat('-', $iss-to)"/>
        </xsl:if>
        <xsl:value-of select="$supp"/>
    </xsl:template>

    <xsl:template name="insert-hrule">
        <p>
            <hr size="1"/>
        </p>
    </xsl:template>

    <xsl:template name="insert-jid-aid">
        <xsl:value-of select="concat(jid, ' ', aid)"/>
    </xsl:template>

    <xsl:template name="insert-refers-to-document">
        <xsl:param name="type"/>
        <xsl:for-each select="refers-to-document">
            <xsl:for-each select="refers-to-document_ROW">
                <!-- "Hack" to ensure correct rendering in case of the issue pagination sheet -->
                <xsl:choose>
                    <xsl:when test="jid and aid">
                        <xsl:value-of select="concat(jid, ' ', aid, ', ')"/>
                    </xsl:when>
                    <xsl:when test="jid and not(aid)">
                        <xsl:value-of select="concat(jid, ', ')"/>
                    </xsl:when>
                    <xsl:when test="not(jid) and aid">
                        <xsl:value-of select="concat(aid, ', ')"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:value-of select="pii"/>
                <xsl:choose>
                    <xsl:when test="doi and pit">
                        <xsl:value-of select="concat('(', doi, ', ', pit, ')')"/>
                    </xsl:when>
                    <xsl:when test="doi and not(pit)">
                        <xsl:value-of select="concat('(', doi, ')')"/>
                    </xsl:when>
                    <xsl:when test="not(doi) and pit">
                        <xsl:value-of select="concat('(', pit, ')')"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="position() != last()">
                    <xsl:choose>
                        <xsl:when test="$type = 'item'">
                            <xsl:text>;</xsl:text>
                            <br/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>; </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="jid and aid">
                    <xsl:value-of select="concat(jid, ' ', aid, ', ')"/>
                </xsl:when>
                <xsl:when test="jid and not(aid)">
                    <xsl:value-of select="concat(jid, ', ')"/>
                </xsl:when>
                <xsl:when test="not(jid) and aid">
                    <xsl:value-of select="concat(aid, ', ')"/>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="pii"/>
            <xsl:choose>
                <xsl:when test="doi and pit">
                    <xsl:value-of select="concat('(', doi, ', ', pit, ')')"/>
                </xsl:when>
                <xsl:when test="doi and not(pit)">
                    <xsl:value-of select="concat('(', doi, ')')"/>
                </xsl:when>
                <xsl:when test="not(doi) and pit">
                    <xsl:value-of select="concat('(', pit, ')')"/>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="position() != last()">
                <xsl:choose>
                    <xsl:when test="$type = 'item'">
                        <xsl:text>;</xsl:text>
                        <br/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>; </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="insert-cty-cny">
        <xsl:choose>
            <xsl:when test="zipcode/@zipcode-pos = 'NONE'">
                <xsl:value-of select="cty"/>
                <br/>
                <xsl:value-of select="cny"/>
            </xsl:when>
            <xsl:when test="zipcode/@zipcode-pos = 'BEFORECTY'">
                <xsl:value-of select="concat(zipcode, ' ', cty)"/>
                <br/>
                <xsl:value-of select="cny"/>
            </xsl:when>
            <xsl:when test="zipcode/@zipcode-pos = 'AFTERCTY'">
                <xsl:value-of select="concat(cty, ' ', zipcode)"/>
                <br/>
                <xsl:value-of select="cny"/>
            </xsl:when>
            <xsl:when test="zipcode/@zipcode-pos = 'BEFORECNY'">
                <xsl:value-of select="cty"/>
                <br/>
                <xsl:value-of select="concat(zipcode, ' ', cny)"/>
            </xsl:when>
            <xsl:when test="zipcode/@zipcode-pos = 'AFTERCNY'">
                <xsl:value-of select="cty"/>
                <br/>
                <xsl:value-of select="concat(cny, ' ', zipcode)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(cty, ' ', zipcode)"/>
                <br/>
                <xsl:value-of select="cny"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="insert-pages">
        <xsl:param name="type"/>
        <xsl:variable name="no-pages">
            <xsl:choose>
                <xsl:when test="$type = 'PRELIM'">
                    <xsl:value-of select="general-info/no-pages-prelims"/>
                </xsl:when>
                <xsl:when test="$type = 'INTERIOR'">
                    <xsl:value-of select="general-info/no-pages-interior"/>
                </xsl:when>
                <xsl:when test="$type = 'EXTRA'">
                    <xsl:value-of select="general-info/no-pages-extra"/>
                </xsl:when>
                <xsl:when test="$type = 'INSERT'">
                    <xsl:value-of select="general-info/no-pages-insert"/>
                </xsl:when>
                <xsl:when test="$type = 'BACKMATTER'">
                    <xsl:value-of select="general-info/no-pages-bm"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$no-pages"/>
        <xsl:if test="general-info/page-ranges/page-range[@type = $type] and $no-pages &gt; 0">
            <!--            <xsl:if test="$no-pages &gt; 0">
-->
            <xsl:text> (</xsl:text>
            <xsl:for-each select="general-info/page-ranges/page-range[@type = $type]">
                <xsl:if test="position() != 1">
                    <xsl:text>; </xsl:text>
                </xsl:if>
                <xsl:value-of select="concat(first-page, $ENDASH, last-page)"/>
            </xsl:for-each>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template name="insert-page-range">
        <xsl:param name="type"/>
        <xsl:param name="prefix"/>
        <xsl:param name="suffix"/>
        <xsl:param name="first-page"/>
        <xsl:param name="last-page"/>
        <xsl:if test="$first-page != ''">
            <xsl:value-of select="concat($prefix, $first-page, $suffix)"/>
            <xsl:if test="$last-page != ''">
                <xsl:value-of select="concat($ENDASH, $prefix, $last-page, $suffix)"/>
            </xsl:if>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:value-of select="concat('(', $type, ')')"/>
    </xsl:template>
    <!-- First version:
    <xsl:template name="insert-page-range">
        <xsl:param name="type"/>
        <xsl:param name="first-page"/>
        <xsl:param name="last-page"/>
        <xsl:if test="$first-page!=''">
            <xsl:value-of select="$first-page"/>
            <xsl:if test="$last-page!=''">
                <xsl:value-of select="concat($ENDASH,$last-page)"/>
            </xsl:if>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:value-of select="concat('(', $type, ')')"/>
    </xsl:template>
	-->

    <xsl:template name="insert-pages-from-rows">
        <!-- Template insert-pages-from-rows (insert-pages3 from issue.xsl)

			This template uses a subset of all rows (issue-content/row) and lists the
			page numbers in contracted form. For instance, 1-2;3;4;6;7 becomes 1-4;6-7,
			etc. It processes the rows one at a time and decides if the page numbers
			(in page-from and page-to) are displayed and how. The actions/results are
			different based on the position of the row in the subset (first, last, both,
			neither). The result also depends on the previous page number and the next
			one (variables nextpage and prevpage which are defined per row). The comparison
			of page numbers is done with the numerical part of the numbers, the letters
			are stripped from the page numbers.

			The template assumes that page-from is always present.
			It is run when the current element is issue-info.
		-->

        <xsl:param name="rows"/>
        <xsl:param name="type"/>
        <xsl:variable name="no-pages">
            <xsl:choose>
                <xsl:when test="$type = 'IN'">
                    <xsl:value-of select="general-info/no-pages-insert"/>
                </xsl:when>
                <xsl:when test="$type = 'EX'">
                    <xsl:value-of select="general-info/no-pages-extra"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$no-pages"/>
        <xsl:if test="$no-pages &gt; 0">
            <xsl:text> (</xsl:text>

            <xsl:for-each select="$rows">

                <xsl:variable name="pos">
                    <xsl:value-of select="position()"/>
                </xsl:variable>
                <xsl:variable name="pf">
                    <xsl:value-of select="translate(page-from, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '')"/>
                </xsl:variable>
                <xsl:variable name="pt">
                    <xsl:value-of select="translate(page-to, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '')"/>
                </xsl:variable>
                <xsl:variable name="nextpage">
                    <xsl:choose>
                        <xsl:when test="$pos = last()">
                            <xsl:value-of select="''"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="translate($rows[$pos + 1]/page-from, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="prevpage">
                    <xsl:choose>
                        <xsl:when test="$pos = 1">
                            <xsl:value-of select="''"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$rows[$pos - 1]/page-to">
                                    <xsl:value-of select="translate($rows[$pos - 1]/page-to, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="translate($rows[$pos - 1]/page-from, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:choose>
                    <xsl:when test="$pos = 1 and $pos = last()">
                        <xsl:value-of select="page-from"/>
                        <xsl:if test="page-to and $pf != $pt">
                            <xsl:value-of select="concat($ENDASH, page-to)"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$pos = 1 and $pos != last()">
                        <xsl:value-of select="page-from"/>
                        <xsl:if test="page-to and $pf != $pt and $pt != $nextpage - 1">
                            <xsl:value-of select="concat($ENDASH, page-to)"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$pos != 1 and $pos != last()">
                        <xsl:if test="$pf = $prevpage + 1 and not(page-to) and $pf != $nextpage - 1">
                            <xsl:value-of select="concat($ENDASH, page-from)"/>
                        </xsl:if>
                        <xsl:if test="$pf = $prevpage + 1 and page-to and $pf = $pt and $pf != $nextpage - 1">
                            <xsl:value-of select="concat($ENDASH, page-from)"/>
                        </xsl:if>
                        <xsl:if test="$pf != $prevpage + 1">
                            <xsl:value-of select="concat($GROUPSEP, page-from)"/>
                        </xsl:if>
                        <xsl:if test="page-to and $pf != $pt and $pt != $nextpage - 1">
                            <xsl:value-of select="concat($ENDASH, page-to)"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$pos != 1 and $pos = last()">
                        <xsl:if test="$pf = $prevpage + 1 and not(page-to)">
                            <xsl:value-of select="concat($ENDASH, page-from)"/>
                        </xsl:if>
                        <xsl:if test="$pf = $prevpage + 1 and page-to and $pf = $pt">
                            <xsl:value-of select="concat($ENDASH, page-from)"/>
                        </xsl:if>
                        <xsl:if test="$pf != $prevpage + 1">
                            <xsl:value-of select="concat($GROUPSEP, page-from)"/>
                        </xsl:if>
                        <xsl:if test="page-to and $pf != $pt">
                            <xsl:value-of select="concat($ENDASH, page-to)"/>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>

            </xsl:for-each>

            <xsl:text>)</xsl:text>
        </xsl:if>

    </xsl:template>

    <xsl:template name="insert-advert-details">
        <h4>
            <xsl:text>Advert details:</xsl:text>
        </h4>
        <xsl:apply-templates select="issue-remarks/issue-remark[remark-type = 'Advert details' or remark-type = 'ADV']"/>
    </xsl:template>

    <xsl:template name="insert-cover-info">
        <xsl:variable name="label">
            <xsl:value-of select="general-info/cover-label"/>
        </xsl:variable>
        <xsl:variable name="copyright">
            <xsl:value-of select="general-info/cover-copyright"/>
        </xsl:variable>
        <xsl:variable name="caption">
            <xsl:value-of select="general-info/cover-caption"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$label = ''">
                <xsl:choose>
                    <xsl:when test="$copyright = ''">
                        <xsl:if test="$caption != ''">
                            <xsl:value-of select="concat('Caption: ', $caption)"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('Copyright: ', $copyright)"/>
                        <xsl:if test="$caption != ''">
                            <xsl:value-of select="concat('; Caption: ', $caption)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('Label: ', $label)"/>
                <xsl:choose>
                    <xsl:when test="$copyright = ''">
                        <xsl:if test="$caption != ''">
                            <xsl:value-of select="concat('; Caption: ', $caption)"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('; Copyright: ', $copyright)"/>
                        <xsl:if test="$caption != ''">
                            <xsl:value-of select="concat('; Caption: ', $caption)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="insert-executors">
        <xsl:if test="executor[@type = 'TYPESETTER']">
            <tr>
                <td>Supplier (typesetter):</td>
                <td>
                    <xsl:call-template name="insert-executor">
                        <xsl:with-param name="type" select="'TYPESETTER'"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="executor[@type = 'COMPOSITOR']">
            <tr>
                <td>Supplier (compositor):</td>
                <td>
                    <xsl:call-template name="insert-executor">
                        <xsl:with-param name="type" select="'COMPOSITOR'"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="executor[@type = 'PRINTER']">
            <tr>
                <td>Printer:</td>
                <td>
                    <xsl:call-template name="insert-executor">
                        <xsl:with-param name="type" select="'PRINTER'"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="$ORDER = 'OFFPRINTS' or $ORDER = 'ITEM-OFFPRINTS' or $ORDER = 'SEND-ITEM-OFFPRINTS' or $ORDER = 'PRINT-BIND'">
            <xsl:if test="executor[@type = 'BINDER']">
                <tr>
                    <td>Binder:</td>
                    <td>
                        <xsl:call-template name="insert-executor">
                            <xsl:with-param name="type" select="'BINDER'"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>
        <xsl:if test="executor[@type = 'PSP']">
            <tr>
                <td>Local supplier manager:</td>
                <td>
                    <xsl:call-template name="insert-executor">
                        <xsl:with-param name="type" select="'PSP'"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="executor[@type = 'ES']">
            <tr>
                <td>Elsevier contact person:</td>
                <td>
                    <xsl:call-template name="insert-executor">
                        <xsl:with-param name="type" select="'ES'"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="executor[@type = 'CU-SUPPLIER']">
            <tr>
                <td>CU supplier:</td>
                <td>
                    <xsl:call-template name="insert-executor">
                        <xsl:with-param name="type" select="'CU-SUPPLIER'"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template name="insert-executor">
        <xsl:param name="type"/>
        <xsl:choose>
            <xsl:when test="$type = 'TYPESETTER' or $type = 'COMPOSITOR'">
                <xsl:for-each select="executor[@type = $type]">
                    <xsl:apply-templates select="exec-name"/>
                    <xsl:if test="position() != last()">
                        <xsl:text>; </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$type = 'PSP' or $type = 'ES' or $type = 'PRINTER' or $type = 'BINDER' or $type = 'CU-SUPPLIER'">
                <xsl:for-each select="executor[@type = $type]">
                    <xsl:apply-templates select="exec-name"/>
                    <xsl:if test="aff/tel">
                        <xsl:value-of select="concat(' (', aff/tel, ')')"/>
                    </xsl:if>
                    <xsl:if test="position() != last()">
                        <xsl:text>; </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="insert-offprint-payment">
        <!-- Current node is item-info or row -->
        <xsl:choose>
            <xsl:when test="offprint-payment">
                <xsl:value-of select="offprint-payment/@payment"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>N/A</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- / Called templates -->




</xsl:stylesheet>
