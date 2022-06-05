#!/bin/bash
start_dir=$PWD

echo $start_dir

echo "get submodules"
git submodule update --init --recursive

echo "rebuilding everything. . . "
echo "only errors, and warnings will output. . . "
echo "-------------------"
sleep 1

echo "rebuilding libdaisy"
cd source
cd libdaisy
make clean | grep "warningr:\|error:"
make -j4 | grep "warning:r\|error:"
echo "done building libdaisy"
