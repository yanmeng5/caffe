#!/usr/bin/env sh

build/tools/caffe train \
    --solver=models/milling_caffenet/solver.prototxt
