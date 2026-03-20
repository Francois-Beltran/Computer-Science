#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
    vector<int>num;
    vector<int>odd;
    vector<int>even;
    int n=0;

    cout << "Enter The Amount: ";
    cin >> n;

    for (int i=0; i<n; i++)
    {
        int input = 0;
        cin >> input;
        num.push_back(input);
    }

    sort(num.begin(), num.end());

    for (int i=0; i<num.size(); i++)
    {
        if (num.at(i) % 2 == 0)
        {
            even.push_back(num.at(i));

        }
        else
        {
            odd.push_back(num.at(i));
        }
    }

    cout << "Even: ";
    for (int i=0; i<even.size(); i++)
    {
        cout  << even.at(i) << ", ";
    }

    cout << "\n" << "Odd: ";
    for (int i=0; i<odd.size(); i++)
    {
        cout << odd.at(i) << ", ";
    }


    return 0;

}
