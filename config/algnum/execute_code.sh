#! /bin/bash
for dir in */ .*/
do
        if [[ "$dir" != "./" && "$dir" != "../" ]]; then
                if [[ -f  "$dir/resposta.txt" ]]; then
                        rm "$dir/resposta.txt"
                fi
		if [[ -d  "testes/" ]]; then
			for test in testes/*
			do
				if [[ $dir != "testes/" ]]; then
					cp "$test" "$dir/arquivo_entrada.m"
					cd "$dir"
		                        octave "principal.m" 
					cat "arquivo_saida.m" >> "resposta.txt"
					cd ".."
				fi
			done
		else
			echo "dir testes/ not exists"
		fi
        fi
done
