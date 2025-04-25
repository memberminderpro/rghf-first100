#!/bin/bash

# Define source and target
HTML_FOLDER="legacy-website/first100/"
OUTPUT_FOLDER="legacy-website/legacy-docs"
OUTPUT_FILE="$OUTPUT_FOLDER/LEGACY-NAVIGATION.md"

# Create output directory if missing
mkdir -p "$OUTPUT_FOLDER"

# Create or clear the output file
echo "# Legacy Navigation Links" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Find all HTML files and extract <a href="..."> links
find "$HTML_FOLDER" -type f -name '*.html' | while read -r html_file; do
    # Optional: Print filename as a subheader for context
    echo "## $(basename "$html_file")" >> "$OUTPUT_FILE"

    # Extract and format links
    grep -oP '<a\s+[^>]*href="\K[^"]+' "$html_file" | while read -r url; do
        # Optional: Normalize absolute URLs if needed (we can skip that for now)
        echo "- [$url]($url)" >> "$OUTPUT_FILE"
    done

    echo "" >> "$OUTPUT_FILE"
done

echo "✅ Legacy navigation links extracted to $OUTPUT_FILE."
