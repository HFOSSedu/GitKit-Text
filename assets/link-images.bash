#!/bin/bash

# Link each of the images folders here so they can
# be stored with their source and still get
# pulled into the built document.

PROJECT_DIR="/workspaces/GitKit-Text"

rm -rf "$PROJECT_DIR/assets/images"
mkdir "$PROJECT_DIR/assets/images"

ln --symbolic --force \
   "$PROJECT_DIR/source/ch-community-collaboration/images" \
   "$PROJECT_DIR/assets/images/ch-community-collaboration"
