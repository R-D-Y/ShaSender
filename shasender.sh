#!/bin/bash
#Made by R-D-Y


# Servers list > you can change with your own path 
mapfile -t servers < /root/scripts/servers.txt

# Log File > you can change with your own path 
logfile="/root/scripts/scp.log"

function f_preambule () {
        preambule="$(date +%Y/%m/%d-%T.%3N) - $server"
}

# Public key
PUBLIC_KEY=~/.ssh/id_rsa.pub


# Loop for each servers
for server in "${servers[@]}"
do
   f_preambule

   if ssh-copy-id -i $PUBLIC_KEY $server
   then
           echo $preambule ": Your public key have been sent to $server " >> $logfile
   else
           echo $preambule ": Error during sending your public key to $server" >> $logfile
           echo $preambule ": ShaSender have been stopped" >> $logfile
   fi


  # Write on the log file
f_preambule
   echo $preambule" : Le script s'est déroulé correctement" >> $logfile
   echo "==================================================================================================" >> $logfile

done

echo "==================================================================================================" >> $logfile
