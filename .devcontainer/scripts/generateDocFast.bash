#!/bin/bash

[[ -d aux ]] || mkdir aux

pdflatex -synctex=1 -halt-on-error -output-directory=aux main.tex && mv aux/main.pdf main.pdf && mv aux/main.synctex.gz main.synctex.gz 
