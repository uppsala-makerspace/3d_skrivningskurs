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

# Rscript -e 'splimata::split_tabs(input_file_name = "docs/kurserna/README.md", output_file_prefix = "docs/kurserna/generated")'
cp docs/chapters/0_install_and_setup_prusa_slicer/README.md docs/chapters/0_install_and_setup_prusa_slicer/generated_sv.md
sed -i '/^---$/,/^---$/d' docs/chapters/0_install_and_setup_prusa_slicer/generated_sv.md
Rscript scripts/replace_rel_url_by_abs_url.R docs/chapters/0_install_and_setup_prusa_slicer/generated_sv.md https://uppsala-makerspace.github.io/3d_skrivningskurs/chapters/0_install_and_setup_prusa_slicer/
sed -i 's/^# .*$/# Att installera och konfigurera PrusaSlicer för vår Prusa 3D skrivarna/g' docs/chapters/0_install_and_setup_prusa_slicer/generated_sv.md
sed -i 's/^\\pagebreak$//g' docs/chapters/0_install_and_setup_prusa_slicer/generated_sv.md



# Rscript -e 'splimata::split_tabs(input_file_name = "docs/kurserna/README.md", output_file_prefix = "docs/kurserna/generated")'
cp docs/chapters/1_print/README.md docs/chapters/1_print/generated_sv.md
sed -i '/^---$/,/^---$/d' docs/chapters/1_print/generated_sv.md
Rscript scripts/replace_rel_url_by_abs_url.R docs/chapters/1_print/generated_sv.md https://uppsala-makerspace.github.io/loedningskurs/chapters/1_print/
sed -i 's/^# .*$/# Att skriva ut med en Prusa 3D skrivare/g' docs/chapters/1_print/generated_sv.md
sed -i 's/^\\pagebreak$//g' docs/chapters/1_print/generated_sv.md
