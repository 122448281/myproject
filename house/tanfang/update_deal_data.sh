#!/bin/sh
year=`date "+%Y"`
month=`date "+%m"`
tmpfile=tmp0.$0
datefile=$1
python parse_price.py $year $month > $tmpfile
valid_num=0
while read line
do
	num2=`echo $line | awk -F " " '{print NF}'`
	if [ $num2 -ne 3 ]
	then 
		continue
	fi
	time=`echo $line | awk -F " " '{print $1}'`
	num=`grep $time $datefile | wc -l  | cut -d " " -f1`
	if [ $num -eq 0 ]
	then
		echo $line >> $datefile
		valid_num=`echo $valid_num + 1 |bc`
	fi
done < $tmpfile
rm $tmpfile
echo `date`" get page ok, valid_num:"$valid_num

