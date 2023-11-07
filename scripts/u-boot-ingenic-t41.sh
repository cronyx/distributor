#!/bin/bash

export CROSS_COMPILE=mipsel-linux-gnu-

declare -A cfg
cfg[t41l]="isvp_t41l_sfc_nor"
cfg[t41lq]="isvp_t41lq_sfc_nor"
cfg[t41n]="isvp_t41n_sfc_nor"
cfg[t41nq]="isvp_t41nq_sfc_nor"
cfg[t41a]="isvp_t41a_sfc_nor"
cfg[t41zx]="isvp_t41zx_sfc_nor"
cfg[t41xq]="isvp_t41xq_sfc_nor"

ln -s compiler-gcc7.h include/linux/compiler-gcc10.h
mkdir -p ../ingenic-output

for soc in ${!cfg[@]}; do

make distclean
make ${cfg[$soc]}

make -j8
cp u-boot-with-spl.bin ../ingenic-output/u-boot-${soc}-universal.bin

done

mv ../ingenic-output -T output
