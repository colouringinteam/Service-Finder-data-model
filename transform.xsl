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

            <link href='http://fonts.googleapis.com/css?family=Lato:900' rel='stylesheet' type='text/css'/>
            <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,700italic,300,700' rel='stylesheet' type='text/css'/>
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
            
            <ul>
                <xsl:for-each select="*">
                <li>
                    <h2 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h2>
                    <xsl:if test="count(*) = 0">
                        <p><xsl:value-of select ="."/></p>
                    </xsl:if>
                    <xsl:for-each select="*">
                    <ul>
                        <li>
                            <h3 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h3>
                            <xsl:if test="count(*) = 0">
                                <p><xsl:value-of select ="."/></p>
                            </xsl:if>
                            <xsl:for-each select="*">
                                <xsl:if test="local-name()='p'">
                                    <p><xsl:value-of select ="."/></p>
                                </xsl:if>
                                <xsl:if test="not(local-name()='p')">
                                    <ul>
                                        <li>
                                            <h4 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h4>
                                            <xsl:if test="count(*) = 0">
                                                <p><xsl:value-of select ="."/></p>
                                            </xsl:if>
                                            <xsl:for-each select="*">
                                                <xsl:if test="local-name()='p'">
                                                    <p><xsl:value-of select ="."/></p>
                                                </xsl:if>
                                                <xsl:if test="not(local-name()='p')">
                                                <ul>
                                                    <li>
                                                        <h5 class='tooltip'><xsl:value-of select ="local-name()"/><span class="tooltiptext"><xsl:call-template name="genPath"/></span></h5>
                                                        <xsl:if test="count(*) = 0">
                                                            <p><xsl:value-of select ="."/></p>
                                                        </xsl:if>
                                                    </li>
                                                </ul>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </li>
                                    </ul>
                                </xsl:if>
                            </xsl:for-each>
                        </li>
                    </ul>
                    </xsl:for-each>
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