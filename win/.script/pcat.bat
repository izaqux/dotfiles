::
::	@utor Izaqux
::	Batch
::

:: Listar arq.txt

:: Modo de depuração
@echo off

:: UTF-8
chcp 65001 > nul

setlocal EnableDelayedExpansion

set "w=[1;97m" :: Branco
set "r=[1;31m" :: Vermelho
set "reset=[0m" :: Cor padrão

:: Se o arq?
if "%~1"=="" (
	echo !r!Uso: pcat.bat [Arquivo.txt]!reset!
	goto :eof
)

:: Se o arq existe
if not exist "%~1" (
	echo !w!Arquivo: "%~1" não encontrado!reset!
	goto :eof
)

:: Exibe o arq
for /f "tokens=* delims=" %%L in ('type "%~1"') do (
	echo !w!%%L!reset!
)

endlocal
