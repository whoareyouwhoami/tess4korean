#!/bin/bash

lstmeval --model tesstraining/kor.lstm \
	--traineddata tesstraining/tesseract/tessdata/best/kor.traineddata \
	--eval_listfile tesstraining/train/kor.training_files.txt

