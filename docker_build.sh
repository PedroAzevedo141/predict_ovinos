#!/bin/bash

export LWS=$(pwd)
FRAMEWORK_ALIAS=framework

if [ -z $1 ]
then
	echo "Using default framework '$FRAMEWORK_ALIAS'."
else
	FRAMEWORK_ALIAS=$1
	echo "Using '$FRAMEWORK_ALIAS'."
fi
FRAMEWORK_DIR=$LWS/framework/$FRAMEWORK_ALIAS

cd $FRAMEWORK_DIR

bash docker_build.sh ${@:2}

cd $LWS
