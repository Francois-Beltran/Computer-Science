#include <iostream>
#include <string>

using namespace std;

int main()
{
    string email;
    bool emailflag = false;

    cout << "Enter your Email: ";
    getline(cin, email);

    if (empty(email))
    {
        cout << "Empty Input!" << endl;
        return 1;
    }

    for (int i=0; i<email.length(); i++)
    {
        if (email[i] == '@' && i != 0)
        {
           for (int j=i+1; j<email.length()-1; j++)
           {
               if (email[j] == '.' && email[j+1] != 0)
               {
                   emailflag = true;
                   break;
               }
           }
           if (emailflag)
            {
                break;
            }
        }
    }

    if (emailflag)
    {
        cout << "This input is Valid!" << endl;
    }
    else
    {
        cout << "This input is Invalid!" << endl;
    }


    return 0;
}
