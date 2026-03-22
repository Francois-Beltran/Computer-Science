#include <iostream>
#include <string>

using namespace std;

int main()
{
    string word;
    int n;

    cout << "Enter Word: ";
    getline(cin, word);

    cout << "Enter n: ";
    cin >> n;

    if (n <= 0)
    {
        cout << "Invalid n input! (n>0)";
        return 1;
    }

    for (int i=0; i<n; i++)
    {
        if (i == n-1)
        {
            cout << word;
        }
        else
        {
            cout << word << " ";
        }

    }

    return 0;

}
