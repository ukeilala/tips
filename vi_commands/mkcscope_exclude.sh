#!/bin/bash

Linux_Kernel_SRC=/home/linux
Cscope_files=/home/linux/cscope.files

find  -path "specific" ! -path "specific/test" -prune -o -path "specific/a" -prune -o -name '*.[chxsS]'
-print > 
