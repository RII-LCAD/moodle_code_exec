#!/bin/bash

_processo=$1
_base=$2
_path=`pwd`

echo "Listando as atividades da base $_base"
ls $_base > temp/atividades.txt


while read _atividade
do
	if [[ ! -f "$_path/$_base$_atividade" ]]
	then
		echo $_atividade
		if [[ ! -f "$_path/$_base$_atividade/Makefile" ]]
		then
			echo "Nao possui Makefile"
			cp ./config/Makefile $_base/$_atividade/
			cp -r ./config/$_processo/execute_code.sh $_base/$_atividade/
			if [[ "$_processo" == "jflap" ]]
			then
				cp ./config/$_processo/jflaplib-cli-1.3-bundle.jar $_base/$_atividade/
			fi
		fi
	fi

done < temp/atividades.txt

while read _atividade
do
	if [[ ! -f "$_path/$_base$_atividade" ]]
	then
		make -C $_path/$_base$_atividade  preprocess
	fi

done < temp/atividades.txt

echo "Marcando treino no Moodle"
php upload.php -d arquivos/$_processo/ --conf ./config/$_processo/moodle.conf

echo "Atualizando a base"
php download.php -d arquivos/$_processo/ --conf ./config/$_processo/moodle.conf

while read _atividade
do
	if [[ ! -f "$_path/$_base$_atividade" ]]
        then
		echo $_path/$_base$_atividade/
        	make -C $_path/$_base$_atividade evaluation
	fi
done < temp/atividades.txt
