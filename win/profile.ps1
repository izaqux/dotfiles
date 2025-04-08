<#
	@utor Izaqux
	PowerShell
#>

# Modo de depuração
Set-PSDebug -Off

# Título
$host.UI.RawUI.WindowTitle = "$env:USERNAME@PowerShell"

# UTF-8
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

# Aliases
function clearHost {Clear-Host} Set-Alias c clearHost
function goExit {Exit} Set-Alias q goExit
function goDesktop {Set-Location $env:USERPROFILE/Desktop} Set-Alias desktop goDesktop
function goScriptFolder {Set-Location "$env:USERPROFILE/Desktop/.script"} Set-Alias .script goScriptFolder
function goUp {Set-Location ..} Set-Alias .. goUp
function runPhelp {& "$env:USERPROFILE/Desktop/.script/phelp.ps1"} Set-Alias phelp runPhelp # phelp
function runPrm {& "$env:USERPROFILE/Desktop/.script/prm.ps1" @args} Set-Alias prm runPrm # prm
function runD {& "$env:USERPROFILE/Desktop/.script/d.exe" @args} Set-Alias d runD
function runWd {& "$env:USERPROFILE/Desktop/.script/wd.ps1" @args} Set-Alias wd runWd
function runColor {& "$env:USERPROFILE/Desktop/.script/pcolor.ps1" @args} Set-Alias pcolor runColor # pcolor
function runPcat {& "$env:USERPROFILE/Desktop/.script/pcat.ps1" @args} Set-Alias pcat runPcat
function runPcp {& "$env:USERPROFILE/Desktop/.script/pcp.ps1" @args} Set-Alias pcp runPcp
function gitClone {git clone @args} Set-Alias g gitClone
function gitInit {git init @args} Set-Alias giti gitInit # giti
function gitStatus {git status @args} Set-Alias gits gitStatus # gits
function gitAdd {git add $args} Set-Alias gita -Value gitAdd # gita
function gitCommit {git commit -m $args} Set-Alias gitc -Value gitCommit # gitc
function gitPush {git push $args} Set-Alias gitp -Value gitPush # gitp
function gitLog {git log --oneline --graph --decorate --all $args} Set-Alias gitl -Value gitLog # gitl
function gitBranch {git branch $args} Set-Alias gitb -Value gitBranch # gitb
function gitDiff {git diff $args} Set-Alias gitd -Value gitDiff # gitd

desktop
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


function Prompt {
	# Obter informações do sistema
	$user = $env:USERNAME
	$hostName = $env:COMPUTERNAME
	$currentDir = (Get-Location).Path

	# Definir cores ANSI
	$white = "$([char]27)[1;97m" # Branco
	$green = "$([char]27)[1;32m" # Verde
	$blue = "$([char]27)[1;34m" # Azul
	$red = "$([char]27)[1;31m" # Vermelho
	$reset = "$([char]27)[0m" # Resetar

	# Construir o prompt
	$prompt = "`n$white╔══$white($green$user$white@$blue$hostName$white)$white-$white[$red$currentDir$white]`n$white╚══> $reset$white"
	return $prompt
}