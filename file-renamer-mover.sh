#!/bin/bash

source_folder="$1"
destination_folder="$2"
prefix="$3"

# Loop through all files in the source folder and its subfolders
find "$source_folder" -type f | while read file; do
    # Get the folder name of the file
    folder_name="$(basename "$(dirname "$file")")"

    # Generate new file name by adding a prefix or suffix and the folder name
    new_file_name="$prefix$folder_name-$(basename "$file")"

    # Generate full path to the source and destination files
    source_file_path="$file"
    destination_file_path="$destination_folder/$new_file_name"

    # Copy the file to the destination folder with the new name
    cp -p "$source_file_path" "$destination_file_path"
done