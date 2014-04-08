<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-system="about:legacy-compat" />
    <xsl:template match="/">
        <html lang="en">
        <head>
            <title>Cookbook</title>
        </head>
        <body>
            <xsl:apply-templates />
        </body>
        </html>
    </xsl:template>

    <xsl:template match="cookbook">
        <h1>Cookbook</h1>  
        <div id="recepies">
           <xsl:apply-templates />
        </div> 
    </xsl:template>

   <xsl:template match="recipe">
        <article class="recipe">
            <h2><xsl:value-of select="title" /></h2>
            <section class="ingredients">
                <h3>Ingredients</h3>
                <table>
                    <thead>
                        <th>Ingredient</th>
                        <th>Amount</th>
                    </thead>
                    <tbody>
                       <xsl:apply-templates select="ingredient" />
                    </tbody>
                </table>
            </section>
        </article>
    </xsl:template>

    <xsl:template match="ingredient">
        <xsl:choose>
        <xsl:when test="ingredient">
            <tr>
            <th colspan="2">
                <xsl:value-of select="@name" /> 
            </th>
            </tr>
            <xsl:apply-templates select="ingredient" />
        </xsl:when>
        <xsl:otherwise>
            <tr>
                <td>
                    <xsl:value-of select="@name" /> 
                </td>
                <td>
                    <xsl:value-of select="@amount" />
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@unit" />
                    <xsl:if test="@unit and @amount!=1">
                        <xsl:text>s</xsl:text>
                    </xsl:if>
                </td>
            </tr>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="preparation">
        <li>
        </li>
    </xsl:template>


</xsl:stylesheet>
