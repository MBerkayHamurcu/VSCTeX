#!/bin/bash

[[ -d auxiliary ]] || mkdir auxiliary

pdflatex -synctex=1 -halt-on-error -output-directory=auxiliary main.tex && mv auxiliary/main.pdf main.pdf && mv auxiliary/main.synctex.gz main.synctex.gz 
