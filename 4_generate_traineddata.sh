#!/bin/bash

source 0_config.sh

# WARNING
# ============
# Run this script if you get encoding errors during lstmeval.
# This will combine unicharset and create a new .traineddata

echo "==== Unpacking traineddata for kor ===="

combine_tessdata -u $TRAIN_BASE_DIR/tesseract/tessdata/best/$LANG.traineddata $LANG_TRAIN_DIR/$LANG.

echo "==== Setting new version ===="

VERSION_STR="$LANG version on $(date +%F) from"

sed -e "s/^/$VERSION_STR" $LANG_TRAIN_DIR/$LANG.version > $LANG_TRAIN_DIR/$LANG.new.version

echo "==== Merging unicharset ===="

merge_unicharsets $LANG_TRAIN_DIR/$LANG.lstm-unicharset $LANG_TRAIN_DIR/$LANG/$LANG.unicharset $LANG_TRAIN_DIR/$LANG.unicharset

echo "==== New traineddata for training ===="

if [ -d $LANG_TRAIN_DIR/$LANG ]; then
  mv $LANG_TRAIN_DIR/$LANG $LANG_TRAIN_DIR/${LANG}_old
fi

combine_lang_model \
  --input_unicharset $LANG_TRAIN_DIR/$LANG.unicharset \
  --script_dir $LANGDATA_DIR \
  --words $LANGDATA_DIR/$LANG/$LANG.wordlist \
  --numbers $LANGDATA_DIR/$LANG/$LANG.numbers \
  --puncs $LANGDATA_DIR/$LANG/$LANG.punc \
  --output_dir $LANG_TRAIN_DIR \
  --lang $LANG \
  --version_str $LANG_TRAIN_DIR/$LANG.new.version

echo "\nNew $LANG.traineddata created! \n"
