#!/bin/bash

latexmk -c

rm -r auxiliary indent.log main.acr main.lol main.lolistedEquation main.tdo || true

echo "Cleaning auxiliary files was successfull."
