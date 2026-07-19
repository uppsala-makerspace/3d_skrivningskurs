#!/bin/bash
#
# Create the pages for https://github.com/uppsala-makerspace/umstutorial
#
# Usage:
#
#   ./scripts/create_pages_for_umstutorial.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/create_pages_for_umstutorial.sh"
    echo " "
    exit 42
fi

# This will be the same for all generated pages
mkdocs_home_url="https://uppsala-makerspace.github.io/3d_skrivningskurs"
################################################################################
# Chapter 0
################################################################################
local_folder_rel_path="docs/chapters/0_install_and_setup_prusa_slicer"
local_folder_input_file="${local_folder_rel_path}/README.md"
local_folder_prefix_output_file="${local_folder_rel_path}/generated"
mkdocs_page_url="${mkdocs_home_url}/kurserna" # The page to link to; the rendered version of the source page
abs_url="${mkdocs_page_url}" # relative to absolute URLs assumes all mkdocs_page_urls are in their own folder
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${abs_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${abs_url} || exit 42
sed -i 's/^# .*$/# Installing and configuring PrusaSlicer for our 3D printers/g' ${generated_en}
sed -i 's/^# .*$/# Att installera och konfigurera PrusaSlicer för vår Prusa 3D skrivarna/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![3D printing course logo](3d_skrivningskurs_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![3D skrivningskurs logo](3d_skrivningskurs_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i "s/\\\\pagebreak//g" ${generated_en}
sed -i "s/\\\\pagebreak//g" ${generated_sv}
sed -i "s/\pagebreak//g" ${generated_en}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

################################################################################
# Chapter 1
################################################################################
# Still 1 language
# Rscript -e 'splimata::split_tabs(input_file_name = "docs/kurserna/README.md", output_file_prefix = "docs/kurserna/generated")'
cp docs/chapters/1_print/README.md docs/chapters/1_print/generated_sv.md
sed -i '/^---$/,/^---$/d' docs/chapters/1_print/generated_sv.md
Rscript scripts/replace_rel_url_by_abs_url.R docs/chapters/1_print/generated_sv.md https://uppsala-makerspace.github.io/loedningskurs/chapters/1_print/
sed -i 's/^# .*$/# Att skriva ut med en Prusa 3D skrivare/g' docs/chapters/1_print/generated_sv.md
sed -i 's/^\\pagebreak$//g' docs/chapters/1_print/generated_sv.md
sed -i '/^$/N;/^\n$/D' docs/chapters/1_print/generated_sv.md
