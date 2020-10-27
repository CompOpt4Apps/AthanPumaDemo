#! /bin/bash
#
gcc -c -Wall -fopenmp mandelbrot_openmp.c
if [ $? -ne 0 ]; then
  echo "Compile error."
  exit
fi
#
gcc -fopenmp mandelbrot_openmp.o -lm
if [ $? -ne 0 ]; then
  echo "Load error."
  exit
fi
rm mandelbrot_openmp.o
# mv a.out $HOME/binc/mandelbrot_openmp
#
echo "Normal end of execution."
