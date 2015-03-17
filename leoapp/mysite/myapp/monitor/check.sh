#!/bin/sh
# init ruby on rails  

set -e

# Check rails server is ok or not
num=`netstat  -ntlp|grep ruby|grep 80| wc -l`;
if [ "$num" -eq 1 ] ;then
	 echo rails server is ok 
else
	 echo rails server is not ok 
	 MSG="`hostname` rails server is not ok "
	 echo $MSG | /bin/mail -s "check rails server" wosuinifei@126.com
fi
