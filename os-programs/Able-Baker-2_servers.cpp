#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <iostream>
#include <malloc.h>
#include <time.h>
using namespace std;

int main()
{

	srand((unsigned)time(NULL));

	int n, i, id = 0, sta = 0, stb = 0, st1, st2;
	struct node
	{
		int idno;
		int at;
		int st;
		int rst;
		int tt;
		int wt;
		int ft;
		char c;
		struct node *next;
	};

	struct node *list = NULL;
	struct node *tail = NULL;
	struct node *outlist = NULL;
	struct node *outtail = NULL;

	struct node *temp, *temp1, *temp2;

	for (i = 0; i < 200; i++)
	{

		n = rand() % 100;

		cout << "Time= " << i << "   "
			 << "Random Number= " << n << endl;

		if (n < 50)
		{
			cout << "customer arrived  " << id + 1 << endl
				 << endl;
			getch();
			temp = new node;
			temp->idno = ++id;
			temp->at = i;
			temp->st = 0;
			temp->rst = 0;
			temp->tt = 0;
			temp->wt = 0;
			temp->ft = 0;
			temp->c = 'x';
			temp->next = NULL;

			if (list == NULL)
			{
				list = temp;
				tail = temp;
			}

			else if (list != NULL)
			{
				tail->next = temp;
				tail = temp;
			};
		};

		if (list != NULL)
		{
			if (sta == 0)
			{
				cout << "Able is free" << endl;
				temp1 = list;
				list = list->next;

				n = rand() % 100;
				if (n < 20)
					st1 = 2;
				else if (n < 50)
					st1 = 3;
				else if (n < 80)
					st1 = 4;
				else if (n < 100)
					st1 = 5;
				cout << "st=" << st1 << endl;

				temp1->st = st1;

				temp1->rst = st1;

				temp1->c = 'A';
				sta = 1;
			}

			else if (stb == 0)
			{
				cout << "Baker is free" << endl;
				temp2 = list;
				list = list->next;

				n = rand() % 100;
				if (n < 20)
					st1 = 4;
				else if (n < 50)
					st1 = 5;
				else if (n < 80)
					st1 = 6;
				else if (n < 100)
					st1 = 7;
				cout << "st=" << st1 << endl;

				temp2->st = st1;

				temp2->rst = st1;

				temp2->c = 'B';
				stb = 1;
			}
		}
		if (sta == 1)
		{
			temp1->rst = temp1->rst - 1;
			if (temp1->rst == 0)
			{
				sta = 0;
				temp1->ft = i;
				temp1->tt = temp1->ft - temp1->at;
				if (outlist == NULL)
				{
					outlist = temp1;
					outtail = temp1;
				}
				else
				{
					outtail->next = temp1;
					outtail = temp1;
				};
			}
		}
		cout << "sta=  " << sta << endl;

		if (stb == 1)
		{
			temp2->rst = temp2->rst - 1;
			if (temp2->rst == 0)
			{
				stb = 0;
				temp2->ft = i;
				temp2->tt = temp2->ft - temp2->at;
				if (outlist == NULL)
				{
					outlist = temp2;
					outtail = temp2;
				}
				else
				{
					outtail->next = temp2;
					outtail = temp2;
				}
			}
		}
		cout << "stb=  " << stb << endl;

		temp = list;
		while (temp != NULL)
		{
			temp->wt += 1;
			temp = temp->next;
		}

		cout << "current time=" << i << endl
			 << endl;
	};
	cout << "simulation closes" << endl
		 << endl;
	getch();

	float twt = 0, awt, ttt = 0, att;
	int ableC = 0, bakerC = 0, QC = 0, TC = 0;

	temp = outlist;

	while (temp != NULL)
	{
		twt = twt + temp->wt;
		ttt = ttt + temp->tt;
		TC++;
		if (temp->c == 'A')
			ableC++;
		else if (temp->c == 'B')
			bakerC++;
		else
			QC++;

		temp = temp->next;
	}
	awt = twt / float(id);
	att = ttt / float(id);
	cout << "awerage Waiting time =  " << awt << endl
		 << endl;

	cout << "awerage Turn-around time  =  " << att << endl
		 << endl;

	cout << "Total customers  =  " << TC << endl
		 << endl;

	cout << "No. of customers served by Able  =  " << ableC << endl
		 << endl;

	cout << "No. of customers served by Baker  =  " << bakerC << endl
		 << endl;

	cout << "No. of customers left in the Q  =  " << QC << endl
		 << endl;
}
