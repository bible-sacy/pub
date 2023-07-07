PAGES=$(echo ../../pngs-at/1710_fricx_pseaumes/1710_fricx_pseaumes-{8..661}.png)
exiftool -overwrite_original -all= $PAGES
fmt < info.txt | convert -size 800x1200 xc:white -font "DejaVu-Sans-Condensed" -pointsize 28 -fill black -annotate +80+80 "@-" -bordercolor "#FFF" -border 10 +repage info.png
optipng info.png
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 11 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc AT_15_Psaumes_LV-CIII.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[AT 15] Psaumes LV-CIII" AT_15_Psaumes_LV-CIII.pdf
