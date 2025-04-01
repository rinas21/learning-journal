#!/bin/bash

# GitHub credentials
GITHUB_USERNAME="rinas21"
GITHUB_TOKEN="rinas1998@#"  # Replace this with your actual token (make sure to URL-encode special characters if any)
REPO="github.com/rinas21/learning-journal.git"

# URL encode the token (replace special characters)
ENCODED_TOKEN=$(echo "$GITHUB_TOKEN" | jq -sRr @uri)

# Get today's date
TODAY=$(date +%Y-%m-%d)
YEAR=$(date +%Y)
MONTH=$(date +%B)

# Define the folder structure
NOTE_DIR="$HOME/Documents/developer-notes/$YEAR/$MONTH"
NOTE_FILE="$NOTE_DIR/$TODAY.md"

# Create the folder if it doesn't exist
mkdir -p "$NOTE_DIR"

# Create the markdown file if it doesn't exist
if [[ ! -f "$NOTE_FILE" ]]; then
    echo "# Notes for $TODAY" > "$NOTE_FILE"
    echo "Created $NOTE_FILE"
else
    echo "Note for $TODAY already exists."
fi

# Commit and push to Git
cd "$HOME/Documents/developer-notes" || exit
git add "$NOTE_FILE"
git commit -m "Add daily note for $TODAY"

# Push with authentication using URL encoding for token
git push https://$GITHUB_USERNAME:$ENCODED_TOKEN@$REPO main  # Change 'main' to your branch

echo "Committed and pushed $NOTE_FILE"
