#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main()
{
    string word;
    int vowCount = 0;
    int conCount = 0;

    cout << "Enter Word: ";
    getline(cin, word);

    for (int i=0; i<word.length(); i++)
    {
        word[i] = tolower(word[i]);
        if (isalpha(word[i]))
        {


            if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' || word[i] == 'u')
            {
                vowCount++;
            }
            else
            {
                conCount++;
            }
        }
    }

    cout << "Vowels: " << vowCount << endl;
    cout << "Consonants: " << conCount << endl;

    return 0;

}
