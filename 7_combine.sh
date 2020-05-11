#!/bin/bash

source 0_config.sh

lstmtraining --stop_training \
        --continue_from $OUTPUT_DIR/${LANG}_checkpoint \
        --traineddata $LANG_TRAIN_DIR/$LANG/$LANG.traineddata \
        --model_output $OUTPUT_DIR/${LANG}_new.traineddata