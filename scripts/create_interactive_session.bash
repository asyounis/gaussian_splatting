
exit 

salloc --job-name "ali_dizzy_interactive_1_gpu" --cpus-per-task  48 --mem 128000 --gres gpu:1 --time 0-08:00 --nodelist dizzy
salloc --job-name "ali_dizzy_interactive_1_gpu_the_second" --cpus-per-task  48 --mem 128000 --gres gpu:1 --time 0-08:00 --nodelist dizzy
salloc --job-name "ali_dizzy_interactive_2_gpu" --cpus-per-task  96 --mem 256000 --gres gpu:2 --time 0-08:00 --nodelist dizzy
salloc --job-name "ali_dizzy_interactive_3_gpu" --cpus-per-task  128 --mem 300000 --gres gpu:3 --time 0-08:00 --nodelist dizzy
salloc --job-name "ali_dizzy_interactive_4_gpu" --cpus-per-task  128 --mem 450000 --gres gpu:4 --time 0-10:00 --nodelist dizzy

salloc --job-name "ali_bird_interactive_1_gpu" --cpus-per-task  48 --mem 128000 --gres gpu:1 --time 0-08:00 --nodelist bird
salloc --job-name "ali_bird_interactive_1_gpu_the_second" --cpus-per-task  48 --mem 128000 --gres gpu:1 --time 0-08:00 --nodelist bird
salloc --job-name "ali_bird_interactive_2_gpu" --cpus-per-task  96 --mem 256000 --gres gpu:2 --time 0-08:00 --nodelist bird
salloc --job-name "ali_bird_interactive_3_gpu" --cpus-per-task  128 --mem 300000 --gres gpu:3 --time 0-08:00 --nodelist bird
salloc --job-name "ali_bird_interactive_4_gpu" --cpus-per-task  128 --mem 450000 --gres gpu:4 --time 0-10:00 --nodelist bird

srun --pty bash




