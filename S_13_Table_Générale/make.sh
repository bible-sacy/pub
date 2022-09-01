PAGES=$(echo ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{688..728}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --firstpagenum 163 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc S_13_Table_Générale.pdf
exiftool -overwrite_original -Title="[S 13] Table générale des matières de la Sainte Bible" -Author="Port-Royal" -Subject="$(tr '\n' ' ' <info.txt)" -Creator='https://bible.sacy.be/pub/' S_13_Table_Générale.pdf