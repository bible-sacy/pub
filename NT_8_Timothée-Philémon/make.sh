PAGES=$(echo ../../pngs-nt-2/timothee_tite/timothee_tite-{6..7}.png ../../pngs-nt-2/timothee_tite/timothee_tite-{10..410}.png)
exiftool -overwrite_original -all= $PAGES
soffice --convert-to png info.txt
img2pdf $PAGES info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 17 --firstpagenum 1 pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_8_Timothée-Philémon.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[NT 8] Épîtres de St Paul à Timothée, Tite & Philémon" NT_8_Timothée-Philémon.pdf