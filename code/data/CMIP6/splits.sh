#!/bin/bash

split_file() {
    file=$1
    base_name="${file%.nc}"
    
    # Get file size using wc -c
    file_size=$(wc -c < "$file")
    half_size=$((file_size / 2))
    
    # Split the file
    dd if="$file" of="${base_name}.nc_part1" bs=$half_size count=1 2>/dev/null
    dd if="$file" of="${base_name}.nc_part2" bs=$half_size skip=1 2>/dev/null
    
    echo "Split $file into ${base_name}.nc_part1 and ${base_name}.nc_part2"
}

merge_file() {
    base_name=$1
    
    # Merge the files
    cat "${base_name}.nc_part1" "${base_name}.nc_part2" > "${base_name}.nc"
    
    echo "Merged ${base_name}.nc_part1 and ${base_name}.nc_part2 into ${base_name}.nc"
}

if [ "$1" = "--split" ]; then
    for file in *.nc; do
        if [ -f "$file" ]; then
            split_file "$file"
        fi
    done
elif [ "$1" = "--merge" ]; then
    for file in *.nc_part1; do
        if [ -f "$file" ]; then
            base_name="${file%.nc_part1}"
            merge_file "$base_name"
        fi
    done
else
    echo "Please specify either --split or --merge"
    exit 1
fi

echo "Operation completed."
