#!/bin/bash

function printUsage() 
{
	echo ""
	echo "Usage:"
	echo "      ./<script>.bash -s <server_name>"
	echo ""
	echo "Arguments"
	echo "    -s <server_name> : Specify one of [dizzy, bird, athena]"
	echo "    -t <full|fast>   : Specify if we should pull everything or exclude the .pt files" 
	echo "    -e <experiment>  : Specify the experiment we should pull"
	echo "    -h               : Print this help message"
	echo ""
}


# The configs we need
SERVER=""
PULL_TYPE=""
EXPERIMENT_TO_PULL=""

# parse arguemnts (if any)
while getopts 'hs:t:e:' opt
do
	case $opt in
	h)
		printUsage
		exit 1
		;;
	s)
		SERVER="$OPTARG"
		;;
	t)
		PULL_TYPE="$OPTARG"
		;;
	e)
		EXPERIMENT_TO_PULL="$OPTARG"
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

if [[ "${PULL_TYPE}" == "fast" ]]; then
	PULL_EXCLUDE_ARGS="--exclude *.pt"
	# PULL_EXCLUDE_ARGS='--exclude "*.pt" --exclude "*.ptp"'
elif [[ "${PULL_TYPE}" == "full" ]]; then
	PULL_EXCLUDE_ARGS=""
else
	printUsage
	exit 1
fi







# if [ "${EXPERIMENT_TO_PULL}" == "pong" ] || [ "${EXPERIMENT_TO_PULL}" == "all" ]; then

# 	####################################################################################################################################################################################################
# 	## Mapillary
# 	####################################################################################################################################################################################################
# 	rsync -avp --progress ${PULL_EXCLUDE_ARGS} ${WORKSTATON_ADDRESS}:${DEVELOPMENT_ROOT}/particle_nvs_slam/experiments/pong/mdpf/saves ../experiments/pong/mdpf/ &

# fi

rsync -avp --progress ${PULL_EXCLUDE_ARGS} ${WORKSTATON_ADDRESS}:${DEVELOPMENT_ROOT}/gaussian_splatting/outputs ../ &






wait
echo "Done"