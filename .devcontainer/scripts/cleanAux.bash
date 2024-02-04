#!/bin/bash

latexmk -c

rm -r aux indent.log main.acr main.lol main.lolistedEquation main.tdo || true

echo "Cleaning auxiliary files was successfull."
