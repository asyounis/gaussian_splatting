#!/bin/bash

# Get the current directory
CUR_DIR=`pwd`

# Make the processing directory
mkdir -p ../../../data/Replica/processed

# for SCENE in office0 office1 office2 office3 room0 room1 room2
for SCENE in office1 office2 office3 room0 room1 room2
do
	echo "Processing Scene" $SCENE

	# Reset to the correct directory
	cd $CUR_DIR

	# Make a copy so we can process them
	cp -rp ../../../data/Replica/orig/$SCENE ../../../data/Replica/processed

	# Remove the depth images since we dont need them 
	rm ../../../data/Replica/processed/$SCENE/results/depth*

	# Move the data into the correctly named directory
	mv ../../../data/Replica/processed/$SCENE/results ../../../data/Replica/processed/$SCENE/input

	# Compute Sfm using COLMAP
	cd ../../../src
	python3 convert.py -s ../data/Replica/processed/$SCENE/ &> ../data/Replica/processed/$SCENE/colmap_output.txt
done



