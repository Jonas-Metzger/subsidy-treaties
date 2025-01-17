#!/bin/bash
echo "Downloading MERRA2 data from subset_M2IMNXASM.txt ..."
echo "If links are expired, recreate subset_M2IMNXASM.txt at https://disc.gsfc.nasa.gov/datasets/M2IMNXASM_5.12.4/summary?keywords=M2IMNXASM"
echo "You need to create a bearer token and set it in this script. See https://urs.earthdata.nasa.gov/documentation/for_users/user_token"

NASATOKEN=YOUR_BEARER_TOKEN

# Check if the token is different from the placeholder
if [ "$NASATOKEN" == "YOUR_BEARER_TOKEN" ]; then
    echo "Error: NASATOKEN is not set."
    exit 1
fi

# Check if the input file exists
if [ ! -f "subset_M2IMNXASM.txt" ]; then
    echo "Error: Input file not found."
    exit 1
fi

# Read the file line by line and download each URL
while IFS= read -r url
do
    # Skip empty lines
    if [ -z "$url" ]; then
        continue
    fi

    echo "Downloading: $url"

    # Remove any trailing whitespace
    url=$(echo "$url" | tr -d '[:space:]')

    # Use curl directly in the script
    if curl -H "Authorization: bearer $NASATOKEN" -LO --url $url; then
        echo "Download successful: $url"
    else
        echo "Download failed: $url"
    fi

    # Add a small delay to avoid overwhelming the server
    sleep 2
done < "subset_M2IMNXASM.txt"

echo "All downloads completed."
