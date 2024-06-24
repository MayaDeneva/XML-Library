<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Каталог</title>

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
                </style>
            </head>
            <body>
                <div class="img-container">
                    <div class="title">
                        <h1><xsl:value-of select="library/libraryName"/></h1>
                    </div>

                </div>
                <h2 class ="catalog-header">Книги</h2>
                <div class="table-container">
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Заглавие</th>
                                <th scope="col">Автор</th>
                                <th scope="col">Жанр</th>
                                <th scope="col">Година на издаване</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="library/book">
                                <tr>
                                    <td scope="row"><xsl:value-of select="title"/></td>
                                    <td><xsl:value-of select="author/name"/></td>
                                    <td><xsl:value-of select="genre"/></td>
                                    <td><xsl:value-of select="yearPublished"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>

                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>