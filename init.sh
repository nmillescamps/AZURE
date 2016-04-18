#!/bin/bash

#Copy User informations in $FILE_PATH 

FILE_PATH=/etc/azure.txt
sudo touch $FILE_PATH

while getopts "c:f:l:e:p:r:j:o:s:g:" opt; do
  echo "Option $opt set with value $OPTARG"
  case $opt in
		c)	COMPANY=$OPTARG
		;;
		f)	FIRSTNAME=$OPTARG
		;;
		l)	LASTNAME=$OPTARG
		;;
		e)	EMAIL=$OPTARG
		;;
		p)	BUSINESSPHONE=$OPTARG
		;;
		r)	JOBROLE=$OPTARG
		;;
		j)	JOBFUNCTION=$OPTARG
		;;
		o)	OFFER=$OPTARG
		;;
		s)	SKU=$OPTARG
		;;
		g)	LOCATION=$OPTARG
		;;
    \?)
      echo "Invalid option: -$OPTARG"
      ;;
  esac
done

#Creation Date
DATE=$(date)

echo "COMPANY:"$COMPANY >>$FILE_PATH
echo "FIRSTNAME:"$FIRSTNAME >>$FILE_PATH
echo "LASTNAME:"$LASTNAME >>$FILE_PATH
echo "EMAIL:"$EMAIL >>$FILE_PATH
echo "BUSINESSPHONE:"$BUSINESSPHONE >>$FILE_PATH
echo "JOBROLE:"$JOBROLE >>$FILE_PATH
echo "JOBFUNCTION:"$JOBFUNCTION >>$FILE_PATH
echo "OFFER:"$OFFER >>$FILE_PATH
echo "SKU:"$SKU >>$FILE_PATH
echo "LOCATION:"$LOCATION >>$FILE_PATH
echo "CREATION DATE:"$DATE >>$FILE_PATH


#Create /etc/license_type_id
FILE_LICENSE=/etc/license_type_id
sudo touch $FILE_LICENSE

if [[ $SKU = *"pr"* ]]; then
DIGIT1=3
echo "DIGIT1 ="$DIGIT1
fi

if [[ $SKU = *"ad"* ]]; then
DIGIT1=2
echo "DIGIT1 ="$DIGIT1
fi

if [[ $SKU = *"st"* ]]; then
DIGIT1=1
echo "DIGIT1 ="$DIGIT1
fi

DIGIT2=${SKU:(-1)}
echo "DIGIT2 ="$DIGIT2
echo $SKU

echo $DIGIT1$DIGIT2 >$FILE_LICENSE




# only for mailgate image 
ln -s /usr/sbin/sendmail.postfix /usr/sbin/sendmail
cat /etc/azure.txt | mail -s "Azure MarketPlace - New Mailgate Virtual Machine" mailgate.azure.subscription@axway.com


