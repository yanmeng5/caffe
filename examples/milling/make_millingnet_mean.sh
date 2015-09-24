#!/usr/bin/env sh
# Compute the mean image from the millingnet training lmdb
# N.B. this is available in data/milling

EXAMPLE=examples/milling
DATA=data/milling
TOOLS=build/tools

$TOOLS/compute_image_mean $EXAMPLE/milling_train_lmdb \
  $DATA/millinget_mean.binaryproto

echo "Done."
