exiftool -overwrite_original -all= ../../pngs-nt-1-trimmed/trimmed-jean/trimmed-jean-{6..599}.png
soffice --convert-to png info.txt
img2pdf ../../pngs-nt-1-trimmed/trimmed-jean/trimmed-jean-{6..599}.png info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 pngs.pdf
python -m pagelabels --startpage 5 --firstpagenum 1 --prefix 'Prospectus ' pngs.pdf
python -m pagelabels --startpage 13 --firstpagenum 5 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_3_Jean.pdf
exiftool -overwrite_original -Title="[NT 3] Évangile selon St Jean" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" NT_3_Jean.pdf