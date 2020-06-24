#!/bin/bash

source 0_config.sh

tessseract_training() {
        lstmtraining \
                --debug_interval $DEBUG \
                --continue_from $1 \
                --old_traineddata $TRAIN_BASE_DIR/tesseract/tessdata/best/$LANG.traineddata \
                --traineddata $LANG_TRAIN_DIR/$LANG/$LANG.traineddata \
                --train_listfile $LANG_TRAIN_DIR/$LANG.training_files.txt \
                --model_output $OUTPUT_DIR/$LANG \
                --max_iterations $ITERATION
}

if [ ! -f $OUTPUT_DIR/${LANG}_checkpoint ]; then
        if [ ! -d $OUTPUT_DIR ]; then
                mkdir $OUTPUT_DIR
        else
                rm -rf $OUTPUT_DIR/*
        fi

        model_option="$LANG_TRAIN_DIR/$LANG.lstm"

        tessseract_training $model_option

else
        echo "Trained directory exist. Would you like to continue or start from the beginning? [Y/N]"
        read -p "Answer: " answer

        case $answer in
                [Yy]* )
                        model_option="$LANG_TRAIN_DIR/${LANG}_checkpoint";;
                [Nn]* )
                        rm -rf $OUTPUT_DIR/*
                        model_option="$LANG_TRAIN_DIR/$LANG.lstm";;
                * )
                        echo "Try again..."
                        exit 0;;
        esac

        tessseract_training $model_option
fi