#!/bin/bash

lstmeval --model tesstraining/train/kor.lstm \
	--traineddata tesstraining/tesseract/tessdata/best/kor.traineddata \
	--eval_listfile tesstraining/train/kortrain/kor.training_files.txt

