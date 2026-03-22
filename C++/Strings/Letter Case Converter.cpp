#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main()
{
    string word;
    string adjusted;

    cout << "Enter Word: ";
    getline(cin,word);

    for (int i=0; i<word.length(); i++)
    {
        if (isupper(word[i]))
        {
            adjusted += tolower(word[i]);
        }
        else if (islower(word[i]))
        {
            adjusted += toupper(word[i]);
        }
        else
        {
            adjusted += word[i];
        }
    }

    cout << adjusted << endl;
    return 0;
}
