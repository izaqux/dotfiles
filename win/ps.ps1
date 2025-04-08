<#
	@utor Izaqux
	PowerShell
#>

# Modo de depuração
Set-PSDebug -Off

# Título
$host.UI.RawUI.WindowTitle = "$env:USERNAME@PowerShell"

# UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$source = Join-Path $PSScriptROOT ".script"
$dest = Join-Path $env:USERPROFILE "Desktop\.script"
$listaArqs = @("d.cpp", "pcolor.ps1", "phelp.ps1", "prm.ps1", "wd.ps1", "pcat.ps1", "pcp.ps1")
$mingw = "C:\mingw64"
$profile = Join-Path -Path $PSScriptROOT -ChildPath "profile.ps1"
$profiledest = "C:\Windows\System32\WindowsPowerShell\v1.0\"
$profiledestc = Join-Path -Path $profiledest -ChildPath "profile.ps1"

function PowerShell {
	Clear-Host
	Write-Host ""
	Write-Host ""
	Write-Host ""
	Write-Host "$([char]27)[1;31m     ____   _____        _______ ____  ____  _   _ _____ _     _     $([char]27)[0m"
	Write-Host "$([char]27)[1;31m    |  _ \ / _ \ \      / / ____|  _ \/ ___|| | | | ____| |   | |    $([char]27)[0m"
	Write-Host "$([char]27)[1;31m    | |_) | | | \ \ /\ / /|  _| | |_) \___ \| |_| |  _| | |   | |    $([char]27)[0m"
	Write-Host "$([char]27)[1;31m    |  __/| |_| |\ V  V / | |___|  _ < ___) |  _  | |___| |___| |___ $([char]27)[0m"
	Write-Host "$([char]27)[1;31m    |_|    \___/  \_/\_/  |_____|_| \_\____/|_| |_|_____|_____|_____|$([char]27)[0m"
	Write-Host ""
	Write-Host ""
	Write-Host ""
}

if($args.Count -eq 0) {
	PowerShell
	Write-Host "$([char]27)[1;31mUso: ps.ps1 [-i | -u]$([char]27)[0m"
	Write-Host ""
	Write-Host "$([char]27)[1;97m-i : Instalar os arquivos$([char]27)[0m"
	Write-Host "$([char]27)[1;97m-u : Desinstalar os arquivos$([char]27)[0m"
	exit
}

if ($args[0] -eq "-i") {
	PowerShell
	Write-Host "$([char]27)[1;31mInstalando arquivos$([char]27)[0m"
	
	# Copiar profile.ps1
	if (Test-Path $profile) {
		try {
			# Copiar arquivo
			Copy-Item -Path $profile -Destination $profiledestc -Force -Verbose

			# Verificar se a cópia foi bem-sucedida
			if (Test-Path $profiledestc) {
				Write-Host "$([char]27)[1;97mArquivo copiado com sucesso para $profiledestc$([char]27)[0m"
			} else {
				Write-Host "$([char]27)[1;97mFalha ao copiar o arquivo$([char]27)[0m"
			}
		} catch {
			Write-Host "$([char]27)[1;97mErro ao copiar o arquivo: $_$([char]27)[0m"
		}
	} else {
		Write-Host "$([char]27)[1;97mArquivo $profile não encontrado no diretório atual$([char]27)[0m"
	}

	# Se .script existe
	if(-not (Test-Path $dest)) {
		New-Item -ItemType Directory -Path $dest -Force | Out-Null
		Write-Host "$([char]27)[1;31mPasta: .script | Criada: $dest$([char]27)[0m"
		#(Get-Item $dest).Attributes += 'Hidden'
	} else {
		Write-Host "$([char]27)[1;31mPasta: .script | Já existe: $dest$([char]27)[0m"
		#(Get-Item $dest).Attributes += 'Hidden'
	}


	# Copiar arqs
	foreach($file in $listaArqs) {
		$sourceFile = Join-Path $source $file
		if(Test-Path $sourceFile) {
			Copy-Item $sourceFile $dest -Force
			Write-Host "$([char]27)[1;97m[+] $file copiado$([char]27)[0m"
		} else {
			Write-Host "$([char]27)[1;97mFalha ao copiar: $file$([char]27)[0m"
		}
	}


	# MinGW
	if(Test-Path "$env:USERPROFILE\MinGw.log") {
		Write-Host "$([char]27)[1;97mMinGw já instalado$([char]27)[0m"
	} else {
		if(-not (Test-Path $mingw)) {
			New-Item -ItemType Directory -Path $mingw -Force | Out-Null
		}

		if(Test-Path $mingw) {
			try {
				tar -xf (Join-Path $PSScriptROOT "mingw64.tar.gz") --strip-components=1 -C $mingw | Out-Null
				# Add PATH
				# Compilar d.cpp
				if(Test-Path (Join-Path $dest "d.cpp")) {
					& "$mingw\bin\g++.exe" -o (Join-Path $dest "d.exe") (Join-Path $dest "d.cpp") -static -static-libgcc -static-libstdc++
					if($LASTEXITCODE -eq 0) {
						Set-Content "$env:USERPROFILE\MinGw.log" "-i"
					} else {
						Write-Host "$([char]27)[1;97mErro ao compilar d.cpp$([char]27)[0m"
					}
				}
			} catch {
				Write-Host "$([char]27)[1;97m[ERRO] Falha ao extrair$([char]27)[0m"
			}
		}
	}

	Write-Host "$([char]27)[1;97m[+] Concluido!$([char]27)[0m"
}


if ($args[0] -eq "-u") {
	PowerShell
	Write-Host "$([char]27)[1;31mDesinstalando arquivos$([char]27)[0m"
	Write-Host ""

	# Rmv arqs
	foreach($file in $listaArqs) {
		$destFile = Join-Path $dest $file
		if(Test-Path $destFile) {
			Remove-Item $destFile -Force
			Write-Host "$([char]27)[1;97m[+] $file removido$([char]27)[0m"
		} else {
			Write-Host "$([char]27)[1;97m[-] $file não encontrado$([char]27)[0m"
		}
	}

	# Rmv d.exe
	$destExe = Join-Path $dest "d.exe"
	if(Test-Path $destExe) {
		Remove-Item $destExe -Force
		Write-Host "$([char]27)[1;97m[+] d.exe removido$([char]27)[0m"
	} else {
		Write-Host "$([char]27)[1;97m[-] d.exe não encontrado$([char]27)[0m"
	}

	# Rmv MinGW
	if(Test-Path $mingw) {
		Remove-Item $mingw -Recurse -Force
	}

	# Rmv log
	if(Test-Path "$env:USERPROFILE\MinGw.log") {
		Remove-Item "$env:USERPROFILE\MinGw.log" -Force
	}
	
	# Rmv profile
	if(Test-Path $profiledestc) {
		try {
			Remove-Item -Path $profiledestc -Force -Verbose
			Write-Host "$([char]27)[1;97mArquivo existente removido: $profiledestc$([char]27)[0m"
		} catch {
			Write-Host "$([char]27)[1;97mErro ao remover arquivo existente: $_$([char]27)[0m"
		}
	}

	Write-Host "$([char]27)[1;97m[+] Concluido!$([char]27)[0m"
}