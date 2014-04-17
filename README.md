# xslt-cookbook

Jonathan Nicholson

The purpose of this project is to use XSL Transformations to convert
an XML recipe file into html.

Each recipe can have:

* a title
* a list of ingredients
* instructions for preparation
* additional comments
* nutritional information.

## Requirements

The final HTML document must format each recipe as follows:

1. The recipe's title as a centered `h2` tag
2. An `h3` tag indicating the section is the list of ingredients followed
by a table of the ingredients.
3. preparation instructions
    1. An `h3` tag that says "preparation"
    2. An ordered list of steps
5. comments - with an `h3` header
6. table of nutrition information with an `h3` header.
