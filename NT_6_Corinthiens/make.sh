PAGES=$(echo ../../pngs-nt-2/1708_desprez_epistres_paul_t2/1708_desprez_epistres_paul_t2-{8..909}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 7 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_6_Corinthiens.pdf
exiftool -overwrite_original -Creator='https://bible.sacy.be/pub/' -Title="[NT 6] Épîtres de St Paul aux Corinthiens" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" NT_6_Corinthiens.pdf