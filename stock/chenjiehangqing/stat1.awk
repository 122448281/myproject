#!/bin/sh
BEGIN {
num1=0;
num2=0;
sum=0;
}
{
	if($NF > 0){
		num1 +=1;
	}
	if($NF < 0){
		num2 +=1;
	}
	sum +=1;
}
END{
	print "year_num:"sum " pos num:"num1" neg num:" num2;
}
