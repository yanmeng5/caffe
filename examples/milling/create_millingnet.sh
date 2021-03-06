#!/usr/bin/env sh
# Create the milling lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

EXAMPLE=examples/milling
DATA=data/milling
TOOLS=build/tools

TRAIN_DATA_ROOT=/home/yan/code/kiosk_machine_learning/deep_learning_training_images/gray/
VAL_DATA_ROOT=/home/yan/code/kiosk_machine_learning/deep_learning_training_images/gray/

# Set RESIZE=true to resize the images to 128x384. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=128
  RESIZE_WIDTH=384
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_millingnet.sh to the path" \
       "where the MillingNet training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_millingnet.sh to the path" \
       "where the MillingNet validation data is stored."
  exit 1
fi

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --gray=True \
    $TRAIN_DATA_ROOT \
    $DATA/train.txt \
    $EXAMPLE/milling_train_lmdb

echo "Creating val lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --gray=True \
    $VAL_DATA_ROOT \
    $DATA/val.txt \
    $EXAMPLE/milling_val_lmdb

echo "Done."
