#! /bin/bash 
for dir in */ .*/
do
	if [[ "$dir" != "./" && "$dir" != "../" ]]; then
		if [[ -f  "$dir/resposta.txt" ]]; then
 			rm "$dir/resposta.txt"
		fi
		for entry in $dir*.pl
		do
			swipl "$entry.pl" &> "$dir/resposta.txt"
		done
	fi
done
