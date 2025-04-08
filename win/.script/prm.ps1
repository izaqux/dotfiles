<#
	@utor Izaqux
	PowerShell
#>

# Excluir Pasta ou Arquivo

# UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$w = "$([char]27)[1;97m" # Branco
$r = "$([char]27)[1;31m" # Vermelho
$reset = "$([char]27)[0m" # Cor padrão

# Se arg ?
if($args.Count -eq 0) {
	Write-Host "${r}Uso: prm.ps1 [Excluir Pasta ou Arquivo]$reset"
	Write-Host "${r}Exemplo$reset"
	Write-Host ""
	Write-Host "${w}prm.ps1 .arquivo$reset"
	Write-Host "${w}prm.ps1 -pasta arq 'arq2' '-pasta2'$reset"
	exit 1
}

# Processa cada arg
foreach ($target in $args) {
	# Se caminho existe
	if(-not (Test-Path $target)) {
		Write-Host "${w}Caminho especificado não existe:$reset ${r}$target$reset"
		continue
	}

	# Se dir
	if(Test-Path $target -PathType Container) {
		Write-Host ""
		Write-Host "${w}Processando:$reset ${r}$target$reset"
		try {
			Remove-Item -Path $target -Recurse -Force -ErrorAction Stop
			Write-Host "${r}[+] Excluido$reset"
		} catch {
			Write-Host "${r}[-] Erro ao excluir o diretório$reset"
			Write-Host $_.Exception.Message
			exit 1
		}
	} else {
		# É arq
		Write-Host ""
		Write-Host "${w}Processando:$reset ${r}$target$reset"
		try {
			Remove-Item -Path $target -Force -ErrorAction Stop
			Write-Host "${r}[+] Excluido$reset"
		} catch {
			Write-Host "${r}[-] Erro ao excluir o arquivo$reset"
			Write-Host $_.Exception.Message
			exit 1
		}
	}
}

exit 0