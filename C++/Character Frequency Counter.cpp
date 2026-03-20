#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main()
{
    string word;
    int arr[26];

    cout << "Enter Word: ";
    getline(cin,word);

    //lowercase converter
    for (int i=0; i<word.length(); i++)
    {
        word[i] = tolower(word[i]);
    }

    for (int i=0; i<word.length(); i++)
    {
        char ch = word[i];

        int index = ch - 'a';
        arr[index]++
    }

}
