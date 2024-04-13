#!/bin/bash

# Define the API endpoint
API_ENDPOINT="https://api.heroku.com/apps"
# Define the output file name
OUTPUT_FILE="heroku_results.txt"
# Define the delay between requests (in seconds)
REQUEST_DELAY=0.1  # 10 requests per second

# Check if any arguments are provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <API_KEY_FILE>"
    exit 1
fi

# Read the API keys from the input file
API_KEY_FILE=$1

# Check if the API key file exists
if [ ! -f "$API_KEY_FILE" ]; then
    echo "Error: API key file '$API_KEY_FILE' not found."
    exit 1
fi

# Loop through each API key in the file
while IFS= read -r API_KEY; do
    # Append the API key to the output file
    echo "API Key: $API_KEY" >> "$OUTPUT_FILE"
    # Make the curl request with the API key and append results to output file
    curl -nX GET "$API_ENDPOINT" \
         -H "Accept: application/vnd.heroku+json; version=3" \
         -H "Authorization: Bearer $API_KEY" >> "$OUTPUT_FILE" 2>&1
    # Add a newline separator between API requests
    echo -e "\n--------------------------------------\n" >> "$OUTPUT_FILE"
    # Introduce a delay between requests
    sleep $REQUEST_DELAY
done < "$API_KEY_FILE"

echo "Curl requests completed. Results saved to $OUTPUT_FILE."

