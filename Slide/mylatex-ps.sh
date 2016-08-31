#!/bin/bash
if [ $# != 2 ]; then
{
	echo "Usa:"
	echo "$0 /output/dir in_file"
	echo "Il percorso della directory deve essere assoluto, il nome del file di input deve essere senza estenzione"
	exit 1
} fi

rm -Rf $1/*

latex -output-directory=$1 -aux-directory=$1 $2.tex
if [ $? == 0 ]; then
{
	latex -output-directory=$1 -aux-directory=$1 $2.tex
	if [ $? == 0 ]; then
	{
		dvips -P pdf -o $1/$2.ps $1/$2.dvi
		if [ $? == 0 ]; then
		{
			ps2pdf $1/$2.ps $1/$2.pdf
		} fi
	} fi
} fi

