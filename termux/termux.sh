#!/bin/bash
#
#	@utor Izaqux
#	Shell Script
#

# Se existe .bashrc na mesma pasta . então chama função termux()
term() {
	if [ -f "./.bashrc" ]; then
		source ./.bashrc
	fi
}

usage() {
	echo -e "\e[1;31mExemplo de uso:\e[0m"
	echo ""
	echo -e "\e[1;94mtermux -i\e[0m              \e[1;97m- Instala os arquivos, no diretório padrão $HOME\e[0m"
	echo -e "\e[1;94mtermux -u\e[0m              \e[1;97m- Desinstala os arquivos, no diretório padrão $HOME\e[0m"
	echo -e "\e[1;94mtermux -i <caminho>\e[0m    \e[1;97m- Instala os arquivos, em um diretório especificado\e[0m"
	echo -e "\e[1;94mtermux -u <caminho>\e[0m    \e[1;97m- Desinstale os arquivos, Se termuxDir.log existir, use esse caminho, caso contrário, use um diretório especificado\e[0m"
	echo ""
	echo ""
}

# Log
termuxDir="/data/data/com.termux/files/usr/var/log/termuxDir.log"

# Instalar os arquivos
installFiles() {
	pkg update && pkg upgrade -y
	pkg install clang -y
	
	local diretorio="$1"
	mkdir -p "$diretorio/.script"
	mkdir -p "$diretorio/.termux/boot/"

	cp -av .termux/boot/iniscript.sh "$diretorio/.termux/boot/"
	cp -av .bashrc "$diretorio"
	cp -av ../common/.bash_aliases "$diretorio"

	chmod +x "$diretorio/.termux/boot/iniscript.sh"
	chmod +x "$diretorio/.bashrc"
	chmod +x "$diretorio/.bash_aliases"
	echo ""
	echo -e "\e[1;97mArquivos instalados com sucesso em $diretorio\e[0m"

	g++ ../common/d.cpp -o "$diretorio/.script/d"
	
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
	rm -rf "$diretorio/.script/d"
	rm -rf "$termuxDir"
	echo -e "\e[1;97mArquivos removidos com sucesso em $diretorio\e[0m"
	
}

term
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