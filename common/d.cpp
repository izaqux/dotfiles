/*
 *	@utor Izaqux
 *	C++
 *	PT-BR | UTF-8
 *	Linux
 *
 *	Listar diretórios
 *	pastas: cor azul, arquivos: cor verde
 *	pasta e arq se tem . no nome ou for oculto então cor vermelha
 *
 *	g++ -static -o d d.cpp -lstdc++ -lm -lc -lrt
 *	ldd dir confirma exe é estático saída esperada "not a dynamic executable"
 *	Termux: g++ d.cpp -o d
 *
 */

#include <iostream>
#include <string>
#include <vector>
#include <sys/stat.h>
#include <sys/types.h>
#include <dirent.h>
#include "unistd.h"
#include <cstring>

using namespace std;

namespace color {
	const string B = "\033[1;34m";
	const string G = "\033[1;32m";
	const string R = "\033[1;31m";
	const string RESET = "\033[0m";
}

class dirLister {
	public:
		void listDir() {
			DIR *dir;
			struct dirent *entry;

			if((dir = opendir(".")) == nullptr) {
				cerr << "Erro ao listar diretório" << endl;
				return;
			}

			while((entry = readdir(dir)) != nullptr) {
				string name = entry -> d_name;	
				if(name == "." || name == "..") continue;

				struct stat fileStat;
				if(stat(name.c_str(), &fileStat) == -1) {
					cerr << "Erro ao ler atributos de: " << name << endl;
					continue;
				}

				putColor(name, fileStat);
			}

			closedir(dir);
		}


	private:
		void putColor(const string& name, const struct stat& fileStat) {
			string c = getColor(name, fileStat);
			cout << c << name << color::RESET << endl;
		}

		string getColor(const string& name, const struct stat& fileStat) {
			// Se é oculto ou Se tem . no começo
			if(!name.empty() && name[0] == '.') {
				return color::R;
			}

			// Se é diretório
			if(S_ISDIR(fileStat.st_mode)) {
				return color::B;
			}
			
			// Arq normal
			return color::G;
		}
};

int main() {
	dirLister show;
	show.listDir();
	return 0;
}

