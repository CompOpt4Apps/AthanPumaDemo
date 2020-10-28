# AthanPumaDemo

## What is HPC?
High-performance computiong (HPC) is the use of software and hardware to process data and perform complex calculations at high speeds. Supercomputers are the product of this innovation.

## What is Puma?
Released in mid 2020, Puma is the newest supercomputer at the University of Arizona. The system is availiable to all researchers at no cost.

## Access HPC Systems
You must:
* Make an account at https://account.arizona.edu/welcome
* nrolled in Netid+ https://webauth.arizona.edu/netid-plus/
After you have been authorized you may ssh into the University of Arizona's bastion host, a login node, via tha command line
```$ ssh <netid>@hpc.arizona.edu```
Fill in the necessary credentials to complete the login.

## Access Puma
After successfully logging into bastion host simply type ```$ puma``` to access a Puma login node.
The purpose of a Puma login node is for users to perform housekeeping work, edit scripts, and submit their job requests for execution on one/some of the cluster’s compute nodes.
This is not where scripts are run.

## Running Scripts on Puma
SLURM is a scheduler software that will reserve resources and run work on the cluster's compute nodes when space becomes available.
To run a slurm job a .slurm file must be created blueprinting how to run your code.