exiftool -overwrite_original -all= ../../pngs-nt-1-trimmed/trimmed-actes_des_apotres/trimmed-actes_des_apotres-{6..789}.png
soffice --convert-to png info.txt
img2pdf ../../pngs-nt-1-trimmed/trimmed-actes_des_apotres/trimmed-actes_des_apotres-{6..789}.png info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 41 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_4_Actes.pdf
exiftool -overwrite_original -Title="[NT 4] Actes des Apôtres" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" NT_4_Actes.pdf