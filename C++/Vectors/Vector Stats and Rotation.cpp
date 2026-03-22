#include <iostream>
#include <vector>

using namespace std;

//fill vector with input
void fillVector(vector<int> &vec, int size)
{
    int input;

    cout << "Enter Values: ";

    for (int i=0; i<size; i++)
    {
        cin >> input;
        vec.push_back(input);
    }
}

double findMean(const vector<int> &vec)
{
    double sum = 0;
    double mean;

    for (int i=0; i<vec.size(); i++)
    {
        sum += vec[i];
    }
    mean = sum / vec.size();

    return mean;

}

void rotateLeft(vector<int> &vec)
{
    int temp=vec[0];

    for (int i=0; i<vec.size()-1; i++)
    {
        vec[i] = vec[i+1];
    }
    vec[vec.size()-1] = temp;
}

int main()
{
    vector<int> vec;
    int size;

    cout << "Enter Size: ";
    cin >> size;

    if (size < 1)
    {
        cout << "Size Input is Invalid!" << endl;
        return 1;
    }

    fillVector(vec, size);

    cout << "Mean of the Vector: " << findMean(vec) << endl;

    rotateLeft(vec);

    for (int i=0; i<vec.size(); i++)
    {
        cout << vec[i] << ", ";
    }

    return 0;
}
