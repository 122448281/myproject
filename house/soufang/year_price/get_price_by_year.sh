#!/bin/sh
tmpfile=tmp1.$0
wget "http://fangjia.fang.com/pinggu/ajax/chartajax.aspx?dataType=4&city=%u5317%u4EAC&Class=defaultnew&year=8" -O $tmpfile
sed -i 's/&/\n/g' $tmpfile
sed -i 's/],/]\n/g' $tmpfile
sed -i 's/\[\[/******\n\[/g' $tmpfile
sed -i 's/\]\]/]\n******/g' $tmpfile

cat $tmpfile | sed 's/\[//g' | sed 's/\]//g' |awk -F "," '{if($0 ~ /,/){aa=$1/1000; bb=strftime("%Y/%m/%d",aa); print bb" "$2}else{print $0}}'

rm $tmpfile

