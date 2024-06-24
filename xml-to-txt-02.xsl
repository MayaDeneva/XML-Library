<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />


    <xsl:template match="/">
        <xsl:apply-templates select="//publishedEdition" />
    </xsl:template>

    <xsl:template match="publishedEdition">

        <xsl:text>Заглавие: </xsl:text><xsl:value-of select="title"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Тип: </xsl:text><xsl:value-of select="@type"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>ISBN: </xsl:text><xsl:value-of select="@ISBN"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:if test="book/@cover">
            <xsl:text>Корица: </xsl:text><xsl:value-of select="book/@cover"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>

        <xsl:if test = "book/yearPublished">
            <xsl:text>Година на издаване: </xsl:text><xsl:value-of select="book/yearPublished"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>

        <xsl:if test="book/edition">
            <xsl:text>Издание: </xsl:text><xsl:value-of select="book/edition"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>

        <xsl:if test="periodical/issueNumber">
            <xsl:text>Брой: </xsl:text><xsl:value-of select="periodical/issueNumber"></xsl:value-of>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>
        <xsl:if test="periodical/frequency">
            <xsl:text>Честота на издаване: </xsl:text><xsl:value-of select="periodical/frequency"></xsl:value-of>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>

        <xsl:text>Жанр: </xsl:text><xsl:value-of select="genre"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:if test="description">
            <xsl:text>Описание: </xsl:text><xsl:value-of select="description"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>

        <xsl:text>Страници: </xsl:text><xsl:value-of select="pages"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:text>Автор: </xsl:text><xsl:value-of select="author/name/firstName"/>
        <xsl:text> </xsl:text> <xsl:value-of select="author/name/lastName"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Издателство: </xsl:text><xsl:value-of select="publisher"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Екземпляри: </xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Налични: </xsl:text><xsl:value-of select="copies/@inhand"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Заети: </xsl:text><xsl:value-of select="copies/@issued"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:if test="note">
            <xsl:text>Бележка: </xsl:text><xsl:value-of select="note"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>

        <xsl:text>---------------------</xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>