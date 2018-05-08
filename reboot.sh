#!/bin/sh

#Variablen
MessageSent="/tmp/msg.token.tmp"

FestplattenBelegung=`df -h |grep /media/hdd | awk '{print $5}'`

#AusstehendeUpdates=`opkg list-upgradable'

POUser="UserId"
POToken="TokenID"
POTitle="VU-Solo2"
POMessage="SatBox Booted und Online. Die Festplatte ist zu $FestplattenBelegung belegt."

echo $POTitle
echo $POMessage
echo $AusstehendeUpdates

Uhrzeit=`date +"%H%M"`
TStartZeit=0
TEndZeit=700


if [ $Uhrzeit -lt $TEndZeit ]
then 
 echo
 echo Ermittelte Uhrzeit: $Uhrzeit
 echo


 if [ ! -f $MessageSent ]
 then
 curlreturn=$(curl -sk --form-string "title=$POTitle" \
                       --form-string "token=$POToken" \
                       --form-string "user=$POUser" \
                       --form-string "message=$POMessage" \
                       https://api.pushover.net/1/messages.json)
  
#  echo $curlreturn
  touch $MessageSent
#  /media/usb/scripts/rem-nz.sh &

 fi
fi

exit 0
