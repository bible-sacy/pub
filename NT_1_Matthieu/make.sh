img2pdf ../../pngs-nt-1-trimmed/trimmed-matthieu_1/trimmed-matthieu_1-{6..812}.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 7 --type 'letters uppercase' pngs.pdf
python -m pagelabels --startpage 9 --firstpagenum 7 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 25 --firstpagenum 1 --type arabic pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_1_Matthieu.pdf
exiftool -overwrite_original -Title="[NT 1] Évangile selon St Matthieu" -Author="Le Maistre de Sacy" NT_1_Matthieu.pdf