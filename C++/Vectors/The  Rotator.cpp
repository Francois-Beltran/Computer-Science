#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int>num = {1, 2, 3, 4, 5};
    int n=0;

    cin >> n;

    while (n>0)
    {
        int temp = num.back();
        num.pop_back();
        num.insert(num.begin(), temp);
        n--;
    }

    for (int i=0; i<num.size(); i++)
    {
        cout << num.at(i) << ", ";
    }
    return 0;
}
