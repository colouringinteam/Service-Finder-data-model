<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="servicedata">
        <html lang="en">
        <head>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

            <title>Service Finder preferred data model</title>

            <link rel="stylesheet" href="style.css"/>
            <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" type="text/css"/>
            
        </head>
        <body>

            <h1>Service Finder preferred data model</h1>

            <table class="notes">
                <thead>
                    <tr><th colspan="2">Notes</th></tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">
                            <p>The model below represents data for a single example service. The data elements you see in the table below are all attributes (e.g. <i>serviceid="123456"</i>) of the root node of the XML for this service.</p>
                            <p>In general, attributes have been used for data that is primarily in place to allow the system to work correctly, and XML nodes/elements are used for anything designed to be human-readable.</p>
                            <p>Root node attributes would all be mandatory, with appropriate 'null' values to be agreed within the API specification.</p>
                            <p>Within the graphical representation of the model two highlight colours are used. <span style="background:#FFEEEE;">Pink</span> elements are mandatory for all services. <span style="background:#FFEECC;">Orange</span> elements show sets where at least one of the child elements is required.</p>
                        </td>
                    </tr>
                </tbody>
            </table>

            <table class="attributes">
                <thead>
                    <tr>
                        <th colspan="2">Root node attributes</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="@*">
                        <tr>
                            <th><xsl:value-of select="name()"/></th>
                            <td><xsl:value-of select="."/></td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
            
            <ul class="primary">
                <xsl:for-each select="*">
                    <li>
                    <xsl:choose>
                        <xsl:when test="@required='YES'">
                            <xsl:attribute name="class"><xsl:text>required</xsl:text></xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@required='ONEOF'">
                            <xsl:attribute name="class"><xsl:text>oneof</xsl:text></xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <h2 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h2>
                    <xsl:if test="count(*) = 0">
                        <p><xsl:value-of select ="."/></p>
                    </xsl:if>
                    <xsl:if test="count(*) != 0">
                        <ul>
                        <xsl:for-each select="*">
                            <li>
                            <xsl:choose>
                                <xsl:when test="@required='YES'">
                                    <xsl:attribute name="class"><xsl:text>required</xsl:text></xsl:attribute>
                                </xsl:when>
                                <xsl:when test="@required='ONEOF'">
                                    <xsl:attribute name="class"><xsl:text>oneof</xsl:text></xsl:attribute>
                                </xsl:when>
                            </xsl:choose>
                                <h3 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h3>
                                <xsl:if test="count(*) = 0">
                                    <p><xsl:value-of select ="."/></p>
                                </xsl:if>
                                <xsl:if test="count(*) != 0">
                                    <ul>
                                    <xsl:for-each select="*">
                                        <xsl:if test="local-name()='p'">
                                            <li><xsl:value-of select ="."/></li>
                                        </xsl:if>
                                        <xsl:if test="not(local-name()='p')">
                                            <li>
                                            <xsl:choose>
                                                <xsl:when test="@required='YES'">
                                                    <xsl:attribute name="class"><xsl:text>required</xsl:text></xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="@required='ONEOF'">
                                                    <xsl:attribute name="class"><xsl:text>oneof</xsl:text></xsl:attribute>
                                                </xsl:when>
                                            </xsl:choose>
                                                <h4 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h4>
                                                <xsl:if test="count(*) = 0">
                                                    <p><xsl:value-of select ="."/></p>
                                                </xsl:if>
                                                <xsl:if test="count(*) != 0">
                                                    <ul>
                                                    <xsl:for-each select="*">
                                                        <xsl:if test="local-name()='p'">
                                                            <li><xsl:value-of select ="."/></li>
                                                        </xsl:if>
                                                        <xsl:if test="not(local-name()='p')">
                                                        <li>
                                                            <xsl:choose>
                                                                <xsl:when test="@required='YES'">
                                                                    <xsl:attribute name="class"><xsl:text>required</xsl:text></xsl:attribute>
                                                                </xsl:when>
                                                                <xsl:when test="@required='ONEOF'">
                                                                    <xsl:attribute name="class"><xsl:text>oneof</xsl:text></xsl:attribute>
                                                                </xsl:when>
                                                            </xsl:choose>
                                                            <h5 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h5>
                                                            <xsl:if test="count(*) = 0">
                                                                <p><xsl:value-of select ="."/></p>
                                                            </xsl:if>
                                                        </li>
                                                        </xsl:if>
                                                    </xsl:for-each>
                                                    </ul>
                                                </xsl:if>
                                            </li>
                                        </xsl:if>
                                    </xsl:for-each>
                                    </ul>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                        </ul>
                    </xsl:if>
                </li>
                </xsl:for-each>
            </ul>

        </body>
        </html>
    </xsl:template>

    <xsl:template name="genPath">
        <xsl:param name="prevPath"/>
        <xsl:variable name="currPath" select="concat(' / ',name(),$prevPath)"/>
        <xsl:for-each select="parent::*">
            <xsl:call-template name="genPath">
                <xsl:with-param name="prevPath" select="$currPath"/>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:if test="not(parent::*)">
            <xsl:value-of select="$currPath"/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
