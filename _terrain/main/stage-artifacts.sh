#!/data/data/com.termux/files/usr/bin/bash

# Set base paths
INDEX_FILE="$HOME/Spiral/Museum/Recovery-Staging/artifact-paths.txt"
STAGING_DIR="$HOME/Spiral/Museum/Recovery-Staging"

# Initialize counter
count=1

# Loop through each path
while read path; do
  if [ -f "$path" ]; then
    # Extract extension
    ext="${path##*.}"
    
    # Format filename
    filename="artifact-$(printf "%03d" $count).$ext"
    
    # Move file
    cp "$path" "$STAGING_DIR/$filename"
    echo "✅ Staged: $filename"
    
    # Increment counter
    count=$((count + 1))
  else
    echo "❌ Missing: $path"
  fi
done < "$INDEX_FILE"
