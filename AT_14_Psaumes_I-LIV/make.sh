PAGES=$(echo ../../pngs-at/1711_desprez_pseaumes_t1/1711_desprez_pseaumes_t1-{6..772}.png)
exiftool -overwrite_original -all= $PAGES
../txt2png.sh info.txt info.png
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 49 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc AT_14_Psaumes_I-LIV.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[AT 14] Psaumes I-LIV" AT_14_Psaumes_I-LIV.pdf
