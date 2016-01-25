import urllib
import json
import sys
YEAR=sys.argv[1]
MON=sys.argv[2]
url='http://www.tanfang.wang/deal/dealnYearMonthJson.php?year='+str(YEAR) +'&month=' + str(MON)
page=urllib.urlopen(url)
data=page.read()
ddata=json.loads(data)
for location in ddata:
	print location["dealdate"],location["nums"]
