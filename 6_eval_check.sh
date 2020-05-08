#!/bin/bash

lstmeval \
        --model tesstraining/output/kor/kor_checkpoint \
        --traineddata tesstraining/train/kortrain/kor/kor.traineddata \
        --eval_listfile tesstraining/train/kortrain/kor.training_files.txt

