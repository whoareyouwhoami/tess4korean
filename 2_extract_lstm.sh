#!/bin/bash

source 0_config.sh

combine_tessdata -e $TRAIN_BASE_DIR/tesseract/tessdata/best/$LANG.traineddata $TRAIN_DIR/$LANG.lstm
