
# tess4korean

In the first part, Tesseract will be trained from data generated using
fonts. In the second part, Tesseract will be trained from text images
provided from [AI Hub](http://www.aihub.or.kr/).

### Before you start…

Make sure you have Tesseract installed. See the last section from
[Tesseract Set
Up](https://whoareyouwhoami.github.io/docs/tesseract/train_tesseract.html)
page and install required packages for training Tesseract.

#### 0\_setup.sh

This script will download all the necessary files required for training.

#### 1\_generate\_data.sh

Generating images for training using fonts specified at `fonts` folder.

#### 2\_extract\_lstm.sh

Extract `lstm` from traineddata

#### 3\_eval\_initial.sh

Running this script will cause `Encoding of string failed! Failure bytes
/ Can't encode transcription` errors. This means that the characters
found in the image are not in the unicharset.
