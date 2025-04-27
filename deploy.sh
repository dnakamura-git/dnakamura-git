#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project
hugo

# Go to public folder
cd public

# Add changes
git add .

# Commit with timestamp or custom message
msg="rebuilding site $(date)"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push to blog (GitHub Pages) repo
git push origin master

# Return to root
cd ..
