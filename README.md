# Puma Demo

## Index
* [What is HPC](#what-is-hpc)
* [What is Puma](#what-is-puma)
* [Access HPC Systems](#access-hpc-systems)
* [Access Puma](#access-puma)
* [Access Software on Puma](#access-software-on-puma)
* [Run Scripts on Puma](#run-scripts-on-puma)
* [Demo](#demo)

## What is HPC
High-performance computiong (HPC) is the use of software and hardware to process data and perform complex calculations at high speeds. Supercomputers are the product of this innovation.

## What is Puma
Released in mid 2020, Puma is the newest supercomputer at the University of Arizona. The system is availiable to all researchers at no cost.

## Access HPC Systems
You must:
* Make an account at https://account.arizona.edu/welcome
* Enrolled in Netid+ https://webauth.arizona.edu/netid-plus/

After you have been authorized by your sponsor group you may ssh into the University of Arizona's **bastion host**, a login node, via the command line.

```$ ssh <netid>@hpc.arizona.edu```

Fill in the necessary credentials to complete the login.

## Access Puma
After successfully logging into bastion host simply type ```$ puma``` to access a **Puma login node**.

The purpose of a Puma login node is for users to perform housekeeping work, edit scripts, and submit their job requests for execution on one/some of the cluster’s compute nodes.

**This is not where scripts are run**. To learn more about executing scripts look [here](#run-scripts-on-puma)

Now that your account is associoated with a sponsor group, you are granted access to the resources of that group. Each group has a monthly allocation of 70000 standard CPU hours on Puma and when you run a job, the hours used are deducted from your group’s account. For example, if you run a job for one hour using 5 CPUs, 5 CPU hours will be charged.

You can view the your sponsor groups used and remaining hours by using the command:

```$ va```

![SLURM File](/images/va.png)

## Access Software on Puma
To start, request an **interactive session** for one hour:

```$ interactive```

This command takes you from Puma's login node to a compute node. Each compute node comes with:
* AMD Zen2 96 core processors
* 512GB RAM
* 25Gb path to storage
* 25Gb path to other nodes for MPI
* 2TB internal NVME disk (largely available as /tmp)
* Qumulo all flash storage array for shared filesystems
* Two large memory nodes with 3TB memory and the same processors and memory as the other nodes
* Six nodes with four Nvidia V100S GPU's each

Get a look at the available built in modules:

```$ module avail```

You'll see which modules are loaded into your system indicated by the ```(L)``` to the right of the listed modules. More specifically you may view a list of all loaded modules using ```$ module list```

Load a module:

```$ module load <software/version>```

If you choose not to specify the version then the lastest version of the defined software will usually be loaded.

To swap a version of a software with another version use:

```$ module swap <currentSoftware/CurrentVersion> <newSoftware/newVersion>```

## Run Scripts on Puma
After creating and compiling your code, write a **SLURM** job script.

SLURM is a scheduler software that will reserve resources and run work on the cluster's compute nodes when space becomes available.

To run a slurm job a .slurm file must be created blueprinting how to run your code.

This .slurm file is spearated into two parts, **resource requests** and **job instructions**.

The first portion of your script tells the system the resources you’d like to reserve. This includes the number of **nodes/cores** you need, the **time** it will take to run your job, the **memory** required, your **group's name**, the **partition**, and any special instructions. Other optional job specifications may also be set such as a **job name** or requesting **email notifications**. Each line with one of these requests will start with **#SBATCH**. If you’d like to comment out optional specifications that you don’t want, change these to **### SBATCH**. You may also delete them.

The second section tells the system exactly how to do your work. These are all the commands (e.g. loading modules, changing directories, etc) that you would execute **in your current environment** to run your script successfully. SLURM, by default, inherits the working environment present at the time of job submission. This behavior may be modified with additional SLURM directives.

![SLURM File](/images/slurm.png)

Submit your SLURM job:

```$ sbatch <your_SLURM_script>.slurm```

The output of this command gives you the **job ID**. With it you can track the status of the job:

```$ squeue --job <job_id>```

A status of ```PD``` means the job is pending. ```R``` indicates the job is running. When the job is finished you will not see any information regarding the job.

![Pending SLURM Job](/images/pending.png)

![Finished SLURM Job](/images/finished.png)

SLURM provides the output file of the job in the format ```<job_name>-<job_id>.out``` or however you defined the the output file in the line ```# SBATCH --output=<output_file_format>``` from your SLURM script.

## Demo
Now that we understand basic HPC and Puma operations let's do a quick demo calculating the Mandelbrot set.

First, access the University of Arizona's bastion login node:

```$ ssh <netid>@hpc.arizona.edu```

Once there is a connection open Puma:

```$ puma```

Clone this repository into the directory that best suits you:

```$ git clone https://github.com/CompOpt4Apps/AthanPumaDemo.git```

Open mandelbrot_openmp.slurm in an editor and change the line ```cd ~/demo/AthanPumaDemo``` by giving the absolute path to **AthanPumaDemo** on your machine ```cd <path>/AthanPumaDemo```

Request an interactive session using a compute node:

```$ interactive```

EDIT SLURM TO INCLUDE NEEDED MODULES

Load any necessary modules:

```$ module load <software/version>```

Finally, submit the SLURM job:

```$ sbatch mandelbrot_openmp.slurm```

You will see a **.ppm** file, the output of the SLURM job. This file gives us the Mandelbrot set. When opened with an application that accepts .ppm files such as GIMP, an image of the set will appear.

