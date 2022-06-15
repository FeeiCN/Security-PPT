#!/bin/bash
# Generate tree.txt and each slide PDF's text
# Usage  : ./generate-tree-and-slide-text.sh
# Author : Feei <feei#feei.cn>
# Updated: 15/Jun/2022

# Generate tree
tree > tree.txt

# Generate each slide PDF to text
if ! command -v pdftotext &> /dev/null
then
  echo "xpdf tool could not be found, you can use \`brew install xpdf\`!"
  exit
fi

find . -type f -name '*.pdf' -print0 | while IFS= read -r -d '' file; do
  echo "Generate $file to $file.txt"
  pdftotext "$file" "$file.txt"
done