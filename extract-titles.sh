#!/bin/bash

# Output CSV file
OUTPUT="legacy-website/first100-import.csv"

# Write CSV header
echo "File Path,Title,Slug,Language,Series" > "$OUTPUT"

# Find all HTML files
find legacy-website/first100/ -type f -name '*.html' | while read -r file
do
    # Try <title> first
    title=$(grep -oPm1 "(?<=<title>)[^<]+" "$file")
    
    # If no <title>, try <h1>
    if [ -z "$title" ]; then
        title=$(grep -oPm1 "(?<=<h1>)[^<]+" "$file")
    fi

    # If still empty, try first heading of any level
    if [ -z "$title" ]; then
        title=$(grep -oPm1 "(?<=<(h[1-6])>)[^<]+" "$file")
    fi

    # If still empty, fallback to filename
    if [ -z "$title" ]; then
        title=$(basename "$file" .html)
    fi

    # Decode HTML entities to real UTF-8
    title_decoded=$(echo "$title" | php -r 'echo html_entity_decode(file_get_contents("php://stdin"));')

    # Create slug from decoded title
    slug=$(echo "$title_decoded" | iconv -c -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')

    # Language detection
    if echo "$title_decoded" | grep -qP '[^\x00-\x7F]'; then
        # If folder name gives hint (e.g., japanese/, french/, albanian/)
        if echo "$file" | grep -qi 'japanese'; then
            language="Japanese"
        elif echo "$file" | grep -qi 'french'; then
            language="French"
        elif echo "$file" | grep -qi 'albanian'; then
            language="Albanian"
        elif echo "$file" | grep -qi 'german\|geschichte'; then
            language="German"
        else
            language="Unknown"
        fi
    else
        language="English"
    fi

    # Output CSV line
    # Remove the "legacy-website/first100/" prefix
    short_file=$(echo "$file" | sed 's|.*first100/||')

    # Then echo the short file path instead of full
    echo "\"${short_file}\",\"${title_decoded}\",\"${slug}\",\"${language}\",\"First 100\"" >> "$OUTPUT"

done

echo "✅ Extraction complete. File saved to $OUTPUT"

