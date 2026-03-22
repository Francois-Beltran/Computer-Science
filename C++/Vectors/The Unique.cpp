#include <iostream>
#include <vector>

using namespace std;

vector<int> getUniques(const vector<int> &input)
{
    vector<int> result;

    for (int i=0; i<input.size(); i++)
    {
        int flag = 1;
        for (int j=0; j<result.size(); j++)
        {
            if (input[i] == result[j])
            {
                flag = 0;
                break;
            }
        }
        if (flag == 1)
        {
            result.push_back(input[i]);
        }
    }

    return result;
}

int main()
{
    vector<int> input;
    int size;

    cout << "Enter Size: ";
    cin >> size;

    if (size < 1)
    {
        cout << "Invalid Size!";
        return 1;
    }

    cout << "Enter Values: " << endl;

    int value;
    for (int i=0; i<size; i++)
    {
        cin >> value;
        input.push_back(value);
    }

    vector<int> result = getUniques(input);

    for (int i=0; i<result.size(); i++)
    {
        cout << result[i];
        if (i != result.size()-1)
        cout << ", ";

    }

    return 0;

}
