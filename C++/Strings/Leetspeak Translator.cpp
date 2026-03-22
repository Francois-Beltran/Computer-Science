#include <iostream>
#include <string>

using namespace std;

string clean(string &input)
{
    for (int i=0; i<input.length(); i++)
    {
        input[i] = tolower(input[i]);
    }
    return input;

}
string toLeet(string &input)
{
    for (int i=0; i<input.length(); i++)
    {
        if (input[i] == 'a')
            input[i] = '4';
        else if (input[i] == 'e')
            input[i] = '3';
        else if (input[i] == 'i')
            input[i] = '1';
        else if (input[i] == 'o')
            input[i] = '0';
        else if (input[i] == 's')
            input[i] = '5';
    }

    return input;

}
int main()
{
    string input;

    cout << "Enter String: ";
    getline(cin, input);

    clean(input);
    toLeet(input);

    cout << "ToLeet: " << input << endl;

    return 0;

}
