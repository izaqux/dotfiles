::
::	@utor Izaqux
::	Batch
::

:: Excluir Pasta ou Arquivo

:: Modo de depuração
@echo off
setlocal EnableDelayedExpansion

:: UTF-8
chcp 65001 > nul

set "w=[1;97m" :: Branco
set "r=[1;31m" :: Vermelho
set "reset=[0m" :: Cor padrão

:: Arg foi passado?
if "%~1"=="" (
	echo !r!Uso: prm.bat [Excluir Pasta ou Arquivo]!reset!
	echo !r!Exemplo!reset!
	echo.
	echo !w!prm.bat .arquivo!reset!
	echo !w!prm.bat -pasta arq "arq2" "-pasta2"!reset!
	exit /b 1
)


:: Cada argumento
:loop
if "%~1"=="" goto :eof

set "target=%~1"

:: Se o caminho existe
if not exist "%target%" (
	echo !w!Caminho especificado não existe:!reset! !r!%~1!reset!
	shift
	goto loop
)

:: Se dir
if exist "%target%/*" (
	echo.
	echo !w!Processando:!reset! !r!!target!!reset!
	rmdir /s /q "%target%"
	if errorlevel 1 (
		echo !r![-] Erro ao excluir o diretório!reset!
		exit /b 1
	) else (
		echo !r![+] Excluido!reset!
	)
) else (
	:: Arq
	echo.
	echo !w!Processando:!reset! !r!!target!!reset!
	del /s /q "%target%"
	if errorlevel 1 (
		echo !r![-] Erro ao excluir o arquivo!reset!
		exit /b 1
	) else (
		echo !r![+] Excluido!reset!
	)
)

::move todos os parâmetros uma posição para a esquerda
shift
goto loop

endlocal
exit /b 0
