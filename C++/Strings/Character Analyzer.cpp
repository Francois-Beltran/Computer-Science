#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main()
{
    string input;
    int lettercount = 0;
    int digitcount = 0;
    int spacecount = 0;
    int specialcount = 0;

    cout << "Enter String: ";
    getline(cin,input);

    for (int i=0; i<input.length(); i++)
    {
        if (isalpha(input[i]))
            lettercount++;
        else if (input[i] == ' ')
            spacecount++;
        else if (isdigit(input[i]))
            digitcount++;
        else
            specialcount++;
    }
     cout << "Total: " << input.length() << endl;
     cout << "Letters: " << lettercount << endl;
     cout << "Digits: " << digitcount << endl;
     cout << "Spaces: " << spacecount << endl;
     cout << "Special: " << specialcount << endl;

    return 0;
}
