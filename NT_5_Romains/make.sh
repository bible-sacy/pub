PAGES=$(echo ../../pngs-nt-1-trimmed/trimmed-romains_corinthiens_1_new/trimmed-romains_corinthiens_1_new-{6..37}.png ../../pngs-nt-1-trimmed/trimmed-romains_corinthiens_1/trimmed-romains_corinthiens_1-{38..485}.png ../../pngs-nt-1-trimmed/trimmed-romains_corinthiens_1/trimmed-romains_corinthiens_1-{846..847}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 pngs.pdf
python -m pagelabels --startpage 481 --firstpagenum 843 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_5_Romains.pdf
exiftool -overwrite_original -Title="[NT 5] Épître de St Paul aux Romains" -Author="Le Maistre de Sacy" -Subject="$(tr '\n' ' ' <info.txt)" NT_5_Romains.pdf