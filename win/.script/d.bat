::
::	@utor Izaqux
::	Batch
::

:: Listar diretórios
:: pastas: cor azul, arquivos: cor verde
:: pasta e arq se tem . no nome ou for oculto então cor vermelha

:: Modo de depuração
@echo off

:: UTF-8
chcp 65001 > nul

setlocal EnableDelayedExpansion

set "b=[1;34m" :: Azul
set "g=[1;32m" :: Verde
set "r=[1;31m" :: Vermelho
set "reset=[0m" :: Cor padrão

:: Listar arq e diretórios, e incluindo ocultos
for /f "delims=" %%F in ('dir /A /B 2^>nul') do (
	set "c="

	:: Se é oculto
	attrib "%%F" | find "H" > nul && set "c=!r!"

	:: Se tem . no nome
	if not defined c (
		echo "%%F" | find "." > nul && (
			:: Se o . não é, só da extensão
			set "n=%%~nF"
			if not "!n!"=="%%f" if "!n!"=="" (
				set "c=!r!"
			)
		)
	)

	:: Cor padrão
	if not defined c (
		if exist "%%F\" (
			set "c=!b!" :: Pasta normal
		) else (
			set "c=!g!" :: Arq normal
		)
	)

	echo !c!%%F!reset!

)

endlocal
