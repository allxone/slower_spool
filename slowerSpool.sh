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

CHUNK=$1
SLEEP=$2
INPUT=/tmp/input/$3
OUTPUT=/tmp/output/$4

test ! -f "$INPUT" && help && exit 1
test  -f "$OUTPUT" && echo "please remove $OUTPUT" && exit 1

cat $INPUT | while read a
do
	c=$(($c+1))
	l=$(($l+1))
	echo $a >>$OUTPUT
	test $l != $CHUNK && continue
	sleep $SLEEP
	echo -ne "\r$c"
	l=0
done
date

