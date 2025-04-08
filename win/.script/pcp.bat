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
	echo !r!Uso: pcp.bat [Arquivo ou Pasta] [Destino]!reset!
	goto :eof
)

:: Se destino existe
if "%~2"=="" (
	echo !w!Erro: Especifique o diretório de destino!reset!
	goto :eof
)
if "%~1"=="%~2" (
	echo !w!Erro: não pode copiar!reset!
	goto :eof
)

set "source=%~1"
set "dest=%~2"

if exist "%source%\" (
	if not exist "!dest!\%~nx1" ( mkdir "%dest%\%~nx1" )
	xcopy "%source%\*" "!dest!\%~nx1" /E /H /K /O /X /Y /C /Q /I
	if %ERRORLEVEL% equ 0 (
		echo !r![+] Copiado!reset!
	) else (
		if not exist "!dest!\%~nx1" ( rmdir /s /q "%dest%\%~nx1" )
		echo !r![-] Falha na cópia!reset!
	)
) else (
	if exist "%source%" (
		xcopy %source% %dest% /H /K /O /X /Y /Q
		echo !r![+] Copiado!reset!
	) else (
		echo !w!Arquivo não encontrado!reset!
	)
)

endlocal
