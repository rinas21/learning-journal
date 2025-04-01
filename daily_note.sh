#!/bin/bash

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

# Navigate to the repository directory
cd "$HOME/Documents/developer-notes" || exit

# Add all changes
git add .

# Commit the changes with a message
git commit -m "Add daily note for $TODAY"

# Push to the remote repository
git push origin main  # Adjust the branch name if needed

echo "Committed and pushed $NOTE_FILE"
