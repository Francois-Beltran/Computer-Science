#include <iostream>
#include <vector>
#include <string>

using namespace std;

struct student
{
    string name;
    vector<int> score;
    double average;
};

void dataEntry(vector<student> &classroom, int size)
{
    int number;

    for (int i=0; i<size; i++)
    {
        student temp;   //fresh entry each iteration

        cout << "Enter Name: ";
        getline(cin, temp.name);

        cout << "How many?: ";
        cin >> number;

        for (int j=0; j<number; j++)
        {
            int s;
            cout << "Enter Score[" << number-j << "]: ";
            cin >> s;
            temp.score.push_back(s);
        }

        cin.ignore();
        classroom.push_back(temp);
    }
}

void calculateAverage(vector<student> &classroom)
{
    double average;

    for (int i=0; i<classroom.size(); i++)
    {
        double sum = 0;
        for (int j=0; j<classroom[i].score.size(); j++)
        {
            sum += classroom[i].score[j];
        }
        classroom[i].average = sum / classroom[i].score.size();
    }
}

vector<string> honorRoll(const vector<student> &classroom, double threshold)
{
    vector<string> honorable;

    for (int i=0; i<classroom.size(); i++)
    {
        if (classroom[i].average > threshold)
        {
            honorable.push_back(classroom[i].name);
        }
    }
    return honorable;
}

int main()
{
    vector<student> classroom;
    vector<string> honorable;
    int size;
    double threshold;

    cout << "Enter Size: ";
    cin >> size;
    cin.ignore();

    dataEntry(classroom, size);
    calculateAverage(classroom);

    cout << "Enter Threshold: ";
    cin >> threshold;
    cin.ignore();

    honorable = honorRoll(classroom,threshold);

    cout << "Honorable Lists: " << endl;
    for (int i=0; i<honorable.size(); i++)
    {
        cout << honorable[i] << endl;
    }

    return 0;

}
