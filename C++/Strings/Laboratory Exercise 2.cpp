#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

string cleaning(string src)
{
    string cleaned;

    for (int i=0; i<src.size(); i++)
    {
        if (src[i] != ',' && src[i] != ' ')
        {
            cleaned += src[i];
        }
    }
    return cleaned;
}

string sorted(string src)
{
    sort(src.begin(), src.end());

    return src;
}

string findMedian(string src)
{
    int mid;
    string median;

    if (src.size() % 2 == 0)
    {
        mid = (src.size() / 2) - 1;
        median += src[mid];
        median += src[mid+1];
    }
    else
    {
        mid = src.size() / 2;
        median += src[mid];
    }
    return median;
}

char findMode(string src)
{
    char mode;

    for (int i=0; i<src.size()-1; i++)
    {
        int flag = 0;

        for (int j=i+1; j<src.size(); j++)
        {
            if (src[i] == src[j])
            {
                flag = 1;
            }
        }
        if(flag)
        {
            mode = src[i];
        }
    }
    return mode;
}

int main()
{
    string src;
    string cleaned;

    cout << "Enter String: ";
    getline(cin, src);

    cleaned = sorted(cleaning(src));

    for (int i=0; i<cleaned.size(); i++)
    {
        cout << cleaned[i];
        if (i != cleaned.size()-1)
        cout << ", ";
    }
    cout << "\n" << findMedian(cleaned) << endl;
    cout << findMode(cleaned) << endl;

    return 0;
}
