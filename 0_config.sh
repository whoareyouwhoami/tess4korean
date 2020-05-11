# Set variables

# Setting Options
LANG=kor
FONT_LIST="tvN Enjoystories"
MAX_PAGES=10
DEBUG=-1
ITERATION=400

# Training Directory
TRAIN_BASE_DIR=tesstraining
TRAIN_DIR=$TRAIN_BASE_DIR/train

# Language Training Directory
LANG_TRAIN_DIR=$TRAIN_DIR/${LANG}train

# Result Directory
OUTPUT_DIR=$TRAIN_BASE_DIR/output/$LANG

# Langdata Directory
LANGDATA_DIR=$TRAIN_BASE_DIR/langdata

# Langdata LSTM Directory
LANGDATA_LSTM_DIR=$TRAIN_BASE_DIR/langdata_lstm

