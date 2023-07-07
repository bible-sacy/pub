PAGES=$(echo ../../pngs-nt-2/epitres_catholiques/epitres_catholiques-{6..665}.png)
exiftool -overwrite_original -all= $PAGES
../txt2png.sh info.txt info.png
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 25 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_10_Épîtres_catholiques.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[NT 10] Épîtres catholiques" NT_10_Épîtres_catholiques.pdf