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

Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"README_00.md\", output_file_prefix = \"generated_chapter_0\")" || exit 42
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"README_01.md\", output_file_prefix = \"generated_chapter_1\")" || exit 42
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"README_02.md\", output_file_prefix = \"generated_chapter_2\")" || exit 42


{ \
  cat generated_chapter_0_en.md ; echo " " ; echo "\pagebreak" ; echo " "; \
  cat generated_chapter_1_en.md ; echo " " ; echo "\pagebreak" ; echo " "; \
  cat generated_chapter_2_en.md ; echo " " ; echo "\pagebreak" ; echo " "; \
} >> generated_book_en.md

{ \
  cat generated_chapter_0_sv.md ; echo " " ; echo "\pagebreak" ; echo " "; \
  cat generated_chapter_1_sv.md ; echo " " ; echo "\pagebreak" ; echo " "; \
  cat generated_chapter_2_sv.md ; echo " " ; echo "\pagebreak" ; echo " "; \
} >> generated_book_sv.md

# Table of Content
# Code has highlights following the tango color scheme
# Thinner margin of 0.5 inch
# Do not cut code blocks
pandoc generated_book_en.md -o book_en.pdf --toc --toc-depth=1 --highlight-style=book_style.theme -V geometry:margin=0.5in
pandoc generated_book_sv.md -o book_sv.pdf --toc --toc-depth=1 --highlight-style=book_style.theme -V geometry:margin=0.5in

cp book_en.pdf ../../books/book_1_no_front_page_en.pdf
cp book_sv.pdf ../../books/book_1_no_front_page_sv.pdf

cd ../../books || exit 42

pdfunite front_page_1_en.pdf book_1_no_front_page_en.pdf book_1_en.pdf
pdfunite front_page_1_sv.pdf book_1_no_front_page_sv.pdf book_1_sv.pdf

# Make booklet
bookletimposer -a book_1_en.pdf -o booklet_1_en.pdf
bookletimposer -a book_1_sv.pdf -o booklet_1_sv.pdf

# Cleanup
rm book_1_no_front_page_en.pdf
rm book_1_no_front_page_sv.pdf
