#!/bin/sh
file="investment-weekly.txt"
resdir="investment-weekly-origfile"
mkdir -p $resdir
filename=tmp1.$0
#filename=$1

da=`date`
wget "http://www.chinaclear.cn/cms-webapp/wcm/toErveyWeek_mzkb.action" -O $filename

tm=`grep "一周投资" $filename | grep "-" | awk -F "[（|）]" '{print $2}'`
data=`grep "</SPAN></P></TD></TR>" $filename | sed '$d' | awk -F "[<|>]" 'BEGIN{ALL="";}{ALL=(ALL" "$5)}END{print ALL}'`

num=`echo $tm$data | awk -F " " '{print NF}'`

num2=`echo "$tm$data" | sed -n "/^[0-9 \.,-]\+$/p" | wc -l | cut -d " " -f1`

if [ $num -ne 17  -o $num2 -ne 1 ]
then
    echo "$da date format error"
    rm $filename
    exit
fi


if [ ! -f $resfile ]
then
    touch $resfile
fi

dup=`grep "$tm" $resfile | wc -l | cut -d " " -f1`
if [ $dup -eq 0 ]
then
    echo "$tm$data" >> $resfile
    mv $filename $resdir/${tm}.html
    echo "$da is OK"
else
    echo "$da date duplicate"
    rm $filename
fi

