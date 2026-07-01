#!/bin/bash

# Concatenate all Markdown files first, convert those to one PDF

build_folder=build

rm -rf build
mkdir build

if [ ! -d $build_folder ]; then 
  echo "Error: failed to create build folder"
  exit 1
fi


cp ../chapters/foreword/*.*                                 $build_folder; mv $build_folder/README.md $build_folder/README_00.md
cp ../chapters/0_install_and_setup_prusa_slicer/*.*         $build_folder; mv $build_folder/README.md $build_folder/README_01.md
cp ../chapters/1_print/*.*                                  $build_folder; mv $build_folder/README.md $build_folder/README_02.md

cp book_style.theme $build_folder

cd "${build_folder}" || exit 41

{ \
  cat README_00.md ; echo " " ; echo "\pagebreak" ; echo " "; \
  cat README_01.md ; echo " " ; echo "\pagebreak" ; echo " "; \
  cat README_02.md ; echo " " ; echo "\pagebreak" ; echo " "; \
} >> README.md

# Table of Content
# Code has highlights following the tango color scheme
# Thinner margin of 0.5 inch
# Do not cut code blocks
pandoc README.md -o book.pdf --toc --toc-depth=1 --highlight-style=book_style.theme -V geometry:margin=0.5in

cp book.pdf ../../books/book_1_no_front_page.pdf

cd ../../books || exit 42
pdfunite front_page_1.pdf book_1_no_front_page.pdf book_1.pdf

# Make booklet
bookletimposer -a book_1.pdf -o booklet_1.pdf

# Cleanup
rm book_1_no_front_page.pdf
