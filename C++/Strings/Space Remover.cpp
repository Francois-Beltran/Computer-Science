#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main()
{
    string word;
    string noSpace;

    cout << "Enter Word: ";
    getline(cin,word);

    for (int i=0; i<word.length(); i++)
    {
        if (word[i] != ' ')
        {
            noSpace += word[i];
        }
    }

    cout << noSpace << endl;

    return 0;
}
