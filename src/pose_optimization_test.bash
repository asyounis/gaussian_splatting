

# for SCENE in office0 office1 office2 office3 room0 room1 room2
for SCENE in office0
do
	# Make sure the output directory exists
	mkdir -p ../outputs/replica/$SCENE
	
	# Clear the output in case there were previous runs
	rm -rf ../outputs/replica/$SCENE/*
	
	# Run it!
	python3 pose_optimization_test.py --model_path /home/ali/Development/gaussian_splatting/data/Replica/office0/ --source_path /home/ali/Development/particle_nvs_slam/data/Replica/processed/office0 --data_device cpu

done




