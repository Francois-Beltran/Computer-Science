#include <iostream>
#include <string>

using namespace std;

int main()
{
    string word;
    int wordCount = 0;
    bool inWord = true;

    cout << "Enter Word: ";
    getline(cin,word);

    for (int i=0; i<word.length(); i++)
    {
        if (word[i] != ' ')
        {
            if (inWord == true)
            {
                wordCount++;
                inWord = false;
            }
        }
        else
        {

            inWord = true;
        }
    }

    cout << word << endl << "Word Count: " << wordCount;
    return 0;

}
