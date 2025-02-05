#!/bin/bash

function printUsage() 
{
	echo ""
	echo "Usage:"
	echo "      ./<script>.bash -s <server_name>"
	echo ""
	echo "Arguments"
	echo "    -s <server_name> : Specify one of [dizzy, bird, athena]"
	echo "    -h               : Print this help message"
	echo ""
}


# The configs we need
SERVER=""

# parse arguemnts (if any)
while getopts 'hs:' opt
do
	case $opt in
	h)
		printUsage
		exit 1
		;;
	s)
		SERVER="$OPTARG"
		;;
	*)
		printUsage
		exit 1
		;;
		esac
done

# User did not specify a server so there is nothing to do
if [[ "${SERVER}" == "" ]]; then
	printUsage
	exit 1
fi


# Get the workstation to use
if [[ "${SERVER}" == "bird" ]]; then
	DEVELOPMENT_ROOT=/scratch/ali/Development
	WORKSTATON_ADDRESS="$(cat workstation_addresses/bird_cluster.txt)"
elif [[ "${SERVER}" == "dizzy" ]]; then
	DEVELOPMENT_ROOT=/scratch/ali/Development
	WORKSTATON_ADDRESS="$(cat workstation_addresses/dizzy_cluster.txt)"
elif [[ "${SERVER}" == "athena" ]]; then
	DEVELOPMENT_ROOT=/home/ali/Development
	WORKSTATON_ADDRESS="$(cat workstation_addresses/workstation.txt)"
else
	printUsage
	exit 1
fi


# Push to that station
rsync -az --progress --partial --exclude "*saves*" --exclude "*.zip" --exclude "*.gif" --exclude "*.txt" --exclude "*.pdf" --exclude "*.png" --exclude "*__pycache__*" --exclude "*.git*" --exclude "data/*" --exclude "*.pt" --exclude "*.ptp" --exclude "*dataset/*" ../../gaussian_splatting/ ${WORKSTATON_ADDRESS}:${DEVELOPMENT_ROOT}/gaussian_splatting