#!/bin/bash

# Prompt for document name
echo ">> Enter document name (without .md extension):"
read -p ">> " doc_name

# Validate input
if [[ -z "$doc_name" ]]; then
  echo "Error: Document name cannot be empty"
  exit 1
fi

# Clean the input - remove spaces and special characters
doc_name=$(echo "$doc_name" | tr -cd '[:alnum:]-_')

CWD=$(pwd)
DOCS_DIR="$CWD/documents"

# Create documents directory if it doesn't exist
mkdir -p "$DOCS_DIR"

# Function to get next available number
get_next_number() {
  local max_num=0
  
  # Find the highest existing number
  for file in "$DOCS_DIR"/*-*.md; do
    if [ -f "$file" ]; then
      num=$(basename "$file" | cut -d'-' -f1)
      if [ "$num" -gt "$max_num" ]; then
        max_num=$num
      fi
    fi
  done
  
  # Return next number
  echo $((max_num + 1))
}

# Function to generate a random string
generate_random_string() {
  echo $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
}

# Get the next sequential number
next_number=$(get_next_number)
rnd_string=$(generate_random_string)

# Changed filename format
filename="$next_number-$doc_name-$rnd_string.md"
filepath="$DOCS_DIR/$filename"

# Function to create technical specification template
create_tech_spec_template() {
    cat > "$1" << EOL
# ${doc_name}

Created: $(date '+%Y-%m-%d %H:%M:%S')

## Overview

[Provide a brief overview of this specification and its purpose within the VTubersTV platform]

## Goals

- [Primary goal of this specification]
- [Secondary goals]
- [Additional objectives]

## Technical Details

### Requirements

- [List technical requirements]
- [Dependencies]
- [Prerequisites]

### Architecture

[Describe the architectural approach and design decisions]

### Implementation Details

[Provide specific implementation guidelines, patterns, or requirements]

### Security Considerations

[Detail any security requirements, concerns, or mitigations]

## Integration Points

[Describe how this component integrates with other parts of VTubersTV]

## Testing Strategy

[Outline testing requirements and approaches]

## References

- [Related specifications]
- [External resources]
- [Dependencies]

## Notes

[Additional considerations, edge cases, or important notes]
EOL
}

# Function to create API specification template
create_api_spec_template() {
    cat > "$1" << EOL
# ${doc_name}

Created: $(date '+%Y-%m-%d %H:%M:%S')

## API Overview

[Brief description of the API's purpose and functionality]

## Endpoints

### [Endpoint Name]

\`\`\`
Method: [GET/POST/PUT/DELETE]
Path: /api/v1/[path]
\`\`\`

#### Request

##### Headers
\`\`\`json
{
    "Content-Type": "application/json",
    "Authorization": "Bearer [token]"
}
\`\`\`

##### Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| | | | |

##### Body
\`\`\`json
{
}
\`\`\`

#### Response

##### Success (200 OK)
\`\`\`json
{
}
\`\`\`

##### Errors
| Status Code | Description |
|-------------|-------------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |

## Authentication

[Authentication requirements and methods]

## Rate Limiting

[Rate limiting details and quotas]

## Notes

[Additional considerations and important notes]
EOL
}

# Function to create feature specification template
create_feature_spec_template() {
    cat > "$1" << EOL
# ${doc_name}

Created: $(date '+%Y-%m-%d %H:%M:%S')

## Feature Overview

[Brief description of the feature and its purpose]

## User Stories

### Story 1
- As a [user type]
- I want to [action]
- So that [benefit]

## Requirements

### Functional Requirements
- [List of functional requirements]

### Non-Functional Requirements
- [List of non-functional requirements]

## UI/UX Design

[Description of user interface and experience requirements]

### Wireframes

[Links to wireframes or design mockups]

## Technical Implementation

### Components
- [List of components to be created/modified]

### Data Model
- [Required data structure changes]

### Dependencies
- [External dependencies]

## Testing Requirements

### Unit Tests
- [Unit testing requirements]

### Integration Tests
- [Integration testing requirements]

### User Acceptance Testing
- [UAT scenarios]

## Notes

[Additional considerations and important notes]
EOL
}

# Prompt for template selection
echo "Select template type:"
echo "1) Technical Specification"
echo "2) API Specification"
echo "3) Feature Specification"
read -p "Enter choice (1-3): " template_choice

# Create the document with selected template
case $template_choice in
    1)
        create_tech_spec_template "$filepath"
        ;;
    2)
        create_api_spec_template "$filepath"
        ;;
    3)
        create_feature_spec_template "$filepath"
        ;;
    *)
        echo "Invalid choice. Using Technical Specification template."
        create_tech_spec_template "$filepath"
        ;;
esac

# Update README.md
readme_path="$CWD/README.md"
if [ -f "$readme_path" ]; then
    # Create temporary file
    tmp_file=$(mktemp)
    
    # Process the file line by line
    while IFS= read -r line; do
        echo "$line" >> "$tmp_file"
        
        # After Table of Contents, add new entry
        if [[ "$line" == "## Table of Contents" ]]; then
            echo "" >> "$tmp_file"  # Empty line after header
            # Read existing entries to maintain order
            grep -E "^[0-9]+\. \[.*\]" "$readme_path" | sort -n >> "$tmp_file"
            # Add new entry
            echo "$next_number. [$doc_name](./documents/$filename)" >> "$tmp_file"
            # Skip until we find the next section
            while IFS= read -r skip_line && [[ ! "$skip_line" =~ ^## ]]; do
                continue
            done
        fi
    done < "$readme_path"

    # Replace original file with temporary file
    mv "$tmp_file" "$readme_path"
    echo "✓ Updated README.md table of contents"
fi

echo "✓ Created $filename successfully"
echo "  Location: $filepath"
