#!/bin/bash

source 0_config.sh

lstmeval --model $TRAIN_DIR/$LANG.lstm \
	--traineddata $TRAIN_BASE_DIR/tesseract/tessdata/best/$LANG.traineddata \
	--eval_listfile $LANG_TRAIN_DIR/$LANG.training_files.txt

