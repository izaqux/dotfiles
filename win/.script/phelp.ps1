#
#   @utor Izaqux
#   PowerShell

# Modo de depuração
Set-PSDebug -Off

# Título
$host.UI.RawUI.WindowTitle = "$env:USERNAME@PowerShell"

# UTF-8
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

#Clear-Host
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
Write-Host "$([char]27)[1;31m    Comandos Úteis$([char]27)[0m"
Write-Host ""
Write-Host "$([char]27)[1;94m    phelp$([char]27)[0m           $([char]27)[1;97m- Exibe ajuda$([char]27)[0m"
Write-Host "$([char]27)[1;94m    prm$([char]27)[0m             $([char]27)[1;97m- Deleta pasta e arquivo$([char]27)[0m"
Write-Host "$([char]27)[1;94m    d$([char]27)[0m               $([char]27)[1;97m- Lista todos os arquivos, incluindo ocultos e com cores$([char]27)[0m"
Write-Host "$([char]27)[1;94m    c$([char]27)[0m               $([char]27)[1;97m- Limpa a tela rapidamente$([char]27)[0m"
Write-Host "$([char]27)[1;94m    q$([char]27)[0m               $([char]27)[1;97m- Sai do shell rapidamente$([char]27)[0m"
Write-Host "$([char]27)[1;94m    ..$([char]27)[0m              $([char]27)[1;97m- Volta um diretório acima (cd ..)$([char]27)[0m"
Write-Host "$([char]27)[1;94m    wd$([char]27)[0m              $([char]27)[1;97m- Local onde ta o diretório$([char]27)[0m"
Write-Host "$([char]27)[1;94m    pcat$([char]27)[0m            $([char]27)[1;97m- Exibe arquivo$([char]27)[0m"
Write-Host "$([char]27)[1;94m    pcp$([char]27)[0m             $([char]27)[1;97m- Copia arquivo ou pasta$([char]27)[0m"
Write-Host "$([char]27)[1;94m    pcolor$([char]27)[0m          $([char]27)[1;97m- Cores$([char]27)[0m"
Write-Host "$([char]27)[1;94m    desktop$([char]27)[0m         $([char]27)[1;97m- Desktop/$([char]27)[0m"
Write-Host "$([char]27)[1;94m    .script$([char]27)[0m         $([char]27)[1;97m- Desktop/.script/$([char]27)[0m"
Write-Host "$([char]27)[1;94m    g$([char]27)[0m               $([char]27)[1;97m- git clone$([char]27)[0m"
Write-Host "$([char]27)[1;94m    giti$([char]27)[0m            $([char]27)[1;97m- git init$([char]27)[0m"
Write-Host "$([char]27)[1;94m    gits$([char]27)[0m            $([char]27)[1;97m- git status$([char]27)[0m"
Write-Host "$([char]27)[1;94m    gita$([char]27)[0m            $([char]27)[1;97m- git add$([char]27)[0m"
Write-Host "$([char]27)[1;94m    gitc$([char]27)[0m            $([char]27)[1;97m- git commit -m$([char]27)[0m"
Write-Host "$([char]27)[1;94m    gitp$([char]27)[0m            $([char]27)[1;97m- git push$([char]27)[0m"
Write-Host "$([char]27)[1;94m    gitl$([char]27)[0m            $([char]27)[1;97m- git log --oneline --graph --decorate --all$([char]27)[0m"
Write-Host "$([char]27)[1;94m    gitb$([char]27)[0m            $([char]27)[1;97m- git branch$([char]27)[0m"
Write-Host "$([char]27)[1;94m    gitd$([char]27)[0m            $([char]27)[1;97m- git diff$([char]27)[0m"
Write-Host ""
Write-Host ""
