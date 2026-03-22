#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct product
{
    string name;
    int quantity;
    double price;

};

void fillInventory(vector<product> &list, int size)
{
    product temp;

    for (int i=0; i<size; i++)
    {
        cout << "Product Name: ";
        getline(cin, temp.name);

        cout << "Quantity: ";
        cin >> temp.quantity;

        cout << "Price: ";
        cin >> temp.price;

        cin.ignore();

        cout << "\n";

        list.push_back(temp);
    }
}

void reStock(vector<product> &list, string target, int amount)
{
    int notfound = 1;
    for (int i=0; i<list.size(); i++)
    {
        if (list[i].name == target)
        {
            list[i].quantity += amount;
            notfound = 0;
            break;
        }
    }

    if (notfound)
    {
        cout << "Product not Found!" << endl;
    }
    else
    {
        cout << "Restock Successful!" << endl;
    }

}

double totalValue(const vector<product> &list)
{
    double sum = 0;

    for (int i=0; i<list.size(); i++)
    {
        sum += list[i].quantity * list[i].price;
    }
    return sum;
}

int main()
{
    vector<product> list;
    string target;
    double toal_value;
    int size;
    int amount;

    cout << "Enter Size: ";
    cin >> size;
    cin.ignore();

    if (size < 1)
    {
        cout << "Invalid Size!";
        return 1;
    }

    fillInventory(list, size);

    cout << "What Product to Restock?: ";
    getline(cin, target);

    cout << "Amount?: ";
    cin >> amount;
    cin.ignore();
    reStock(list, target, amount);

    cout << "\n";
    printf("Total Inventory Value: %.2f", totalValue(list));
    cout << "\n";

    return 0;
}
