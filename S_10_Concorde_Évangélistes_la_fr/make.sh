PAGES=$(echo ../../pngs-nt-2/trimmed-concorde/trimmed-concorde-{1..192}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 11 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc S_10_Concorde_Évangélistes_la_fr.pdf
exiftool -overwrite_original -Title="[S 10] Concorde des Évangélistes (latin-français)" -Author="Antoine Arnauld" -Subject="$(tr '\n' ' ' <info.txt)" -Creator='https://bible.sacy.be/pub/' S_10_Concorde_Évangélistes_la_fr.pdf