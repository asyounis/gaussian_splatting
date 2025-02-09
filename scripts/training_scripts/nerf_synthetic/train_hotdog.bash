#!/bin/bash

# Go to the src directory since that is where everything has to start from for things to run
cd ../../../src

# Make sure the output directory exists
mkdir -p ../outputs/nerf_synthetic/hotdog

# Clear the output in case there were previous runs
rm -rf ../outputs/nerf_synthetic/hotdog/*

# Run it!
python3 train.py --source_path ../data/nerf_synthetic/hotdog --model_path ../outputs/nerf_synthetic/hotdog/