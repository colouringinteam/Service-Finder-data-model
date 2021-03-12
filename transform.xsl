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
            <link rel="preconnect" href="https://fonts.gstatic.com"/>
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet"/>
        </head>
        <body>

            <h1>Service Finder preferred data model</h1>

            <table class="attributes">
                <thead>
                    <th colspan="2">Root node attributes</th>
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
                    <h2 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h2>
                    <xsl:if test="count(*) = 0">
                        <p><xsl:value-of select ="."/></p>
                    </xsl:if>
                    <xsl:if test="count(*) != 0">
                        <ul>
                        <xsl:for-each select="*">
                            <li>
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
