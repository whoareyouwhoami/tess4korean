#!/bin/bash

# WARNING
# ============
# Run this script if you get encoding errors during lstmeval.
# This will combine unicharset and create a new .traineddata

echo "==== Unpacking traineddata for kor ===="

combine_tessdata -u tesstraining/tesseract/tessdata/best/kor.traineddata tesstraining/train/kor.


echo "==== Setting new version ===="

VERSION_STR="New kor version on $(date +%F) from"

sed -e "s/^/$VERSION_STR" tesstraining/train/kor.version > tesstraining/train/kor.new.version


echo "==== Merging unicharset ===="

merge_unicharsets tesstraining/train/kor.lstm-unicharset tesstraining/train/kortrain/kor/kor.unicharset tesstraining/train/kor.unicharset


echo "==== New traineddata for training ===="

if [ -d tesstraining/train/kortrain/kor ];then
        mv tesstraining/train/kortrain/kor tesstraining/train/kortrain/kor_old
fi

combine_lang_model \
        --input_unicharset tesstraining/train/kor.unicharset \
        --script_dir tesstraining/langdata \
        --words tesstraining/langdata/kor/kor.wordlist \
        --numbers tesstraining/langdata/kor/kor.numbers \
        --puncs tesstraining/langdata/kor/kor.punc \
        --output_dir tesstraining/train/kortrain \
        --lang kor \
        --version_str tesstraining/train/kor.new.version

echo "\nNew kor.traineddata created! \n"

