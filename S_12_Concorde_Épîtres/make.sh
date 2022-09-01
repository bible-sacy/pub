PAGES=$(echo ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{526..687}.png ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{520..525}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 pngs.pdf
python -m pagelabels --startpage 163 --firstpagenum 515 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc S_12_Concorde_Épîtres.pdf
exiftool -overwrite_original -Title="[S 12] Concorde des épîtres des Apôtres" -Author="Jérôme Besoigne" -Subject="$(tr '\n' ' ' <info.txt)" -Creator='https://bible.sacy.be/pub/' S_12_Concorde_Épîtres.pdf