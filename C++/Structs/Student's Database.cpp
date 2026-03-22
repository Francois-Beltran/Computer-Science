#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct Students
{
    string name;
    int score;
};

void addStudent(vector<Students> &classroom, int size)
{
    Students temp;
    for (int i=0; i<size; i++)
    {
        cout << "Enter name: ";
        getline(cin, temp.name);

        cout << "Enter Score: ";
        cin >> temp.score;

        cin.ignore();

        classroom.push_back(temp);
    }
}

Students findTop(vector<Students> classroom)
{
    Students top = classroom[0];

    for (int i=0; i<classroom.size(); i++)
    {
        if (classroom[i].score > top.score)
        {
            top = classroom[i];
        }
    }

    return top;
}
int main()
{
    vector<Students> classroom;
    Students highest;
    int size;

    cout << "Enter Size: ";
    cin >> size;
    cin.ignore();

    if (size < 1)
    {
        cout << "Invalid Size!";
        return 1;
    }

    addStudent(classroom, size);
    highest = (findTop(classroom));

    cout << "Name: " << highest.name << endl;
    cout << "Score: " << highest.score << endl;

    return 0;

}
