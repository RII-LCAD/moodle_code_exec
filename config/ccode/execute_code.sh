#! /bin/bash
for dir in */ .*/
do
	if [[ "$dir" != "./" && "$dir" != "../" ]]; then
		if [[ -f  "$dir/resposta.txt" ]]; then
 			rm "$dir/resposta.txt"
		fi
		if [[ -f  "$dir/exe_code" ]]; then
                        rm "$dir/exe_code"
                fi
		for entry in $dir*.c
		do
			gcc -o "$dir/exe_code" "$entry" &> "$dir/resposta.txt"
			if [ -f "$dir/exe_code" ]; then
				"$dir/exe_code" &> "$dir/resposta.txt"
			fi
		done
	fi
done
