# ===================================
# Set variable options for training
LANG=kor
FONT_LIST="tvN Enjoystories"
MAX_PAGES=10
ITERATION=400
DEBUG=-1

# ===================================

# Root Directory
BASE_DIR=${PWD}

# Training Directory
TRAIN_BASE_DIR=$BASE_DIR/tesstraining
TRAIN_DIR=$TRAIN_BASE_DIR/train

# Language Training Directory
LANG_TRAIN_DIR=$TRAIN_DIR/${LANG}train

# Result Directory
OUTPUT_DIR=$TRAIN_BASE_DIR/output/$LANG

# Langdata Directory
LANGDATA_DIR=$TRAIN_BASE_DIR/langdata

# Langdata LSTM Directory
LANGDATA_LSTM_DIR=$TRAIN_BASE_DIR/langdata_lstm

chmod +x 0_setup.sh 1_generate_data.sh 2_extract_lstm.sh 3_eval_initial.sh 4_generate_traineddata.sh 5_finetune.sh 6_eval_check.sh 7_combine.sh