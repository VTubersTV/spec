---
layout: default
title: Home
nav_order: 1
permalink: /
---

# VTubersTV Technical Specifications

Welcome to the technical documentation for the VTubersTV platform. This site contains comprehensive specifications, architecture decisions, and templates for platform development.

## Key Sections

- [Documents](/documents/) - Core technical specifications and documentation
- [Templates](/templates/) - Standard templates for RFCs and ADRs
- [RFCs](/rfcs/) - Request for Comments proposals
- [Decisions](/decisions/) - Architecture Decision Records

## Core Documents

{% for doc in site.documents %}
- [{{ doc.title }}]({{ doc.url }})
{% endfor %}

## Templates

- [Architecture Decision Records (ADR)](./templates/adr.html)
- [Request for Comments (RFC)](./templates/rfc.html)

## Quick Links

- [GitHub Repository](https://github.com/vtuberstv/platform)
- [Contributing Guidelines](./contributing.html)
- [Discord Community](https://choco.rip/s/vtuberstv) 