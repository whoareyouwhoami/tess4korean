#!/bin/bash

source 0_config.sh

TRAIN_OUTPUT_DIR=tesstraining/output/kor

if [ ! -d $OUTPUT_DIR ]; then
        mkdir $OUTPUT_DIR
else
        rm -rf $OUTPUT_DIR/*
fi

lstmtraining \
        --debug_interval $DEBUG \
        --continue_from $LANG_TRAIN_DIR/$LANG.lstm \
        --old_traineddata $TRAIN_BASE_DIR/tesseract/tessdata/best/$LANG.traineddata \
        --traineddata $LANG_TRAIN_DIR/$LANG/$LANG.traineddata \
        --train_listfile $LANG_TRAIN_DIR/$LANG.training_files.txt \
        --model_output $OUTPUT_DIR \
        --max_iterations $ITERATION

