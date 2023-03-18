#include <iostream>
#include <vector>

int main(int argc, char* argv[])
{
	std::vector<std::string> arguments;

	for (int i = 0; i < argc; i++) {
		arguments.push_back(argv[i]);
	}

	for (int i = 0; i < argc; i++) {
		std::cout << "Arguments-> Index:" << i << " Command:" << arguments.at(i) << "\n";
	}

#ifdef PLATFORM_WINDOWS
	std::cout << "====Platform Windows====\n";
#endif // PLATFORM_WINDOWS

	std::cout << "AppName------>" << APP_NAME     << "\n";
	std::cout << "ConfigPath--->" << CONFIG_PATH  << "\n";
	std::cout << "ContentPath-->" << CONTENT_PATH << "\n";

	system("pause");

	return 0;
}