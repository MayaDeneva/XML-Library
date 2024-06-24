<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Детайли</title>

                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
                <style>
                    body {
                    margin: 0; /* Remove default body margin */
                    padding: 0; /* Remove default body padding */
                    }
                    .img-container {
                    position: relative;
                    height: 20em;
                    background-image: url('images/library-1.jpg');
                    background-size: cover;
                    background-position: center;
                    background-repeat: no-repeat;
                    opacity: 0.9;
                    display:flex;
                    padding-left: 10em;
                    align-content: center;
                    align-items: flex-start;
                    justify-content: center;
                    flex-direction: column;

                    }

                    .title {
                    display:flex;
                    align-items: center;

                    width: auto;
                    height: 50%;
                    background-color: black;
                    font-size: 2em;
                    color: antiquewhite;

                    padding: 2em 4em 2em 4em;
                    opacity: 0.95;
                    }

                    .catalog-header {
                    text-align: center;
                    font-size: 2em;
                    background-color: black;
                    padding: 0.5em;
                    color: antiquewhite;
                    opacity: 0.9;
                    margin-top: 0;
                    }
                    .table-container {
                    width:70%;
                    margin: 0 auto;
                    text-align: center;
                    }
                    .table-hover td:hover {
                    cursor: pointer;
                    }
                    .table-div {
                    display:flex;
                    justify-content: center;
                    }
                    .table {
                    width: 50%;
                    text-align: center;
                </style>
            </head>
            <body>
                <div class="img-container">
                    <div class="title">
                        <h1><xsl:value-of select="library/libraryName"/></h1>
                    </div>

                </div>
                <h2 class ="catalog-header">Детайли</h2>
                <xsl:apply-templates select="/library/publishedEdition[1]"/>

            </body>
        </html>
    </xsl:template>
    <xsl:template match="publishedEdition">
        <div class="table-div">
            <table class="table">
                <thead>
                    <tr>
                        <th><b><xsl:value-of select="title"/></b></th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="author">
                        <tr><td>Автор:  <xsl:value-of select="concat(name/firstName, ' ', name/lastName)"/></td></tr>
                    </xsl:for-each>


                    <tr><td>Жанр: <xsl:value-of select="genre"/></td></tr>
                    <xsl:if test="book/yearPublished">
                        <tr><td>Година на издаване: <xsl:value-of select="book/yearPublished"/></td></tr>
                    </xsl:if>

                    <tr><td>Издателство: <xsl:value-of select="publisher"/></td></tr>
                    <tr><td>ISBN: <xsl:value-of select="@ISBN"/></td></tr>
                    <tr><td>Издание: <xsl:value-of select="book/edition"/></td></tr>
                    <tr><td>Страници: <xsl:value-of select="pages"/></td></tr>

                    <xsl:if test="periodical/issueNumber">
                        <tr><td>Брой: <xsl:value-of select="periodical/issueNumber"/></td></tr>
                    </xsl:if>

                    <xsl:if test="periodical/frequency">
                        <tr><td>Поредност: <xsl:value-of select="periodical/frequency"/></td></tr>
                    </xsl:if>

                    <xsl:if test="description">
                        <tr><td>Описание: <xsl:value-of select="description"/></td></tr>
                    </xsl:if>

                    <xsl:if test="book/@cover">
                        <tr><td>Корица: <xsl:value-of select="book/@cover"/></td></tr>
                    </xsl:if>

                    <tr><td>Наличност: <xsl:value-of select="copies/@inhand"/></td></tr>
                    <xsl:if test="note">
                        <tr><td>Бележка: <xsl:value-of select="note"/></td></tr>
                    </xsl:if>


                </tbody>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>