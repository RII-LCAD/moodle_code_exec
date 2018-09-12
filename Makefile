all: octave ccode algnum

jflap:
	php download.php -d ./arquivos/jflap/ --conf ./config/jflap/moodle.conf
	bash conf.sh jflap arquivos/jflap/
	php upload.php -d arquivos/jflap/ --conf ./config/jflap/moodle.conf
octave:
	php download.php -d ./arquivos/octave/ --conf ./config/octave/moodle.conf
	bash conf.sh octave arquivos/octave/ 
	php upload.php -d ./arquivos/octave/ --conf ./config/octave/moodle.conf
ccode:
	php download.php -d ./arquivos/ccode/ --conf ./config/ccode/moodle.conf
	bash conf.sh ccode arquivos/ccode/ 
	php upload.php -d ./arquivos/ccode/ --conf ./config/ccode/moodle.conf
prolog:
	php download.php -d ./arquivos/prolog/ --conf ./config/prolog/moodle.conf
	bash conf.sh prolog arquivos/prolog/
	php upload.php -d ./arquivos/prolog/ --conf ./config/prolog/moodle.conf
algnum:
	php download.php -d ./arquivos/algnum/ --conf ./config/algnum/moodle.conf
	bash conf.sh algnum arquivos/algnum/
	php upload.php -d ./arquivos/algnum/ --conf ./config/algnum/moodle.conf

