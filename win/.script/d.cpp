/*
 *	@utor Izaqux
 *	C++
 *	PT-BR | UTF-8
 *	WIN 64 bits
 *	
 *	Listar diretórios
 *	pastas: cor azul, arquivos: cor verde
 *	pasta e arq se tem . no nome ou for oculto então cor vermelha
 *
 *	g++ -o d.exe d.cpp -static -static-libgcc -static-libstdc++
 *
 */

#include <windows.h>
#include <iostream>
#include <string>
#include <io.h>
#include <fcntl.h>

using namespace std;

#ifndef ENABLE_VIRTUAL_TERMINAL_PROCESSING
#define ENABLE_VIRTUAL_TERMINAL_PROCESSING 0x0004
#endif

namespace color {
	const string B = "\033[1;34m";
	const string G = "\033[1;32m";
	const string R = "\033[1;31m";
	const string RESET = "\033[0m";
}

class dirLister {
	public:
		void listDir() {
			WIN32_FIND_DATAW fData;
			HANDLE f = FindFirstFileW(L"*", &fData);

			if(f == INVALID_HANDLE_VALUE) {
				cerr << "Erro ao listar diretório: " << GetLastError()  << endl;
				return;
			}

			do {
				wstring wname = fData.cFileName;
				
				if(wname == L"." || wname == L"..") continue;

				// UTF-8
				string name = wstringtoutf8(wname);

				putColor(name, fData.dwFileAttributes);

			} while(FindNextFileW(f, &fData));

			FindClose(f);
		}


	private:
		void putColor(const string& name, DWORD attrs) {
			string c = getColor(name, attrs);
			cout << c << name << color::RESET << endl;
		}

		string getColor(const string& name, DWORD attrs) {
			// Se é oculto
			if(attrs & FILE_ATTRIBUTE_HIDDEN) {
				return color::R;
			}

			// Se tem . no começo
			if(!name.empty() && name[0] == '.') {
				return color::R;
			}

			// Se é diretório
			if(attrs & FILE_ATTRIBUTE_DIRECTORY) {
				return color::B;
			}
			
			// Arq normais
			return color::G;
		}

		// Wstring para UTF-8
		string wstringtoutf8(const wstring& str) {
			int sizeN = WideCharToMultiByte(CP_UTF8, 0, str.c_str(), -1, nullptr, 0, nullptr, nullptr);
			string rst(sizeN, 0);
			WideCharToMultiByte(CP_UTF8, 0, str.c_str(), -1, &rst[0], sizeN, nullptr, nullptr);
			return rst;
		}
};

int main(int argc, char* argv[]) {
	// Console para UTF-8
	SetConsoleOutputCP(CP_UTF8);

	// Cores ANSI
	HANDLE out = GetStdHandle(STD_OUTPUT_HANDLE);
	if(out != INVALID_HANDLE_VALUE) {
		DWORD mode = 0;
		GetConsoleMode(out, &mode);
		mode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
		SetConsoleMode(out, mode);
	}

	dirLister show;
	show.listDir();
	
	return 0;
}
