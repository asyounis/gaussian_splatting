#!/bin/bash

# Go to the src directory since that is where everything has to start from for things to run
cd ../../../src


for SCENE in office0 office1 office2 office3 room0 room1 room2
# for SCENE in office1
do
	# Make sure the output directory exists
	mkdir -p ../outputs/replica/$SCENE
	
	# Clear the output in case there were previous runs
	rm -rf ../outputs/replica/$SCENE/*
	
	# Run it!
	python3 train.py --source_path ../data/Replica/processed/$SCENE --model_path ../outputs/replica/$SCENE/
done




