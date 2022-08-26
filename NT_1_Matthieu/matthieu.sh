
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 7 --type 'letters uppercase' pngs.pdf
python -m pagelabels --startpage 9 --firstpagenum 7 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 25 --firstpagenum 1 --type arabic pngs.pdf
pdfoutline.py pngs.pdf matthieu.toc NT_1_Matthieu.pdf
exiftool -overwrite_original -Title="[NT 1] Évangile selon St Matthieu" -Author="Le Maistre de Sacy" NT_1_Matthieu.pdf