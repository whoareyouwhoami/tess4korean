#!/bin/bash

source 0_config.sh

echo "==== Generating data for lang $LANG ==="

rm -rf $LANG_TRAIN_DIR/*

$TRAIN_BASE_DIR/tesseract/src/training/tesstrain.sh --fonts_dir fonts \
	     --fontlist "${FONT_LIST}" \
	     --lang $LANG \
	     --linedata_only \
	     --langdata_dir $LANGDATA_DIR \
	     --tessdata_dir $TRAIN_BASE_DIR/tesseract/tessdata \
	     --save_box_tiff \
	     --maxpages $MAX_PAGES \
	     --output_dir $LANG_TRAIN_DIR