#!/bin/tcsh



set PWD = `pwd`
set input = $PWD/eventinfo.EWPredict.50EQ
set output = $PWD/eventinfo.EWPredict.50EQ.csv




# 1. remove _PPP lines
##set tmp1 = ./.tmp1

##cat $input |sed 's/_PPP//g' >! $tmp1
##cat $input |sed '/_PPP/d' >! $tmp1



# 2. form EQ_STA_PHASE flag and append to end of file
set tmp2 = ./.tmp2
cat $input |awk '{print $0,$12"_"$1"_"$20"_"$13}' >! $tmp2

cat $tmp2 | tr -s '[:space:]' >!  $output

set tmp3 = ./.tmp3

cat ./header $output >! $tmp3
mv $tmp3 $output


/bin/rm -rf $tmp2

