#include <iostream>
#include <string>
#include <algorithm>
#include <vector>
#include <cctype>

using namespace std;

struct wordRecord
{
    string word;
    int length;
    int vowelCount;
};

int countVowels(string src)
{
    int vowelCount = 0;
    for (int i=0; i<src.size(); i++)
    {
        src[i] = tolower(src[i]);
        if (src[i] == 'a' || src[i] == 'e' || src[i] == 'i' || src[i] == 'o' || src[i] == 'u')
        {
            vowelCount++;
        }
    }

    return vowelCount;
}

bool isPalindrome(string src)
{
    string reversed = src;
    reverse(reversed.begin(), reversed.end());

    if (reversed == src)
        return true;
    else
        return false;
}

wordRecord analyzeWord(string src)
{
    wordRecord temp;

    temp.word = src;
    temp.length = src.length();
    temp.vowelCount = countVowels(src);

    return temp;

}

vector<wordRecord> analyzeList(vector<string> src)
{
    vector<wordRecord> results;

    for (int i=0; i<src.size(); i++)
    {
        wordRecord temp = analyzeWord(src[i]);

        results.push_back(temp);
    }
    return results;
}

double averageLength(vector<wordRecord> records)
{
    double sum = 0;

    for (int i=0; i<records.size(); i++)
    {
        sum += records[i].length;
    }
    return sum / records.size();
}

int main()
{
    vector<string> words;
    string src;
    vector<wordRecord> record;
    int size;

    cout << "Enter Size: ";
    cin >> size;
    cin.ignore();

    for (int i=0; i<size; i++)
    {
        string temp;
        cout << "Enter Word: ";
        getline(cin, temp);

        words.push_back(temp);
    }

    record = analyzeList(words);

    for (int i=0; i<record.size(); i++)
    {
        cout << "\n";
        cout << "Word: " << record[i].word << endl;
        cout << "Length: " << record[i].length << endl;
        cout << "Vowels: " << record[i].vowelCount << endl;
        cout << "Palindrome: ";

        if (isPalindrome(record[i].word))
            cout << "Yes" << endl;
        else
            cout << "No" << endl;
    }

    cout << "\n" << "Average Length: " << averageLength(record) << endl;

    return 0;
}
