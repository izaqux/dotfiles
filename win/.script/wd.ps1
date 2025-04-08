<#
	@utor Izaqux
	PowerShell
#>

# Local onde ta o diretório

# UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$r = "$([char]27)[1;31m" # Vermelho
$reset = "$([char]27)[0m" # Cor padrão

Write-Host "${r}$(Get-Location)${reset}"
