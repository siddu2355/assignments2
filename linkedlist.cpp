#include <iostream>
using namespace std;

struct node
{
    int id;
    string name;
    node *next;
};

node *head;

node *newNode(int num, string name)
{
    node *newNod = new node;
    newNod->id = num;
    newNod->name = name;
    newNod->next = NULL;
    return newNod;
}

void InsertAtEnd(int num, string name)
{
    struct node *ptr = head;
    if (head == NULL)
    {
        head = newNode(num, name);
        return;
    }
    while (ptr->next != NULL)
    {
        ptr = ptr->next;
    }
    ptr->next = newNode(num, name);
}

void display()
{
    struct node *ptr = head;
    while (ptr != NULL)
    {
        cout << ptr->id << "-" << ptr->name << ", ";
        ptr = ptr->next;
    }
}
int main()
{
    head = NULL;
    InsertAtEnd(1, "x");
    InsertAtEnd(2, "y");
    InsertAtEnd(3, "z");
    InsertAtEnd(4, "a");
    InsertAtEnd(5, "b");
    InsertAtEnd(6, "c");
    display();
    return 0;
}
