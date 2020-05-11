
# tess4korean

In the first part, Tesseract will be trained from data generated using
fonts. In the second part, Tesseract will be trained from text images
provided from [AI Hub](http://www.aihub.or.kr/).

### Before you start…

Make sure you have Tesseract installed. See the last section from
[Tesseract Set
Up](https://whoareyouwhoami.github.io/docs/tesseract/train_tesseract.html)
page and install required packages for training Tesseract.

#### 1\. Set variables for training

Set variables before running this script.

    sh 0_config.sh

#### 2\. Download necessary files for training

    ./0_setup.sh

#### 3\. Generate training data

    ./1_generate_data.sh

#### 4\. Extracting lstm model

    ./2_extract_lstm.sh

#### 5\. Evaluating

Running this script will cause `Encoding of string failed! Failure bytes
/ Can't encode transcription` errors. This means that the characters
found in the training data are not in the unicharset.

    ./3_eval_initial.sh

#### 6\. Generate new traineddata

To solve the problem above, original unicharset will be merged into the
current unicharset to make sure that all characters are included.
Unicharset files will be combined to produce a new `.traineddata`.

    ./4_generate_traineddata.sh

#### 7\. Fine Tuning

    ./5_finetune.sh

#### 8\. Evaluating

Running this won’t give any encoding errors anymore. Try various
`--max_iterations` to see changes in error rate.

    ./6_eval_check.sh

#### 9\. Combine trained model

Converting training checkpoint to `.traineddata`

    ./7_combine.sh
