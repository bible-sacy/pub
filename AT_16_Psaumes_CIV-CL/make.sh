PAGES=$(echo ../../pngs-at/1690_desprez_pseaumes_t3/1690_desprez_pseaumes_t3-{6..580}.png)
exiftool -overwrite_original -all= $PAGES
../txt2png.sh info.txt info.png
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 5 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc AT_16_Psaumes_CIV-CL.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[AT 16] Psaumes CIV-CL" AT_16_Psaumes_CIV-CL.pdf
