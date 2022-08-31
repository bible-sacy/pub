PAGES=$(echo ../../pngs-nt-2/hebreux/hebreux-{6..7}.png ../../pngs-nt-2/hebreux/hebreux-{424..837}.png ../../pngs-nt-2/hebreux/hebreux-849.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 3 --firstpagenum 405 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_9_Hébreux.pdf
exiftool -overwrite_original -Title="[NT 9] Épître de St Paul aux Hébreux" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" -Creator='https://bible.sacy.be/pub/' NT_9_Hébreux.pdf