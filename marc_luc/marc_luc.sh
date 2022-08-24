python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 9 --type arabic pngs.pdf
python -m pagelabels --startpage 697 --firstpagenum 649 --type arabic pngs.pdf
pdfoutline.py pngs.pdf marc_luc.toc Marc_Luc.pdf
exiftool -overwrite_original -Title="Le Saint Évangile de Jésus-Christ selon Saint Marc et Saint Luc" -Author="Le Maistre de Sacy" Marc_Luc.pdf