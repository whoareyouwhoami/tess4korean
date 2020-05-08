#!/bin/bash

rm -rf tesstraining/train/*

tesstraining/tesseract/src/training/tesstrain.sh --fonts_dir fonts \
	     --fontlist "tvN Enjoystories" \
	     --lang kor \
	     --linedata_only \
	     --langdata_dir tesstraining/langdata \
	     --tessdata_dir tesstraining/tesseract/tessdata \
	     --save_box_tiff \
	     --maxpages 10 \
	     --output_dir tesstraining/train/kortrain