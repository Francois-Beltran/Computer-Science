#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int>A = {1, 2, 3, 4, 5};
    vector<int>B = {2, 4, 6, 2, 8, 10,};
    vector<int>C;

    //for checking A
    for (int i=0; i<A.size(); i++)
    {
        bool duplicate = false; // flag to find duplicate

        //for checking A[i] to B[i]
        for (int j=0; j<B.size(); j++)
        {
            if (A[i] == B[j])
            {
                //checking for duplicate
                for (int k=0; k<C.size(); k++)
                {
                    if (A[i] == C[k])
                    {
                        duplicate = true;
                        break;
                    }
                }
                if (duplicate == false)
                    C.push_back(A[i]);
            }
        }
    }
    //printing the intersection vector
    for (int i=0; i<C.size(); i++)
    {
        cout << C.at(i) << ", ";
    }

    return 0;

}
