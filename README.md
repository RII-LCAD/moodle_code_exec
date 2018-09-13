#Sistema de Controle e Processamento de Códigos de Programação

Sistema de apoio ao processamento de códigos-fonte em diferentes linguagens de programação integrado ao módulo de feedback do Moodle.

Requisitos:
- Integração com o [plugin para Moodle](https://gitlab.com/rii_lcad/plugin)
- Criação da pasta do módulo
	- Criação do script de processamento "execute_code.sh" dentro deste módulo.
	- Adição dos arquivos de configuração de conexão semelhantes ao [modelo](https://gitlab.com/rii_lcad/plugin/blob/master/file.conf)
	- Instalação dos pré-requisitos para execução
	- Adição dos binários auxiliares chamados neste script
- Teste de conexão do framework integrado à plataforma Moodle
- Teste de execução dos códigos e saídas aguardadas