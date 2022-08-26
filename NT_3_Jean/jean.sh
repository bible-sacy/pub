
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 pngs.pdf
python -m pagelabels --startpage 5 --firstpagenum 1 --prefix 'Prospectus ' pngs.pdf
python -m pagelabels --startpage 13 --firstpagenum 5 pngs.pdf
pdfoutline.py pngs.pdf jean.toc NT_3_Jean.pdf
exiftool -overwrite_original -Title="[NT 3] Évangile selon St Jean" -Author="Le Maistre de Sacy" NT_3_Jean.pdf