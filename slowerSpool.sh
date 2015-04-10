#/bin/bash
help()
{
echo "$0 <chunks> <sleep> <inputfile> <outputfile>"
echo $CHUNK
echo $SLEEP
echo $INPUT
echo $OUTPUT
}

c=0
l=0
f=100000

CHUNK=$1
SLEEP=$2
INPUT=/tmp/input/$3

test ! -f "$INPUT" && help && exit 1

cat $INPUT | while read a
do
	c=$(($c+1))
	l=$(($l+1))
	echo $a >>/tmp/output/hide_$4$f
	test $l != $CHUNK && continue
	mv /tmp/output/hide_$4$f /tmp/output/$4$f
	sleep $SLEEP
	echo -ne "\r$c"
	l=0
	f=$(($f+1))
done
date

