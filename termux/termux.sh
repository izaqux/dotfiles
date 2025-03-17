#!/bin/bash
#
#	@utor Izaqux
#	Shell Script
#

# Exibir o uso
usage() {
	echo -e "\e[31m\e[1mExemplo de uso:\e[0m"
	echo ""
	echo -e "\e[94m\e[1mtermux -i\e[0m              - Instala os arquivos, no diretório padrão $HOME\e[0m"
	echo -e "\e[94m\e[1mtermux -u\e[0m              - Desinstala os arquivos, no diretório padrão $HOME\e[0m"
	echo -e "\e[94m\e[1mtermux -i <caminho>\e[0m    - Instala os arquivos, em um diretório especificado\e[0m"
	echo -e "\e[94m\e[1mtermux -u <caminho>\e[0m    - Desinstale os arquivos, Se termuxDir.log existir, use esse caminho, caso contrário, use um diretório especificado\e[0m"
	echo ""
	echo ""
}

# Log
termuxDir="/data/data/com.termux/files/usr/var/log/termuxDir.log"

# Instalar os arquivos
installFiles() {
	local diretorio="$1"
	mkdir -p "$diretorio/.script"
	mkdir -p "$diretorio/.termux/boot/"

	cp -av .termux/boot/iniscript.sh "$diretorio/.termux/boot/"
	cp -av .bashrc "$diretorio"
	cp -av ../common/.bash_aliases "$diretorio"

	chmod +x "$diretorio/.termux/boot/iniscript.sh"
	chmod +x "$diretorio/.bashrc"
	chmod +x "$diretorio/.bash_aliases"
	echo "Arquivos instalados com sucesso em $diretorio"
	
	echo "$diretorio" > "$termuxDir"
}

# Desinstalar os arquivos
uninstallFiles() {
	if [ -f "$termuxDir" ]; then
		local diretorio=$(cat "$termuxDir")
	else
		local diretorio="$1"
	fi
	rm -rf "$diretorio/.termux/boot/iniscript.sh"
	rm -rf "$diretorio/.bashrc"
	rm -rf "$diretorio/.bash_aliases"
	rm -rf "$termuxDir"
	echo "Arquivos removidos com sucesso em $diretorio"
}

case "$1" in
	-i)
		# Instalar
		if [ "$#" -eq 2 ]; then
			diretorio="$2"
		else
			diretorio="$HOME"
		fi
		installFiles "$diretorio"
	;;
	-u)
		# Desinstalar
		if [ "$#" -eq 2 ]; then
			diretorio="$2"
		else
			diretorio="$HOME"
		fi
		uninstallFiles "$diretorio"
	;;
	*)
		# Argumento inválido
		usage
	;;
esac