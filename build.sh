#!/bin/bash

# Tested with:

## Pdflatex
# bash> pdflatex -v
# pdfTeX 3.14159265-2.6-1.40.15 (TeX Live 2014)
# kpathsea version 6.2.0
# Copyright 2014 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
# There is NO warranty.  Redistribution of this software is
# covered by the terms of both the pdfTeX copyright and
# the Lesser GNU General Public License.
# For more information about these matters, see the file
# named COPYING and the pdfTeX source.
# Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
# Compiled with libpng 1.6.10; using libpng 1.6.10
# Compiled with zlib 1.2.8; using zlib 1.2.8
# Compiled with xpdf version 3.03

## Bibtex
# bash> bibtex -v
# BibTeX 0.99d (TeX Live 2014)
# kpathsea version 6.2.0
# Copyright 2014 Oren Patashnik.
# There is NO warranty.  Redistribution of this software is
# covered by the terms of both the BibTeX copyright and
# the Lesser GNU General Public License.
# For more information about these matters, see the file
# named COPYING and the BibTeX source.
# Primary author of BibTeX: Oren Patashnik.


FILE_NAME=main
TEX_CMD=pdflatex
BIB_CMD=bibtex

# Clean up
rm ${FILE_NAME}.aux
rm ${FILE_NAME}.bbl
rm ${FILE_NAME}.blg
rm ${FILE_NAME}.dvi
rm ${FILE_NAME}.log
rm ${FILE_NAME}.synctex.gz
rm ${FILE_NAME}.out
rm ${FILE_NAME}.pdf

${TEX_CMD} -synctex=1 -interaction=nonstopmode ${FILE_NAME}.tex
${BIB_CMD} ${FILE_NAME}.aux
${TEX_CMD} -synctex=1 -interaction=nonstopmode ${FILE_NAME}.tex
${TEX_CMD} -synctex=1 -interaction=nonstopmode ${FILE_NAME}.tex

ps2pdf -dPDFSETTINGS=/ebook main.pdf main_reduced.pdf