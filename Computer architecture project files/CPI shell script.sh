#!bin/sh

cd results/

string1="system.cpu.dcache.overall_misses::total"
string2="system.cpu.icache.overall_misses::total"  
string3="system.l2.overall_misses::total"

for file in *
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
			esac
		done < $file


val=`echo "$a + $b" | bc`
echo "$val"
first=`echo "$val * 6" | bc`
echo "$first"
sec=`echo "$c * 50" | bc`
echo "$sec"
top=`echo "$first + $sec" | bc`
echo "$top"
total=`echo "$top / 500000000" | bc -l`
echo "$total"
cpi=`echo "$total + 1" | bc`
echo "$cpi"

echo "$a,$b,$c,$cpi" >> result1_288_1.csv
fi
done
