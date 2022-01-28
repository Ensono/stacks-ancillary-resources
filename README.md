# Stacks Ancillary Resources

This repository contains the Terraform templates that are required to deploy the initial resources for Amido Stacks.

## Documenation

Full documentation can be found in the `docs/` directory. All documentation is written in Asciidoc format.

To generate the documentation as PDF document run the following command:

```
docker run -it --rm -v ${PWD}:/app -w /app russellseymour/pandoc-asciidoctor asciidoctor-pdf -a doctype="book" -o "Stacks Ancillary Resources.pdf" -D local/ docs/index.adoc
```
