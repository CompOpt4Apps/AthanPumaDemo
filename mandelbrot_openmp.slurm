#!/bin/bash

# --------------------------------------------------------------
### PART 1: Requests resources to run your job.RT 1: Requests resources to run your job.
# --------------------------------------------------------------
### Optional. Set the job name
#SBATCH --job-name=mandelbrot_openmp
### Optional. Set the output filename.
### SLURM reads %x as the job name and %j as the job ID
#SBATCH --output=%x-%j.ppm
### REQUIRED. Specify the PI group for this job
#SBATCH --account=mstrout
### Optional. Request email when job begins and ends
### SBATCH --mail-type=ALL
### Optional. Specify email address to use for notification
### SBATCH --mail-user=<YOUR NETID>@email.arizona.edu
### REQUIRED. Set the partition for your job.
#SBATCH --partition=standard
### REQUIRED. Set the number of cores that will be used for this job.
#SBATCH --ntasks=1
### REQUIRED. Set the memory required for this job.
#SBATCH --mem=1gb
### REQUIRED. Specify the time required for this job, hhh:mm:ss
#SBATCH --time=00:01:00

# --------------------------------------------------------------
### PART 2: Execute bash commands to run your job
# --------------------------------------------------------------

### Change the next line to the location of AthanPumaDemo
cd ~/demo/AthanPumaDemo
### Run your work
bash mandelbrot_openmp.sh

./a.out
