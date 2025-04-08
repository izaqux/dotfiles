/*
 *	@utor Izaqux
 *	C++
 *	Atalho para novo cmd
 */

#include <stdlib.h>

int main() {
	/*
		%windir%\system32\cmd.exe /K %userprofile%/Desktop/.script/cmd.bat
		%COMSPEC% /K %userprofile%/Desktop/.script/cmd.bat
	*/
	system("%COMSPEC% /K \"%USERPROFILE%\\Desktop\\.script\\cmd.bat\"");
	return 0;
}