<#
	@utor Izaqux
	PowerShell
#>

# UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host "$([char]27)[1;97m    Normal$([char]27)[0m"
Write-Host "$([char]27)[90mGrey$([char]27)[0m"
Write-Host "$([char]27)[91mRed$([char]27)[0m"
Write-Host "$([char]27)[92mGreen$([char]27)[0m"
Write-Host "$([char]27)[93mYellow$([char]27)[0m"
Write-Host "$([char]27)[94mBlue$([char]27)[0m"
Write-Host "$([char]27)[95mMagenta Claro$([char]27)[0m"
Write-Host "$([char]27)[96mCyan$([char]27)[0m"
Write-Host "$([char]27)[97mWhite$([char]27)[0m"
Write-Host "$([char]27)[4mUnderlined$([char]27)[0m"
Write-Host "$([char]27)[7mHighlighted$([char]27)[0m"
Write-Host "$([char]27)[30mBlack$([char]27)[0m"
Write-Host "$([char]27)[31mDark Red$([char]27)[0m"
Write-Host "$([char]27)[32mDark Green$([char]27)[0m"
Write-Host "$([char]27)[33mDark Yellow$([char]27)[0m"
Write-Host "$([char]27)[34mDark Blue$([char]27)[0m"
Write-Host "$([char]27)[35mDark Purple$([char]27)[0m"
Write-Host "$([char]27)[36mDark Cyan$([char]27)[0m"
Write-Host ""
Write-Host "$([char]27)[1;97m    Highlight$([char]27)[0m"
Write-Host "$([char]27)[41mRed Highlight$([char]27)[0m"
Write-Host "$([char]27)[42mGreen Highlight$([char]27)[0m"
Write-Host "$([char]27)[43mYellow Highlight$([char]27)[0m"
Write-Host "$([char]27)[44mBlue Highlight$([char]27)[0m"
Write-Host "$([char]27)[45mPurple Highlight$([char]27)[0m"
Write-Host "$([char]27)[46mCyan Highlight$([char]27)[0m"
Write-Host "$([char]27)[47mCensor$([char]27)[0m"
Write-Host ""

#Write-Host "$([char]27)[1;97m     Bold$([char]27)[0m"
#Write-Host "$([char]27)[1;90mGrey$([char]27)[0m"
#Write-Host "$([char]27)[90m$([char]27)[1mGrey$([char]27)[0m"