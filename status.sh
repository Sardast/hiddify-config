#!/bin/bash
function main(){
	systemctl status --no-pager nginx hiddify-xray haproxy|cat

for s in netdata other/**/*.service **/*.service nginx haproxy;do
	s=${s##*/}
	s=${s%%.*}
	printf "%-30s %-30s \n" $s $(systemctl is-active $s)
done
echo "---------------------Finished!------------------------"



}
mkdir -p log/system/
main |& tee log/system/status.log
