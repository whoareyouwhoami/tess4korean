
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

Generating training data using fonts specified at `fonts` folder.

#### 2\_extract\_lstm.sh

Extracts a model from `.traineddata`

#### 3\_eval\_initial.sh

Running this script will cause `Encoding of string failed! Failure bytes
/ Can't encode transcription` errors. This means that the characters
found in the training data are not in the unicharset.

#### 4\_generate\_traineddata.sh

To solve the problem above, original unicharset will be merged into the
current unicharset to make sure that all characters are included.
Unicharset files will be combined to produce a new `.traineddata`.

#### 5\_finetune.sh

Time to train\! **`--max_iterations` is set to `400`**

#### 6\_eval\_check.sh

Running this won’t give any encoding errors anymore. Try various
`--max_iterations` to see changes in error rate.

#### 7\_combine.sh

Converting training checkpoint to `.traineddata`
