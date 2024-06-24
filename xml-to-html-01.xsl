<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" />

    <xsl:template match="/">
    <html>
        <head>
            <title>Library Information</title>
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

                .affiliates-header {
                text-align: center;
                font-size: 2em;
                background-color: black;
                padding: 0.5em;
                color: antiquewhite;
                opacity: 0.9;
                margin-top: 0;
                }
            </style>
        </head>
        <body>
            <div class="img-container">
                <div class="title">
                    <h1><xsl:value-of select="library/libraryName"/></h1>
                </div>

            </div>
            <h2 class ="affiliates-header">Филиали</h2>
            <div class="affiliate-div">
                <ul class="affiliates-list">
                    <xsl:apply-templates select="library/address"/>
                </ul>
            </div>

        </body>
    </html>
    </xsl:template>

    <xsl:template match="address">

            <xsl:choose>
                <!-- Check if the address has an affiliate element -->
                <xsl:when test="affiliate">
                    <!-- This is an affiliate address -->
                    <li>
                        <h2><xsl:value-of select="affiliate"/></h2>
<!--                        <xsl:value-of select="affiliate"/>-->
                        <xsl:value-of select="city"/>
                        <xsl:text> </xsl:text> <!-- spacing -->
                        <xsl:value-of select="street"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="district"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="postalCode"/>
                    </li>
                </xsl:when>
                <!-- If no affiliate, treat it as the main library address -->
                <xsl:otherwise>
                    <h2>Главен адрес</h2>
                    <li><xsl:value-of select="city"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="street"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="district"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="postalCode"/></li>

                </xsl:otherwise>
            </xsl:choose>

            <!-- Generate Google Maps link using the address -->
            <p>
                <a target="_blank" href="{concat('https://www.google.com/maps?q=', city, ' ', street, ' ', district, ' ', postalCode)}">View on Google Maps</a>
            </p>

    </xsl:template>

</xsl:stylesheet>