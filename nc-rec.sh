#!/bin/bash

for i in {80..2000..2}
  do
     nc -v -w 30 -p $i -l > /root/scripts/file$i.tgz &

 done
