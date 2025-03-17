#
#
#	@utor Izaqux
#	.bashrc Configurações do shell para o Termux

#set -x # Modo de depuração

# MOTD, não será mais exibido ao abrir o termux
if [ -f "$PREFIX/etc/motd" ]; then
	rm -rf "$PREFIX/etc/motd"
fi

# Inicia, meus scripts
if [ -f "$HOME/.termux/boot/iniscript.sh" ] && [ -x "$HOME/.termux/boot/iniscript.sh" ]; then
	"$HOME/.termux/boot/iniscript.sh"
fi

# Se a pasta .script existe
if [ -d "$HOME/.script" ]; then
	if [ -n "$(ls -A "$HOME/.script")" ]; then # Add .script ao $PATH, se ainda não estiver
		# Add a pasta .script ao $PATH
		if [[ ":$PATH:" != *":$HOME/.script:"* ]]; then
			export PATH="$HOME/.script:$PATH"
		fi
	fi
fi

# Define o prompt (PS1) com cores e informações úteis
export PS1='\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;33m\]\w\[\e[0m\]\$ '

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

# Função para exibir o desenho
draw_termux() {
	echo -e "\e[31m\e[1mXXXXX  XXX  XXX   X   X  X  X  X    X\e[0m"
	echo -e "\e[31m\e[1m  X    X    X  X  XX XX  X  X   X  X\e[0m"
	echo -e "\e[31m\e[1m  X    XX   XXX   X X X  X  X    XX\e[0m"
	echo -e "\e[31m\e[1m  X    X    X  X  X   X  X  X   X  X\e[0m"
	echo -e "\e[31m\e[1m  X    XX   X  X  X   X  XXXX  X    X\e[0m"
}

echo ""

help() {
	# Espaçamento inicial
	echo ""
	echo ""
	draw_termux
	echo ""
	echo ""
	echo -e "\e[31m\e[1mInformações do Sistema\e[0m"
	echo ""
	echo -e "\e[94m\e[1mUsuário:\e[0m \e[31m\e[1m$(whoami)\e[0m"
	echo -e "\e[94m\e[1mArquitetura:\e[0m \e[92m$(uname -m)\e[0m"
	echo -e "\e[94m\e[1mKernel:\e[0m \e[92m$(uname -r)\e[0m"
	echo ""
	# Comandos Úteis
	echo -e "\e[31m\e[1mComandos Úteis\e[0m"
	echo ""
	echo -e "\e[94m\e[1mupdate\e[0m      - Atualiza todos os pacotes instalados"
	echo -e "\e[94m\e[1minstall\e[0m     - Instala um pacote (ex: install git)"
	echo -e "\e[94m\e[1mhelp\e[0m        - Exibe ajuda"
	echo -e "\e[94m\e[1mla\e[0m          - Lista todos os arquivos, incluindo ocultos"
	echo -e "\e[94m\e[1mll\e[0m          - Lista arquivos em formato longo (ls -la)"
	echo -e "\e[94m\e[1mc\e[0m           - Limpa a tela rapidamente (clear)"
	echo -e "\e[94m\e[1mq\e[0m           - Sai do shell rapidamente (exit)"
	echo -e "\e[94m\e[1m..\e[0m          - Volta um diretório acima (cd ..)"
	echo ""
	echo ""
}

clear
help
