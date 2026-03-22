#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int>num;
    int c = 10;

    while (c > 0)
    {
        int input = 0;
        cin >> input;
        num.push_back(input);
        c--;
    }

    for (int i=0; i+1<num.size(); i++)
    {
        for (int j=i+1; j<num.size();)
        {
            if (num[i] == num[j])
            {
                num.erase(num.begin() + j);
            }
            else
                j++;
        }
    }

    for (int i=0; i<num.size(); i++)
    {
        cout << num.at(i) << ", ";
    }

}
