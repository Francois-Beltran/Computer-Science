#include <iostream>
#include <string>

using namespace std;

int main()
{
    string input;
    int shortest = -999;
    int longest = 999;
    double average;
    bool inword = true;
    int wordcount = 0;

    cout << "Enter String: ";
    getline(cin, input);

    //count how many word
    for (int i=0; i<input.length(); i++)
    {
            if (input[i] != ' ')
            {
                if (inword)
                {
                    wordcount++;
                    inword = false;
                }
            }
            else
            {
                inword = true;
            }
    }
    //count shortest
    for (int i=0; i<wordcount; i++)
    {
        while
    }

    cout << "Words: " << wordcount << endl;
    //cout << "Shortest: " << shortest << endl;
    //cout << "Longest: " << longest << endl;
    //cout << "Average: " << endl;

    return 0;
}
