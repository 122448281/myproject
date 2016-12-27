
import sys


def chunjie_predict(stock_file_name, tm):
	a=tm.split('-')
	y1=int(a[0])
	m1=int(a[1])
	d1=int(a[2])
	fp=open(stock_file_name, "r")
	all_lines=fp.readlines()
	num=0
	last_y2=2020
	last_m2=0
	last_d2=0
	index=-1
	svalue=[]
	for line in all_lines:
		[tm_s, value]=line.split('\t')
		b=tm_s.split('-')
		y2=int(b[0])
		m2=int(b[1])
		d2=int(b[2])
		if y1 == y2 and m1 == m2 and d1 == d2:
			index=num
		#if y1 == y2  and (m1 >= m2 or (m1 == m2 and d1 >= d2)) and index == -1:
		if y1 == y2  and m1 == m2 and d1 >= d2 and index == -1:
			index=num
		if y1 == y2  and m1 > m2 and index == -1:
			index=num
		num+=1
		svalue.append(float(value))
	
	print num,index
	
	for step in range(0,12):
#		pre_day_num=5
		pre_day_num=1
		after_day_num=5
		after_gap_num=step * 10
		pre_sum=0
		after_sum= 0 
		for i in range(index, index + pre_day_num):
#		for i in range(index - pre_day_num, index ):
			pre_sum += svalue[i]
		
			
		for i in range(index - after_day_num - after_gap_num, index - after_gap_num):
			after_sum += svalue[i]
		
		
		pre_avg=pre_sum/pre_day_num
		after_avg=after_sum/after_day_num
		print tm, "step:", step * 10, pre_avg, after_avg, (after_avg - pre_avg)/pre_avg
if __name__ == '__main__':
	stock_file_name=sys.argv[1]
	tm_file_name=sys.argv[2]
	fp=open(tm_file_name, "r")
	all_lines=fp.readlines()
	for line in all_lines:
		line=line.strip('\n')
		chunjie_predict(stock_file_name, line)
