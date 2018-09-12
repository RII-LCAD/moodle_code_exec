#! /bin/bash
for dir in */ .*/
do
	if [[ "$dir" != "./" && "$dir" != "../" ]]; then
		if [[ -f  "$dir/resposta.txt" ]]; then
 			rm "$dir/resposta.txt"
		fi
		for entry in $dir*.m
		do
			octave "$entry.m" &> "$dir/resposta.txt"
		done
	fi
done
