#!/bin/bash

lstmtraining --stop_training \
        --continue_from $OUTPUT_DIR/${LANG}_checkpoint \
        --traineddata $LANG_TRAIN_DIR/$LANG/$LANG.traineddata \
        --model_output $OUTPUT_DIR/$LANG_new.traineddata