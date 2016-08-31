#!/bin/bash
if [ $# != 2 ]; then
{
	echo "Usa:"
	echo "$0 /output/dir in_file"
	echo "Il percorso della directory deve essere assoluto, il nome del file di input deve essere senza estenzione"
	exit 1
} fi

rm -Rf $1/*

pdflatex -output-directory=$1 $2.tex
if [ $? == 0 ]; then
{
	pdflatex -output-directory=$1 $2.tex
} fi

