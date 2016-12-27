#!/bin/sh
for i in `seq 0 12`
do
	sum=`echo "$i * 10" | bc`
	data=`grep "step: $sum " $1 | awk -F " " -f stat1.awk`
	echo $i" " $sum " "$data
done
