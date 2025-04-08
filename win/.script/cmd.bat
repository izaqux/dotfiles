::
::	@utor Izaqux
::	Batch
::

:: Modo de depuração
@echo off
setlocal EnableDelayedExpansion

:: Título
title %username%@CMD

:: UTF-8
chcp 65001 > nul

::Doskey
doskey desktop=cd %userprofile%/Desktop
doskey .script=cd %userprofile%/Desktop/.script

:: dir.cpp: roda 64 bits, se estiver com erro, compile o arquivo, instruções em dir.cpp
:: Ou mude para dir.bat, é lento em diretórios muitos grandes
doskey d=%userprofile%/Desktop/.script/d.exe
doskey wd=%userprofile%/Desktop/.script/wd.bat
doskey pcolor=%userprofile%/Desktop/.script/pcolor.bat
doskey phelp=%userprofile%/Desktop/.script/phelp.bat
doskey prm=%userprofile%/Desktop/.script/prm.bat $*
doskey pcat=%userprofile%/Desktop/.script/pcat.bat $*
doskey pcp=%userprofile%/Desktop/.script/pcp.bat $*
doskey c=cls
doskey q=exit
doskey ..=cd ..
doskey g=git clone $*
doskey giti=git init $*
doskey gits=git status $*
doskey gita=git add $*
doskey gitc=git commit -m $*
doskey gitp=git push $*
doskey gitl=git log --oneline --graph --decorate --all $*
doskey gitb=git branch $*
doskey gitd=git diff $*

cd %userprofile%/Desktop
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

for /f %%A in ('"prompt $H & for %%B in (1) do rem"') do set BACKSPACE=%%A

:input
:: Sempre ao entrar no input variavel vazia
set cmd=
echo.
echo. [1;97m╔══([0m[1;32m%username%[0m[1;97m@[0m[1;34m%computername%[0m[1;97m)-[[0m[1;31m%cd%[0m[1;97m][0m

set /p cmd="%BACKSPACE% [1;97m╚══> [0m[1;97m"

if "!cmd!"=="" goto input

call !cmd!
goto input
endlocal
