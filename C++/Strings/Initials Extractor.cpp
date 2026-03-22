#include <iostream>
#include <string>
#include <cctype>

using namespace std;

string cleaningSpecialChar(string name)
{
    string temp = "";
    for (int i=0; i<name.length(); i++)
    {
        if (isalpha(name[i]) || name[i] == ' ')
        {
            temp += name[i];
        }
    }

    return temp;
}

string initialExtract(string cleaned)
{
    int inword = 1;
    string result = "";
    for (int i=0; i<cleaned.length(); i++)
    {
        if (cleaned[i] != ' ')
        {
            if (inword == 1)
            {
                result += toupper(cleaned[i]);
                inword = 0;
            }
        }
        else
        {
            inword = 1;
        }
    }

    return result;
}

int main()
{
    string name;
    string cleaned;
    string initial;

    cout << "Enter Name: ";
    getline(cin, name);

    if (empty(name))
    {
        cout << "Empty String!" << endl;
        return 1;
    }

    cleaned = cleaningSpecialChar(name);
    initial = initialExtract(cleaned);

    cout << "Your Initial would be: " << initial << endl;

    return 0;
}
