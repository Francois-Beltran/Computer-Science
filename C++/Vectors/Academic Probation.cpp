#include <iostream>
#include <vector>

using namespace std;

//fill vector
void fillVector(vector<int> &src, int max)
{
     for (int i=0; i<max; i++)
    {
        int temp = 0;
        cout << "Enter Grade[" << max-i << "]: ";
        cin >> temp;

        src.push_back(temp);
    }
}

//checking with the threshold
vector<int> passingGrade(vector<int> &src, int threshold)
{
    vector<int> result;
    for (int i=0; i<src.size(); i++)
    {
        if (src[i] >= threshold)
            result.push_back(src[i]);
    }
    return result;
}

//printing vectors
void printing(const vector<int> &src)
{
    for (int i=0; i<src.size(); i++)
    {
        cout << src[i] << ", ";
    }
}

double calculateAverage (const vector<int> &src)
{
    double sum = 0;
    for (int i=0; i<src.size(); i++)
    {
        sum += src[i];
    }

    return sum / src.size();
}

int main()
{
    vector<int> grades;
    vector<int> result;
    int max;
    int threshold;

    cout << "Enter Number of Grades: ";
    cin >> max;

    //defensive programming
    if (max < 1)
    {
        cout << "Invalid Number of Grades!";
        return 1;
    }

    fillVector(grades,max);

    //passing grade
    cout << "\nWhat is the Threshold?: ";
    cin >> threshold;

    //result of the threshold checking
    result = passingGrade(grades, threshold);

    cout << "\nOriginal Vector: ";
    printing(grades);
    cout << "\nResult Vector: ";
    printing(result);

    cout << "\nThe Average Score of Passing Only: " << calculateAverage(result) << endl;

    return 0;
}
