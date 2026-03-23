#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct Product
{
    string name;
    double unitPrice;
    int stockQuantity;
};

struct Department
{
    string deptName;
    vector<Product> inventory;
};

double calculateTotalValue(const Department &src)
{
    double total = 0;

    for (int i=0; i<src.inventory.size(); i++)
    {
        total += src.inventory[i].unitPrice * src.inventory[i].stockQuantity;
    }

    return total;
}

int main()
{
    Department Electronics;
    int max = 3;

    cout << "Tech Haven!" << endl;

    for (int i=0; i<max; i++)
    {
        Product temp;

        cout << "Enter Product Name: ";
        getline(cin, temp.name);

        cout << "Enter Unit Price: ";
        cin >> temp.unitPrice;

        cout << "Enter Stock Quantity: ";
        cin >> temp.stockQuantity;

        cin.ignore();

        Electronics.inventory.push_back(temp);

    }

    cout << calculateTotalValue(Electronics);



    return 0;
}
