
// Bankers algorithm is a resource allocation problem in Operating systems//
// The algorithm finds if there is a Safe state with a given set of resources//
// and a requirement from a set of resources. If a system has a safe state//
// it is assumed the system will avoid Deadlock//
// Values for Max, Allocated and Available need to be entered//

#include <iostream>
using namespace std;

int main()
{

	int i, j, k, FF, Flag[5], Allocated[5][4], Max[5][4], Need[5][4], Available[4];

	cout << "Enter the values for the matrix Allocated" << endl;

	for (i = 0; i < 5; i++)
	{
		for (j = 0; j < 4; j++)
		{
			cin >> Allocated[i][j];
		};
	};

	cout << "The following values are entered for the matrix Allocated" << endl;

	for (i = 0; i < 5; i++)
	{
		for (j = 0; j < 4; j++)
		{
			cout << Allocated[i][j] << "   ";
		};
		cout << endl;
	};

	cout << "Enter the values for the matrix Max" << endl;

	for (i = 0; i < 5; i++)
	{
		for (j = 0; j < 4; j++)
		{
			cin >> Max[i][j];
		};
	};

	cout << "The following values are entered for the matrix Max" << endl;

	for (i = 0; i < 5; i++)
	{
		for (j = 0; j < 4; j++)
		{
			cout << Max[i][j] << "  ";
		};

		cout << endl;
	};

	for (i = 0; i < 5; i++)
	{
		Flag[i] = 1;
		for (j = 0; j < 4; j++)
		{
			Need[i][j] = Max[i][j] - Allocated[i][j];
			if (Need[i][j] < 0)
				Need[i][j] = 0;
		};
	}

	cout << "The following values are calculated for the matrix Need" << endl;

	for (i = 0; i < 5; i++)
	{
		for (j = 0; j < 4; j++)
		{
			cout << Need[i][j] << "  ";
		};
		cout << endl;
	};

	cout << "Enter the values for the vector Available" << endl;

	for (j = 0; j < 4; j++)
	{
		cin >> Available[j];
	};

	cout << "The following values are entered for the available resources" << endl;

	for (i = 0; i < 4; i++)
	{
		cout << Available[i];
		cout << "   ";
	};
	cout << endl;

	j = 0;
	while (j < 5)
	{

		if (Flag[j] == 1)
		{

			if (Need[j][0] <= Available[0] && Need[j][1] <= Available[1] && Need[j][2] <= Available[2] && Need[j][3] <= Available[3])

			{
				cout << "Process" << j << " can be done" << endl;

				Flag[j] = 0;
				cout << endl;
				for (k = 0; k < 4; k++)
				{
					Available[k] = Available[k] + Allocated[j][k];
				};

				cout << "The new available values are" << endl;

				for (j = 0; j < 4; j++)
				{
					cout << Available[j];
					cout << "  ";
				};
				cout << endl;

				j = 0;
			}

			else
				j = j + 1;
		}
		else
			j = j + 1;
	}

	FF = 1;
	for (i = 0; i < 5; i++)
		if (Flag[i] == 1)
			FF = 0;

	if (FF)
		cout << "A solution is found" << endl;

	else
		cout << "No solution" << endl;
}
