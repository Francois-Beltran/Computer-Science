#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int>num;
    int input=0;

    cout << "Enter Number: " << endl;

    while (cin >> input && input != -1)
    {
        num.push_back(input);
    }

    int target = 0;
    int count = 0;
    int first = -1;
    int last = -1;
    cout << "Target Number?: ";
    cin >> target;

    for (int i=0; i<num.size(); i++)
    {
        if (num.at(i) == target)
        {
            count++;
            if (count == 1)
                first = i;
            last = i;

        }
    }

    cout << "How many did " << target << " appear: " << count << endl;
    cout << "First Found: " << first << endl;
    cout << "Last Found: " << last << endl;

    return 0;
}
