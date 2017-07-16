#!/bin/bash

mkdir -p build

QRENCODE='qrencode -l H -s 5 -d 150 -t png'

split -n 4 ${1} chunk-

base64 chunk-aa | ${QRENCODE} -o build/1.png
base64 chunk-ab | ${QRENCODE} -o build/2.png
base64 chunk-ac | ${QRENCODE} -o build/3.png
base64 chunk-ad | ${QRENCODE} -o build/4.png
rm chunk-*

m4 print.html.m4 > build/print.html

