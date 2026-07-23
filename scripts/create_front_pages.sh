#!/bin/bash

# Concatenate all Markdown files first, convert those to one PDF

build_folder="build"

rm -rf "${build_folder}"
mkdir "${build_folder}"

if [ ! -d "${build_folder}" ]; then 
  echo "Error: failed to create build folder"
  exit 1
fi

cp ../chapters/front_pages/*.* "${build_folder}"
cd $build_folder || exit 42

Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"front_page_1.md\", output_file_prefix = \"front_page_1\")" || exit 42

pandoc front_page_1_en.md -o ../../books/front_page_1_en.pdf
pandoc front_page_1_sv.md -o ../../books/front_page_1_sv.pdf
