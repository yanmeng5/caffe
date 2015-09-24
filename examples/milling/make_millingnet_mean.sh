#!/usr/bin/env sh
# Compute the mean image from the millingnet training lmdb
# N.B. this is available in data/milling

EXAMPLE=/home/yan/code/caffe/examples/milling
DATA=/home/yan/code/caffe/data/milling
TOOLS=/home/yan/code/caffe/build/tools

$TOOLS/compute_image_mean $EXAMPLE/milling_train_lmdb \
  $DATA/millingnet_mean.binaryproto

echo "Done."
