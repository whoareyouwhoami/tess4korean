#!/bin/bash

source 0_config.sh

# This is an initial set up script that will download all the necessary files required for training.
# Any files and folders created or used for training will be saved under tesstraining

chmod +x 0_setup.sh 1_generate_data.sh 2_extract_lstm.sh 3_eval_initial.sh 4_generate_traineddata.sh 5_finetune.sh 6_eval_check.sh 7_combine.sh

# Check if training folder exist
if [ ! -d $TRAIN_DIR ]; then
  mkdir $TRAIN_DIR
else
	rm -rf $TRAIN_DIR/*
fi

cd $TRAIN_DIR

mkdir output langdata langdata_lstm

# Cloning tesseract
git clone https://github.com/tesseract-ocr/tesseract.git

cd tesseract/tessdata

# Downloading .traineddata from tessdata
wget https://github.com/tesseract-ocr/tessdata/raw/master/osd.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata

mkdir best
cd best

# Downloading .traineddata from tessdata_best
wget https://github.com/tesseract-ocr/tessdata_best/raw/master/eng.traineddata
wget https://github.com/tesseract-ocr/tessdata_best/raw/master/kor.traineddata

# Downloading required files to langdata_lstm and langdata
cd $LANGDATA_LSTM_DIR

# LANGDATA_LSTM
wget https://github.com/tesseract-ocr/langdata_lstm/raw/master/radical-stroke.txt
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/font_properties
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/common.punc

# Latin script
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Latin.unicharset
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Latin.xheights

# Hangul script
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Hangul.unicharset
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Hangul.xheights

# Han script
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Han.unicharset
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Han.xheights

# Copying script files to langdata
cp * $LANGDATA_DIR

# Downloading language data from langdata_lstm
mkdir eng kor
# eng
cd eng
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/eng/eng.training_text
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/eng/eng.wordlist
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/eng/eng.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/eng/eng.numbers

# kor
cd $LANGDATA_LSTM_DIR/kor
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/kor/kor.training_text
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/kor/kor.wordlist
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/kor/kor.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/kor/kor.numbers
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/kor/kor.unicharset


# LANGDATA
cd $LANGDATA_DIR

# Downloading language data from langdata
mkdir eng kor

# eng
cd eng
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.training_text
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.wordlist
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.numbers

# kor
cd $LANGDATA_DIR/kor
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/kor/kor.training_text
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/kor/kor.wordlist
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/kor/kor.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/kor/kor.numbers


echo "\nSet up complete!\n"
