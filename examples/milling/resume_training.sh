#!/usr/bin/env sh

./build/tools/caffe train \
    --solver=models/milling_caffenet/solver.prototxt \
    --snapshot=models/milling_caffenet/caffenet_train_10000.solverstate.h5
