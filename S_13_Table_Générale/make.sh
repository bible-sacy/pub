PAGES=$(echo ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{688..728}.png)
exiftool -overwrite_original -all= $PAGES
../txt2png.sh info.txt info.png
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --firstpagenum 163 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc S_13_Table_Générale.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Port-Royal" -Creator="Port-Royal" -Title="[S 13] Table générale des matières de la Sainte Bible" S_13_Table_Générale.pdf