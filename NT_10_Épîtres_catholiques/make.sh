PAGES=$(echo ../../pngs-nt-2/epitres_catholiques/epitres_catholiques-{6..665}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 25 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_10_Épîtres_catholiques.pdf
exiftool -overwrite_original -Title="[NT 10] Épîtres catholiques" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" -Creator='https://bible.sacy.be/pub/' NT_10_Épîtres_catholiques.pdf