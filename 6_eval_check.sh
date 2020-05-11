#!/bin/bash

source 0_config.sh

lstmeval \
        --model $OUTPUT_DIR/${LANG}_checkpoint \
        --traineddata $LANG_TRAIN_DIR/$LANG/$LANG.traineddata \
        --eval_listfile $LANG_TRAIN_DIR/$LANG.training_files.txt

