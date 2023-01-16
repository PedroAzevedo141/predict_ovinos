#!/bin/bash

IMAGE_NAME=predict_ovinos/tcc
IMAGE_FILE=docker/predict_raw.dockerfile

echo $(pwd)
docker build -f $IMAGE_FILE -t $IMAGE_NAME $(pwd)
