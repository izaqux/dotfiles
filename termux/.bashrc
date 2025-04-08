#
#
#	@utor Izaqux
#	.bashrc Configurações do shell para o Termux

#set -x # Modo de depuração

# listar diretórios, com comando d
if [ -f "$HOME/.script/d" ]; then
	alias d="$HOME/.script/./d"
fi

# MOTD, não será mais exibido ao abrir o termux
if [ -f "$PREFIX/etc/motd" ]  && [ -x "$PREFIX/etc/motd" ]; then
	rm -rf "$PREFIX/etc/motd"
fi

# Inicia, meus scripts
if [ -f "$HOME/.termux/boot/iniscript.sh" ] && [ -x "$HOME/.termux/boot/iniscript.sh" ]; then
	"$HOME/.termux/boot/iniscript.sh"
fi

# Se a pasta .script existe
if [ -d "$HOME/.script" ]; then
	if [ -n "$(ls -A "$HOME/.script")" ]; then
		# Add a pasta .script ao $PATH
		if [[ ":$PATH:" != *":$HOME/.script:"* ]]; then
			export PATH="$HOME/.script:$PATH"
		fi
	fi
fi

# Define o prompt (PS1) com cores e informações úteis
export PS1='\n\[\e[1;97m\]╔══\[\e[0m\]\[\e[1;97m\](\[\e[0m\]\[\e[1;32m\]\u\[\e[0m\]\[\e[1;97m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;97m\])\n\[\e[1;97m\]║\[\e[0m\]\[\e[1;97m\]-\[\e[0m\]\[\e[1;97m\][\[\e[0m\]\[\e[1;31m\]\w\[\e[0m\]\[\e[1;97m\]]\n\[\e[1;97m\]╚══>\[\e[0m\]\[\e[1;97m\] '

# Carregar o .bash_aliases
if [ -f "$HOME/.bash_aliases" ]; then
	source "$HOME/.bash_aliases"
fi

# Atualizar pacotes do Termux
alias update='pkg update && pkg upgrade -y'

# Instalar pacotes rapidamente
install() {
	if [ -z "$1" ]; then
		echo "Uso: install <nome-do-pacote> <nome-do-pacote>"
	else
		pkg install "$@" -y
	fi
}

# Exibir o desenho
termux() {
	echo ""
	echo ""
	echo ""
	echo -e "\e[1;31m     _____ _____ ____  __  __ _   ___  __    \e[0m"
	echo -e "\e[1;31m    |_   _| ____|  _ \|  \/  | | | \ \/ /    \e[0m"
	echo -e "\e[1;31m      | | |  _| | |_) | |\/| | | | |\  /     \e[0m"
	echo -e "\e[1;31m      | | | |___|  _ <| |  | | |_| |/  \     \e[0m"
	echo -e "\e[1;31m      |_| |_____|_| \_\_|  |_|\___//_/\_\    \e[0m"
	echo ""
	echo ""
	echo ""
}

phelp() {
	# Comandos Úteis
	echo -e "\e[1;31m  Comandos Úteis\e[0m"
	echo ""
	echo -e "\e[1;94m  update\e[0m     \e[1;97m- Atualiza todos os pacotes instalados\e[0m"
	echo -e "\e[1;94m  install\e[0m    \e[1;97m- Instala um pacote (ex: install git)\e[0m"
	echo -e "\e[1;94m  phelp\e[0m      \e[1;97m- Exibe ajuda\e[0m"
	echo -e "\e[1;94m  d\e[0m          \e[1;97m- Lista todos os arquivos, incluindo ocultos e com cores\e[0m"
	echo -e "\e[1;94m  c\e[0m          \e[1;97m- Limpa a tela rapidamente\e[0m"
	echo -e "\e[1;94m  q\e[0m          \e[1;97m- Sai do shell rapidamente\e[0m"
	echo -e "\e[1;94m  ..\e[0m         \e[1;97m- Volta um diretório acima (cd ..)\e[0m"
	echo -e "\e[1;94m  home\e[0m       \e[1;97m- $HOME\e[0m"
	echo -e "\e[1;94m  .script\e[0m    \e[1;97m- $HOME/.script/\e[0m"
	echo -e "\e[1;94m  g\e[0m          \e[1;97m- git clone\e[0m"
	echo -e "\e[1;94m  giti\e[0m       \e[1;97m- git init\e[0m"
	echo -e "\e[1;94m  gits\e[0m       \e[1;97m- git status\e[0m"
	echo -e "\e[1;94m  gita\e[0m       \e[1;97m- git add\e[0m"
	echo -e "\e[1;94m  gitc\e[0m       \e[1;97m- git commit -m\e[0m"
	echo -e "\e[1;94m  gitp\e[0m       \e[1;97m- git push\e[0m"
	echo -e "\e[1;94m  gitl\e[0m       \e[1;97m- git log --oneline --graph --decorate --all\e[0m"
	echo -e "\e[1;94m  gitb\e[0m       \e[1;97m- git branch\e[0m"
	echo -e "\e[1;94m  gitd\e[0m       \e[1;97m- git diff\e[0m"
	echo ""
	echo ""
}

clear
termux
