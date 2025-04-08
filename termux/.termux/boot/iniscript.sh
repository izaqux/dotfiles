#!/data/data/com.termux/files/usr/bin/sh
#
#	@utor Izaqux
#	Shell Script
#
#	Esse script inicia outros
#

termux-wake-lock # Permitindo que scripts ou processos continuem rodando em segundo plano

# Inicia os scripts, localizado no diretório .script/
nohup python "$HOME/.script/boasvindasbot.py" > /dev/null 2>&1 &
