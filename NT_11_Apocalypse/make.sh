PAGES=$(echo ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{8..9}.png ../../pngs-nt-2/epitres_catholiques_apocalypse/epitres_catholiques_apocalypse-{212..519}.png)
exiftool -overwrite_original -all= $PAGES
../txt2png.sh info.txt info.png
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 3 --firstpagenum 207 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_11_Apocalypse.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[NT 11] Apocalypse de St Jean" NT_11_Apocalypse.pdf