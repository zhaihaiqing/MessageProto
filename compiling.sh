#!/bin/sh

rm -rf $PWD/compiling/*

echo "clear all path-compiling files"

protoc --proto_path=$PWD --cpp_out=$PWD/compiling $PWD/SensorUpMessage.proto $PWD/SensorMessages/SensorMessages.proto

echo "output success"
