import sys
import pygal
filename=sys.argv[1]
fp=open(filename)
all_lines = fp.readlines()
num={}
for line in all_lines:
	da=line.split(' ')
	if len(da) != 3:
		continue
	tm=da[0].split('-')
	tm2=tm[0]+"." +tm[1]
	if tm2 in num:
		num[tm2]=int(num[tm2])+int(da[2])
	else:
		num[tm2]=int(da[2])

num2= sorted(num.iteritems(), key=lambda d:d[0])
v1=[]
v2=[]
for key in num2:
	v1.append(key[0])
	v2.append(key[1])
#	print key[0],key[1]

#print v1
#print v2
line_chart = pygal.Line()
#line_chart.width = 5000
#line_chart.height= 1000
line_chart.title = 'Browser usage evolution (in %)'
line_chart.x_labels = v1
line_chart.add('num', v2)
line_chart.render()
svg_xml = line_chart.render()
svg_xml='<svg  style="width:500px" '+svg_xml[4:]
import os
f=open('aaa.html','w')
#f.write(line_chart.render())
f.write(svg_xml)
f.close()
