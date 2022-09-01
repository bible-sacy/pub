PAGES=$(echo ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{8..9}.png ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{212..519}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 3 --firstpagenum 207 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_11_Apocalypse.pdf
exiftool -overwrite_original -Title="[NT 11] Apocalypse de St Jean" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" -Creator='https://bible.sacy.be/pub/' NT_11_Apocalypse.pdf