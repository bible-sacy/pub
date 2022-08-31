PAGES=$(echo ../../pngs-nt-2/galates_ephesiens/galates_ephesiens-{8..827}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 15 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_7_Galates-Thessaloniciens.pdf
exiftool -overwrite_original -Title="[NT 7] Épîtres de St Paul aux Galates, Éphésiens, Philippiens, Colossiens & Thessaloniciens" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" -Creator='https://bible.sacy.be/pub/' NT_7_Galates-Thessaloniciens.pdf