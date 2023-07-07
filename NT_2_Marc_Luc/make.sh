exiftool -overwrite_original -all= ../../pngs-nt-1-trimmed/trimmed-marc_et_luc/trimmed-marc_et_luc-{6..721}.png
../txt2png.sh info.txt info.png
img2pdf ../../pngs-nt-1-trimmed/trimmed-marc_et_luc/trimmed-marc_et_luc-{6..721}.png info.png -o pngs.pdf
python -m pagelabels --delete pngs.pdf
python -m pagelabels --startpage 1 --type 'roman lowercase' pngs.pdf
python -m pagelabels --startpage 9 --type arabic pngs.pdf
python -m pagelabels --startpage 697 --firstpagenum 649 --type arabic pngs.pdf
../pdfoutline.py pngs.pdf pdf.toc NT_2_Marc_Luc.pdf
exiftool -overwrite_original -Producer='https://bible.sacy.be/pub/' -Author="Le Maistre de Sacy" -Creator="Le Maistre de Sacy" -Title="[NT 2] Évangile selon St Marc & St Luc" NT_2_Marc_Luc.pdf