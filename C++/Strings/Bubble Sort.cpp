#include <iostream>
#include <string>

using namespace std;

void bubbleSort(string &input)
{
    int temp;

    for (int i=0; i<input.size()-1; i++)
    {
        for (int j=0; j<input.size()-i-1; j++)
        {
            if (input[j] > input[j+1])
            {
                temp = input[j];
                input[j] = input[j+1];
                input[j+1] = temp;
            }

        }
    }
}
int main()
{
    string input;

    cout << "Enter String: ";
    cin >> input;

    bubbleSort(input);

    cout << input << endl;

    return 0;

}
