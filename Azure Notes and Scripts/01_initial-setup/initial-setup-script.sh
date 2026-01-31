#!/bin/bash
# Initial project setup script

echo "Cloning repository..."
git clone <https://github.com/AAYUSH412/Real-Estate-Website>
cd realestate-api

echo "Cleaning old folders..."
rm -rf old-config legacy dist build

echo "Creating folder structure..."
mkdir -p src/{routes,controllers,models,config,utils}

echo "Creating .env template..."
cat <<EOF > .env.example
MONGO_URI=
IMAGEKIT_PUBLIC_KEY=
IMAGEKIT_PRIVATE_KEY=
IMAGEKIT_URL_ENDPOINT=
SMTP_USER=
SMTP_PASS=
EOF

echo "Initial setup complete."
