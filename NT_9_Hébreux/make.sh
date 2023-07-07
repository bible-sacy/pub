PAGES=$(echo ../../pngs-nt-2/hebreux/hebreux-{6..7}.png ../../pngs-nt-2/hebreux/hebreux-{424..837}.png ../../pngs-nt-2/hebreux/hebreux-849.png)
exiftool -overwrite_original -all= $PAGES
../txt2png.sh info.txt info.png
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 3 --firstpagenum 405 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_9_Hébreux.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[NT 9] Épître de St Paul aux Hébreux" NT_9_Hébreux.pdf