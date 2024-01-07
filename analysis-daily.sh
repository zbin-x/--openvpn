#!/bin/bash                                                                                                                                            
#name=`date | awk -F " " '{print $6"-"$2"-"$3}'`                                                                                                       
                                                                                                                                                       
cd /var/log/open-login/login-date-log/                                                                                                                 
name="`ls -l|wc -l`_`date | awk -F " " '{print $6"-"$2"-"$3}'`"                                                                                        
                                                                                                                                                       
touch "$name".txt                                                                                                                                      
cat /var/log/openvpn.log | awk -F " " '{print $1" "$2" "$3" "$4" "$5" "$6}' | grep "`date |awk -F " " '{print $1" "$2" "$3}'`" | awk '!a[$0]++{print}' 
> /var/log/open-login/login-date-log/"$name".txt                                                                                                       
sshpass -pElephant123 scp -r /var/log/open-login/login-date-log/"$name".txt root@192.168.1.11:/Elephant_backup/Open_VPN-log/  



awk '!a[$0]++{print}' //去重复行
