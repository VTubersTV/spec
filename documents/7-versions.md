---
title: Versioning
---

# Versioning

Created: 2025-01-20 22:04:19 UTC

## Overview

This specification defines the versioning system for VTubersTV, implementing a dual versioning approach that serves both internal development needs and public-facing communication.

## Goals

- Establish a consistent and clear versioning system for the entire platform
- Provide semantic versioning for internal development tracking
- Create an engaging and user-friendly public versioning scheme
- Define clear guidelines for version progression and management

## Technical Details

### Requirements

- Must support semantic versioning (MAJOR.MINOR.PATCH)
- Must support pre-release and build metadata tags
- Must integrate with package.json and git tags
- Must support public-facing thematic versioning
- Must maintain mapping between internal and public versions

### Architecture

#### Internal Versioning
- Format: `MAJOR.MINOR.PATCH[-PRERELEASE][+BUILD]`
- Examples:
  - Standard: `1.0.0`
  - Pre-release: `1.0.0-alpha.1`
  - Build metadata: `1.0.0+build123`

#### Public Versioning
- Format: `<Theme>-<Major.Minor>`
- Examples:
  - `Aurora-1.1`
  - `Nebula-2.0-beta`

### Implementation Details

1. Version Control Integration
```bash
# Git tag format for internal versions
git tag -a v1.0.0 -m "Release v1.0.0"

# Package.json
{
  "version": "1.0.0"
}
```

2. Version Mapping System
```json
{
  "internalVersion": "2.1.0",
  "publicVersion": "Aurora-1.1",
  "releaseDate": "2024-01-01",
  "theme": "Aurora",
  "status": "stable"
}
```

3. Changelog Requirements
- Must include sections for:
  - Summary
  - New Features
  - Fixes
  - Breaking Changes

### Security Considerations

- Version numbers must not expose sensitive internal information
- Build metadata must be sanitized for public releases
- Version history must be immutable once published

## Integration Points

- Git version control system
- CI/CD pipeline version management
- Package management systems
- Public API version headers
- Documentation system
- Release management tools

## Testing Strategy

### Version Parsing Tests
- Validate internal version format
- Validate public version format
- Test version comparison logic

### Integration Tests
- Version mapping system
- Git tag integration
- Package.json synchronization

### Validation Tests
- Pre-release version handling
- Build metadata handling
- Theme name validation

## References

- [Semantic Versioning 2.0.0](https://semver.org/)
- [NPM Version Documentation](https://docs.npmjs.com/cli/v8/configuring-npm/package-json#version)
- [Git Tag Documentation](https://git-scm.com/book/en/v2/Git-Basics-Tagging)

## Notes

- Consider implementing automated version bumping tools
- Maintain a theme naming convention document
- Consider version deprecation policy
- Plan for long-term version support strategy