#!/bin/bash

if [ "$1" == "" ]; then
  echo -e "\e[31;1mNo executable given!\e[0;0m"
  echo "Usage: ./time-measure.sh <executable>"
  exit 1
fi

echo "[+] Starting measurement ..."

begin=$(date +%ss-%Nns)

./$1

end=$(date +%ss-%Nns)

b_s=$(echo $begin | sed "s#s-# #g" | awk '{print $1}')
b_ns=$(echo $begin | sed "s#s-# #g" | awk '{print $2}' | sed "s#ns##g")
e_s=$(echo $end | sed "s#s-# #g" | awk '{print $1}')
e_ns=$(echo $end | sed "s#s-# #g" | awk '{print $2}' | sed "s#ns##g")

res=$( echo "${e_s}.${e_ns}-${b_s}.${b_ns}" | bc )
res_s=$( echo "$res" | awk -F\. '{print $1}')
res_ns=$( echo "$res" | awk -F\. '{print $2}')

if [ "$res_s" == "" ]; then res_s=0; fi

echo "---"
echo "Executed: $1"
echo "Execution time: ${res_s}s ${res_ns}ns"
echo "---"
