::
::	@utor Izaqux
::	Batch
::

:: Local onde ta o diretório

:: Modo de depuração
@echo off
setlocal EnableDelayedExpansion

:: UTF-8
chcp 65001 > nul

set "r=[1;31m" :: Vermelho
set "reset=[0m" :: Cor padrão

echo !r!%cd%!reset!

endlocal
