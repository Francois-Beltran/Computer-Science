#include <iostream>
#include <string>

using namespace std;

int main()
{
    string first_name;
    string last_name;

    cout << "Enter First Name: ";
    getline(cin, first_name);
    cout << "Enter Last Name: ";
    getline(cin, last_name);

    cout << "Formatted Name: " << last_name << ", " << first_name << endl;

    return 0;
}
