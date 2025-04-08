<#
	@utor Izaqux
	PowerShell
#>

# Lista Arquivo

# UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$w = "$([char]27)[1;97m" # Branco
$r = "$([char]27)[1;31m" # Vermelho
$reset = "$([char]27)[0m" # Cor padrão

# Se arg ?
if($args.Count -eq 0) {
	Write-Host "${r}Uso: pcat.ps1 [Arquivo.txt]$reset"
	exit 1
}

# Se arq existe
if(-not (Test-Path -Path $args[0])) {
	Write-Host "${w}Arquivo: $args[0] não encontrado$reset"
	exit 1
}

# Exibir arq
Get-Content $args[0] | ForEach-Object {
	Write-Host "$w$_$reset"
}