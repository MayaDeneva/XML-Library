<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <library>
            <libraryName>
                <xsl:value-of select="//libraryName"/>
            </libraryName>
            <xsl:for-each select="//address">
                <address>
                    <xsl:choose>
                        <xsl:when test="affiliate">
                            <affiliate><xsl:value-of select="affiliate"/></affiliate>
                        </xsl:when>
                        <xsl:otherwise>
                            <main>Главен адрес</main>
                        </xsl:otherwise>
                    </xsl:choose>

                    <city><xsl:value-of select="city"/></city>
                    <street><xsl:value-of select="street"/></street>
                    <district><xsl:value-of select="district"/></district>
                    <postalCode><xsl:value-of select="postalCode"/></postalCode>
                </address>
            </xsl:for-each>
        </library>
    </xsl:template>
</xsl:stylesheet>


