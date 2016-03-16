#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Remove the public folder to make room for the gh-pages subtree
rm -rf public/*

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Use the standard GitHub 404 page
rm public/404.html

# Go To Public folder
cd public

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push to build repos.
git push origin master

# Come Back
cd ..

# Add changes to git.
git add -A

# Commit changes to source code
git commit -m "$msg"

# Push to source repos.
git push origin master 