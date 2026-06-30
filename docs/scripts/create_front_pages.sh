#!/bin/bash

# Concatenate all Markdown files first, convert those to one PDF

build_folder="build"

rm -rf "${build_folder}"
mkdir "${build_folder}"

if [ ! -d "${build_folder}" ]; then 
  echo "Error: failed to create build folder"
  exit 1
fi

cp ../kapitel/front_pages/*.* "${build_folder}"
cd $build_folder || exit 42

pandoc front_page_1.md -o ../../books/front_page_1.pdf
