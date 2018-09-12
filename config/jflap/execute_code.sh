#! /bin/bash
for dir in */ .*/
do
	if [[ "$dir" != "./" && "$dir" != "../" ]]; then
		if [[ -f "$dir/resposta.txt" ]]; then
			rm "$dir/resposta.txt"
		fi
		for entry in $dir*.jff
		do
			while read teste; do
				java -jar jflaplib-cli-1.3-bundle.jar run "$entry" "$teste" >> "$dir/resposta.txt"
			done < tests.txt
		done
	fi
done
