
python -m pagelabels --delete matthieu_pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' matthieu_pngs.pdf
python -m pagelabels --startpage 7 --type 'letters uppercase' matthieu_pngs.pdf
python -m pagelabels --startpage 9 --firstpagenum 7 --type 'roman lowercase' matthieu_pngs.pdf
python -m pagelabels --startpage 25 --firstpagenum 1 --type arabic matthieu_pngs.pdf
pdfoutline.py matthieu_pngs.pdf matthieu.toc Matthieu.pdf
exiftool -overwrite_original -Title="Le Saint Évangile de Jésus-Christ selon Saint Matthieu" -Author="Le Maistre de Sacy" Matthieu.pdf