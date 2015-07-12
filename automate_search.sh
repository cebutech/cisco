cat gather_information.sh
#!/bin/sh
read -p "Please enter your a.xxx username: " var
#read -p "Password: " -s SSHPASS
#export SSHPASS
#make sure you place your "server_list.txt"
#in the same dir your run the script

for server in $(cat server_list.txt); do
     if ! ping -n 1 -w 5 $server;
     then
         echo "$server is down"
         echo $server >> server_down.txt
     else
         echo "host is up "
         ssh -t $var@"$server" "ifconfig |grep -i eth"
fi
done


cat test.sh
#!/bin/sh

while read server; do
         echo $server
done < ./server_list.txt

