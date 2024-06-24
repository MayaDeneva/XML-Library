<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xal="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <library>
            <libraryName>
                <xsl:value-of select="//libraryName"/>
            </libraryName>
            <xsl:apply-templates select="//publishedEdition"/>
        </library>
    </xsl:template>

    <xsl:template match="publishedEdition[book]">
        <book>
            <title><xsl:value-of select="title"/></title>
            <xsl:for-each select="author">
                <author>
                    <name>
                        <xsl:value-of select="name/firstName"/>
                        <xsl:text> </xsl:text>
                        <xsl:if test="name/middleName">
                            <xsl:value-of select="name/middleName"/>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="name/lastName"/>
                    </name>
                </author>
            </xsl:for-each>
            <genre><xsl:value-of select="genre"/></genre>
            <yearPublished><xsl:value-of select="book/yearPublished"/></yearPublished>
        </book>
    </xsl:template>

    <xsl:template match="publishedEdition[periodical]">
        <periodical>
            <title><xsl:value-of select="title"/></title>
            <xsl:for-each select="author">
                <author>
                    <name><xsl:value-of select="name/firstName"/> <xsl:text> </xsl:text>
                        <xsl:if test="name/middleName">
                            <xsl:value-of select="name/middleName"/> <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="name/lastName"/></name>
                </author>
            </xsl:for-each>

            <genre><xsl:value-of select="genre"/></genre>
            <issueNumber><xsl:value-of select="periodical/issueNumber"/></issueNumber>
            <frequency><xsl:value-of select="periodical/frequency"/></frequency>
        </periodical>
    </xsl:template>

</xsl:stylesheet>
