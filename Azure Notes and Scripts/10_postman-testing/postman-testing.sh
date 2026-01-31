#!/bin/bash
# Run Postman API tests

echo "Running Postman tests..."
newman run postman-collection.json

echo "Postman testing complete."
