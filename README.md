# Stacks Ancillary Resources

This repository contains the Terraform templates that are required to deploy the initial resources for Amido Stacks.

## Documenation

Full documentation can be found in the `docs/` directory. All documentation is written in Asciidoc format.

To generate the documentation as PDF document run the following command:

```
docker run -it --rm -v ${PWD}:/app -w /app amidostacks/runner-pwsh-asciidoctor:0.3.142-unstable pwsh -NoProfile -Command Build-Documentation -BasePath /app -Pdf -title Stacks-Ancillary-Resources
```
