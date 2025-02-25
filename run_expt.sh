#!/bin/bash

# some quick checks # pkill -U miranda9
export CUDA_VISIBLE_DEVICES=0
nvcc --version
hostname
which python
echo CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES
echo ---- Running your python main ----

# set experiment id
export SLURM_JOBID=$(((RANDOM)))
echo SLURM_JOBID=$SLURM_JOBID
export OUT_FILE=$PWD/main.sh.o$SLURM_JOBID
echo OUT_FILE=$OUT_FILE

# run experiment
#python path2/main.py
nohup path2/main.py > $OUT_FILE &
echo pid = $!

echo "Done with expt or dispatched daemon expt."

