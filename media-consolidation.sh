#!/bin/bash

SOURCE_DIRS=("legacy-website/first100/_include" "legacy-website/first100/images" "legacy-website/first100/_media")
TARGET_DIR="legacy-website/first100/media-assets"
ASSET_MAP="asset-map.csv"

# Create target dir and asset map
mkdir -p "$TARGET_DIR"
echo "Original Path,New Filename" > "$ASSET_MAP"

for src_dir in "${SOURCE_DIRS[@]}"; do
    find "$src_dir" -type f | while read -r src_file; do
        filename=$(basename "$src_file")
        foldername=$(basename "$(dirname "$src_file")" | sed 's/^_//') # remove leading underscore if any

        target_file="$TARGET_DIR/$filename"

        if [ ! -f "$target_file" ]; then
            # If no conflict, copy as-is
            cp "$src_file" "$target_file"
            # Only log if needed later
        else
            # Conflict: rename by prefixing folder
            new_filename="${foldername}-${filename}"
            cp "$src_file" "$TARGET_DIR/$new_filename"
            # Log mapping
            original_rel_path=$(echo "$src_file" | sed 's|legacy-website/first100/||')
            echo "$original_rel_path,$new_filename" >> "$ASSET_MAP"
        fi
    done
done

echo "✅ Media consolidation complete. Asset map saved to $ASSET_MAP."
