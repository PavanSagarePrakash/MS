#!bin/sh

cd output/

string1="system.cpu.branchPred.BTBMisspct"
string2="system.cpu.branchPred.BTBHitPct" 
string3="system.cpu.BranchMispredPercent"
string4="system.cpu.dcache.overall_misses::total"
string5="system.cpu.icache.overall_misses::total"  
string6="system.l2.overall_misses::total"
string7="sim_insts"

for file in */out_put_file/stats.txt; 
	do
	if [ -f $file ]
	then
		while read line  
			do
			case "$line" in
				(*$string1*)
				a="$( echo $line | cut -d" " -f2)"
				#echo "$a"
				;;
				(*$string2*)
				b="$( echo $line | cut -d" " -f2)"
				#echo "$b"
				;;
				(*$string3*)
				c="$( echo $line | cut -d" " -f2)"
				#echo "$c"
				;;
				(*$string4*)
				d="$( echo $line | cut -d" " -f2)"
				#echo "$d"
				;;
				(*$string5*)
				e="$( echo $line | cut -d" " -f2)"
				#echo "$e"
				;;
				(*$string6*)
				f="$( echo $line | cut -d" " -f2)"
				#echo "$f"
				;;
				(*$string7*)
				h="$( echo $line | cut -d" " -f2)"
				#echo "$h"
				;;	
			esac
done < $file		
echo "$a,$b,$c,$d,$e,$f,$h" >> res_bzip.csv
fi
done
