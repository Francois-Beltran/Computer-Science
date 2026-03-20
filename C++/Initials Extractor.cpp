#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main()
{
    string name;
    string cleaned;
    string initial;
    int inword = 1;

    cout << "Enter Name: ";
    getline(cin, name);

    if (empty(name))
    {
        cout << "Empty String!" << endl;
        return 1;
    }

    //cleaning for any special character
    for (int i=0; i<name.length(); i++)
    {
        if (isalpha(name[i]) || name[i] == ' ')
        {
            cleaned += name[i];
        }
    }

    //getting the first letter of every word
    for (int i=0; i<cleaned.length(); i++)
    {
        if (cleaned[i] != ' ')
        {
            if (inword == 1)
            {
                initial += toupper(cleaned[i]);
                inword = 0;
            }
        }
        else
        {
            inword = 1;
        }
    }

    cout << "Your Initial would be: " << initial << endl;

    return 0;
}
