#!/bin/bash

source 0_config.sh

lstmtraining \
        --debug_interval $DEBUG \
        --continue_from $OUTPUT_DIR/${LANG}_checkpoint \
        --old_traineddata $TRAIN_BASE_DIR/tesseract/tessdata/best/$LANG.traineddata \
        --traineddata $LANG_TRAIN_DIR/$LANG/$LANG.traineddata \
        --train_listfile $LANG_TRAIN_DIR/$LANG.training_files.txt \
        --model_output $OUTPUT_DIR/$LANG \
        --max_iterations $ITERATION
