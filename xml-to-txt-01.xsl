<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:template match="/">

        <xsl:text>Име на библиотека: </xsl:text>
        <xsl:value-of select="//libraryName"></xsl:value-of>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Адреси: </xsl:text>
        <xsl:text>&#10;</xsl:text><!-- Знак за нов ред -->

        <xsl:apply-templates select="//address" />

    </xsl:template>

    <xsl:template match="address">

        <xsl:text>"</xsl:text>
        <xsl:value-of select="city" />
        <xsl:text>","</xsl:text>
        <xsl:value-of select="street" />
        <xsl:text>","</xsl:text>
        <xsl:value-of select="district" />
        <xsl:text>","</xsl:text>
        <xsl:value-of select="postalCode" />
        <xsl:text>"</xsl:text>

        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
