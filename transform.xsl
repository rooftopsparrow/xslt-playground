<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-system="about:legacy-compat" />

    <xsl:template match="/">
        <html lang="en">
        <head>
            <title>Cookbook</title>
            <link
              href='http://fonts.googleapis.com/css?family=Lato:100,400'
              rel='stylesheet'
              type='text/css'
            />
            <link rel="stylesheet" href="style.css" />
        </head>
        <body>
            <xsl:apply-templates />
        </body>
        </html>
    </xsl:template>

    <xsl:template match="cookbook">
        <h1>Cookbook</h1>
        <section id="recepies">
           <xsl:apply-templates />
        </section>
    </xsl:template>

   <xsl:template match="recipe">
        <article class="recipe">
            <h2 class="title">
                <xsl:value-of select="title" />
            </h2>
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
            <section class="preparation">
                <h3>Preparation</h3>
                <ol>
                   <xsl:apply-templates select=".//preparation" />
                </ol>
            </section>
            <xsl:if test="comment">
                <section class="comments">
                    <h3>Additional Comments</h3>
                    <xsl:apply-templates select="comment" />
                </section>
            </xsl:if>
            <section class="nutrition">
                <h3>Nutrition</h3>
                <table>
                    <thead>
                        <th>Calories</th>
                        <th>Fat</th>
                        <th>Carbohydrates</th>
                        <th>Protien</th>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="nutrition" />
                    </tbody>
                </table>
            </section>
        </article>
        <hr/>
    </xsl:template>

    <xsl:template match="ingredient">
        <xsl:if test="ingredient">
            <xsl:apply-templates select="ingredient" />
        </xsl:if>
    </xsl:template>

    <xsl:template match="ingredient[@amount='*']">
        <tr>
            <td colspan="2">
                <xsl:value-of select="@name" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="ingredient[@amount][@unit]">
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
    </xsl:template>


    <xsl:template match="preparation">
        <xsl:apply-templates select="step" />
    </xsl:template>

    <xsl:template match="step">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

    <xsl:template match="comment">
        <blockquote>
            <xsl:value-of select="." />
        </blockquote>
    </xsl:template>

    <xsl:template match="nutrition">
        <tr>
            <td>
                <xsl:value-of select="@calories" />
            </td>
            <td>
                <xsl:value-of select="@fat" />
            </td>
            <td>
                <xsl:value-of select="@carbohydrates" />
            </td>
            <td>
                <xsl:value-of select="@protein" />
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
