#!/bin/bash
# Repo cleanup and restructuring

echo "Removing unused files..."
rm -rf tests examples docs-old

echo "Ensuring entry point exists..."
cat <<EOF > src/index.js
import app from './app.js'
app.listen(4000, () => console.log("Server running on port 4000"))
EOF

echo "Adding npm scripts..."
npm pkg set scripts.start="node src/index.js"
npm pkg set scripts.dev="nodemon src/index.js"

echo "Repo cleanup complete."
