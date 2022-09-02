PAGES=$(echo ../../pngs-nt-2/trimmed-foppens/trimmed-foppens-{10..575}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 15 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc S_11_Concorde_Évangélistes_fr.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Antoine Arnauld" -Creator="Antoine Arnauld" -Title="[S 11] Concorde des Évangélistes (française)" S_11_Concorde_Évangélistes_fr.pdf