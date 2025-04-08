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
		void listDir(const wstring& dir = L".") {
			if(!SetCurrentDirectoryW(dir.c_str())) {
				cerr << "Erro ao acessar diretório: " << GetLastError()  << endl;
				return;
			}

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

	if(argc > 1) {
		// Arg para wstring
		wstring dir;
		int dirSize = MultiByteToWideChar(CP_UTF8, 0, argv[1], -1, nullptr, 0);
		dir.resize(dirSize);
		MultiByteToWideChar(CP_UTF8, 0, argv[1], -1, &dir[0], dirSize);

		// Rmv o caractere nulo extra
		if(!dir.empty() && dir.back() == L'\0') {
			dir.pop_back();
		}
		show.listDir(dir);
	} else {
		show.listDir();
	}
	return 0;
}
