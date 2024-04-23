#!/bin/bash
from=$1
to=$2

mkdir -p "$to"
find "$from" -type f | while IFS= read -r idx; do
count=0
while [ $count -eq 0 ] && [ -e "$to"/"$(basename "$idx")" ] || [ -e "$to"/"$count"_"$(basename "$idx")" ]; do
	count=$((count+1))
done
filename=$(basename -- "$idx")
if [ $count -eq 0 ]
then 
	cp "$idx" "$to/$filename"
fi
if (( $count > 0 ))
then
	cp "$idx" "$to/${count}_$filename"
fi
done
