#!/bin/bash

if [[ $# != 2 || "$1" == "-h" || "$2" == "-h" ]]
then
        echo "usage: check_code_path.sh path_list_file source_code_path"
        exit 1
fi

path_list_file=$1
source_code_path=$2
failed_path_file=~/check_path_temp/failed_path.txt

mkdir -p ~/check_path_temp

echo "check dir is $2"

for path in `cat $path_list_file`
do
    if [ -d $source_code_path/$path ];then
        echo "$path     ok"
    else
        echo "$path    fail!!!"
        echo $path >> $failed_path_file
    fi
done

echo "Check done! Please check $failed_path_file"
