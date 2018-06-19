#!/bin/tcsh




set input = ./eventinfo.EWPredict.csv
set output = ./eventinfo.EWPredict2.csv




# 1. remove _PPP lines
set tmp1 = ./.tmp1

##cat $input |sed 's/_PPP//g' >! $tmp1
cat $input |sed '/_PPP/d' >! $tmp1



# 2. form EQ_STA_PHASE flag and append to end of file
set tmp2 = ./.tmp2
cat $tmp1 |awk '{print $0,$12"_"$1"_"$20}' >! $tmp2

mv $tmp2 $output



/bin/rm -rf $tmp1 $tmp2

