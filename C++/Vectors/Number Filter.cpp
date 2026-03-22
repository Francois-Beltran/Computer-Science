#include <iostream>
#include <vector>

using namespace std;

vector<int> fillVector(vector<int> &src, int size)
{
    int temp = 0;
    for (int i=0; i<size; i++)
    {
        cin >> temp;
        src.push_back(temp);
    }
    return src;
}

vector<int> positiveFilter(const vector<int> &src)
{
    vector<int> positive;

    for (int i=0; i<src.size(); i++)
    {
        if (src[i] > 0)
            positive.push_back(src[i]);
    }
    return positive;
}

vector<int> negativeFilter(const vector<int> &src)
{
    vector<int> negative;

    for (int i=0; i<src.size(); i++)
    {
        if (src[i] < 0)
            negative.push_back(src[i]);
    }
    return negative;
}

vector<int> evenFilter(const vector<int> &src)
{
    vector<int> even;

    for (int i=0; i<src.size(); i++)
    {
        if (src[i] % 2 == 0)
            even.push_back(src[i]);
    }
    return even;
}

vector<int> oddFilter(const vector<int> &src)
{
    vector<int> odd;

    for (int i=0; i<src.size(); i++)
    {
        if (src[i] % 2 != 0)
            odd.push_back(src[i]);
    }
    return odd;
}

void printVector(const vector<int> &src)
{
    for (int i=0; i<src.size(); i++)
    {
        cout << src[i] << ", ";
    }

}

int main()
{
    vector<int> inputlist;
    vector<int> result;
    int size;

    cout << "Input size: ";
    cin >> size;

    result = fillVector(inputlist, size);

    cout << "Source Vector: ";
    printVector(result);

    cout << "\n" << "Positives: ";
    printVector(positiveFilter(result));

    cout << "\n" << "Negatives: ";
    printVector(negativeFilter(result));

    cout << "\n" << "Odds: ";
    printVector(oddFilter(result));

    cout << "\n" << "Evens: ";
    printVector(evenFilter(result));


    return 0;
}
