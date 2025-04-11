if [ "$#" -eq 0 ]
then
	echo "Usage:phone search for [...searchfor]"
	echo "(You didn't tell me what you want to search for.)"
	exit 1
fi

search_terms=$(echo "$@" | tr ' ' '|')

egrep "$search_terms" mydata.txt > tmp.txt

if [ -s tmp.txt ]
then
	awk -f display.awk tmp.txt
else
	echo "No matching"
fi

rm -f tmp.txt
