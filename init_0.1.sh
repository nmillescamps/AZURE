#!/bin/bash

#Copy informations in $FILE_PATH 

while getopts "c:f:l:e:p:r:j:o:s:" opt; do
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
    \?)
      echo "Invalid option: -$OPTARG"
      ;;
  esac
done
FILE_PATH=/etc/azure.txt
sudo touch $FILE_PATH

echo "COMPANY:"$COMPANY >>$FILE_PATH
echo "FIRSTNAME:"$FIRSTNAME >>$FILE_PATH
echo "LASTNAME:"$LASTNAME >>$FILE_PATH
echo "EMAIL:"$EMAIL >>$FILE_PATH
echo "BUSINESSPHONE:"$BUSINESSPHONE >>$FILE_PATH
echo "JOBROLE:"$JOBROLE >>$FILE_PATH
echo "JOBFUNCTION:"$JOBFUNCTION >>$FILE_PATH
echo "OFFER:"$OFFER >>$FILE_PATH
echo "SKU:"$SKU >>$FILE_PATH

