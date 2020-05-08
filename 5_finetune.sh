#!/bin/bash

TRAIN_OUTPUT_DIR=tesstraining/output/kor

if [ ! -d $TRAIN_OUTPUT_DIR ]; then
        mkdir $TRAIN_OUTPUT_DIR
else
        rm -rf $TRAIN_OUTPUT_DIR/*
fi

lstmtraining \
        --debug_interval -1 \
        --continue_from tesstraining/train/kor.lstm \
        --old_traineddata tesstraining/tesseract/tessdata/best/kor.traineddata \
        --traineddata tesstraining/train/kortrain/kor/kor.traineddata \
        --train_listfile tesstraining/train/kortrain/kor.training_files.txt \
        --model_output $TRAIN_OUTPUT_DIR/kor \
        --max_iterations 400

