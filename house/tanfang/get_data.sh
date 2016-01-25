#!/bin/sh

for year in `seq 2007 2016`
do
	for month in `seq 1 12`
	do
		num=`echo ${#month}`
		if [ $num -eq 1 ]
		then 
			month="0$month"
		fi
		echo $year"-"$month
		python parse_price.py $year $month
		sleep 1
	done
done


