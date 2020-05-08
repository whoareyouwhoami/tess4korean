#!/bin/bash

lstmtraining --stop_training \
        --continue_from tesstraining/output/kor/kor_checkpoint \
        --traineddata tesstraining/train/kortrain/kor/kor.traineddata \
        --model_output tesstraining/output/kor_new.traineddata