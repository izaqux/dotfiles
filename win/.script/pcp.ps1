<#
	@utor Izaqux
	PowerShell
#>

# Copia arq ou dir

# UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$w = "$([char]27)[1;97m" # Branco
$r = "$([char]27)[1;31m" # Vermelho
$reset = "$([char]27)[0m" # Cor padrão

# Se arg ?
if($args.Count -lt 2) {
	Write-Host "${r}Uso: pcp.ps1 [Arquivo ou Pasta] [Destino]$reset"
	exit 1
}

$source = $args[0]
$dest = $args[1]

if (-Not (Test-Path $source)) {
	Write-Host "${w}Erro: Especifique o diretório de destino$reset"
	exit 1
}

if ($source -eq $dest) {
	Write-Host "${w}Erro: não pode copiar$reset"
	exit 1
}

function copyFolder {
	param (
		[string]$source,
		[string]$dest
	)

	if (-Not (Test-Path $dest)) {
		New-Item -ItemType Directory -Path $dest | Out-Null
	}

	try {
		Copy-Item -Path "$source\*" -Destination $dest -Recurse -Force -ErrorAction Stop
		Write-Host "${r}[+] Copiado$reset"
	} catch {
		Write-Host "${r}[-] Falha na cópia$reset"
		if (Test-Path $dest) {
			Remove-Item -Path $dest -Recurse -Force
		}
		exit 1
	}
}

function copyFile {
	param (
		[string]$source,
		[string]$dest
	)

	try {
		Copy-Item -Path $source -Destination $dest -Force -ErrorAction Stop
		Write-Host "${r}[+] Copiado$reset"
	} catch {
		Write-Host "${r}Arquivo não encontrado$reset"
		exit 1
	}
}

if (Test-Path $source -PathType Container) {
	$destFolder = Join-Path $dest (Split-Path $source -Leaf)
	copyFolder -source $source -dest $destFolder
} elseif (Test-Path $source -PathType Leaf) {
	copyFile -source $source -dest $dest
}