#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main()
{
    string word;
    string reversed;

    cout << "Enter Word: ";
    getline(cin, word);

    int count = word.length();

    for (int i=count-1; i>=0; i--)
    {
        reversed += tolower(word[i]); //store to a new container the reverse
        word[i] = tolower(word[i]); // lowercase the word
    }

    if (reversed == word)
    {
        cout << "Palindrome" << endl << word << " = " << reversed;
    }
    else
    {
        cout << "Not a Palindrome" << endl << word << " = " << reversed;
    }


    return 0;
}
