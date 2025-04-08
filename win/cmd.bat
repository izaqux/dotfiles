::
::	@utor Izaqux
::	Batch
::

:: Instalação

:: Modo de depuração
@echo off
setlocal EnableDelayedExpansion

:: Título
title %username%@CMD

:: UTF-8
chcp 65001 > nul

:: Se arg ?
if "%~1"=="" (
	cls
	echo.
	echo.
	echo.
	echo. [1;31m      ____ __  __ ____[0m
	echo. [1;31m     / ___^|  \/  ^|  _ \[0m
	echo. [1;31m    ^| ^|   ^| ^|\/^| ^| ^| ^| ^|[0m
	echo. [1;31m    ^| ^|___^| ^|  ^| ^| ^|_^| ^|[0m
	echo. [1;31m     \____^|_^|  ^|_^|____/[0m
	echo.
	echo.
	echo.
	echo [1;31mUso: cmd.bat [-i ^| -u][0m
	echo [1;97m -i : Instalar os arquivos[0m
	echo [1;97m -u : Desinstalar os arquivos[0m
	goto :eof
)

set "source=%~dp0.script"
set "dest=%USERPROFILE%\Desktop\.script"
set "listaArqs=cmd.bat d.bat pcolor.bat phelp.bat prm.bat wd.bat d.cpp pcat.bat pcp.bat"
set "mingw=C:\mingw64"

:: Instalar
if /i "%~1"=="-i" (
	cls
	echo [1;31mInstalando arquivos[0m

	if not exist "%dest%" (
		mkdir "%dest%"
		echo [1;31mPasta: .script ^| Criada: %dest%[0m
		:: Pasta .script, oculta
		attrib +H %dest%
	) else (
		echo [1;31mPasta: .script ^| Já existe: %dest%[0m
		attrib +H %dest%
	)

	for %%F in (%listaArqs%) do (
		xcopy "%source%\%%F" "%dest%" /V /K /Y /D /Q /I
		if !errorlevel! equ 0 (
			echo [1;97m[+] %%F copiado[0m
		) else (
			echo [1;97mFalha ao copiar: %%F[0m
		)
	)

	
	if exist "%USERPROFILE%\MinGw.log" (
		echo [1;97mMinGw já instalado[0m
	) else (
		if not exist "%USERPROFILE%\MinGw.log" (
			if not exist "C:\mingw64" (
				mkdir "C:\mingw64"
			)
			if exist "C:\mingw64" (
				tar -xvf "%~dp0mingw64.tar.gz" --strip-components=1 -C "C:\mingw64" > nul 2>&1
				if %errorlevel% neq 0 (
					echo [1;97m[ERRO] Falha ao extrair[0m
				) else (
					rmdir /s /q %TEMP%\MinGw

					if exist "%dest%\d.cpp" (
						"C:\mingw64\bin\g++" -o "%dest%\d.exe" "%dest%\d.cpp" -static -static-libgcc -static-libstdc++
						if %errorlevel% neq 0 (
							echo [1;97mErro ao compilar d.cpp[0m
						)
						if exist "C:\mingw64\bin\g++.exe" (
							echo -i > "%USERPROFILE%\MinGw.log"
						)
					)
				)
			)
		)
	)

	echo [1;31m[+] Concluido![0m
)

if /i "%~1"=="-u" (
	cls
	echo [1;31mDesinstalando arquivos[0m

	for %%F in (%listaArqs%) do (
		if exist "%dest%\%%F" (
			del /Q "%dest%\%%F"
			echo [1;97m[+] %%F removido[0m
		) else (
			echo [1;97m[-] %%F não encontrado[0m
		)
	)

	if exist "%dest%\d.exe" (
		echo [1;97m[+] d.exe removido[0m
		del /Q "%dest%\d.exe"
	) else (
		echo [1;97m[-] d.exe não encontrado[0m
	)

	if exist "C:\mingw64" (
		rmdir /s /q "C:\mingw64"
	)

	if exist "%USERPROFILE%\MinGw.log" (
		del /Q "%USERPROFILE%\MinGw.log"
	)

	echo [1;31m[+] Concluido![0m
)

goto :eof