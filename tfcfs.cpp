#include <iostream>
#include <time.h>
#include <stdlib.h>
using namespace std;
int main()
{
	int M[50][4], i, j, k = -1, tbt = 0, Rn;
	for (i = 0; i < 50; i++)
	{
		Rn = rand() % 100;
		if (Rn < 40)
		{
			k = k + 1;
			M[k][0] = i;
			M[k][1] = rand() % 30 + 10;
			M[k][2] = tbt;
			M[k][3] = tbt + M[k][1] - M[k][0];
			tbt += M[k][1];
			cout << M[k][0] << "  " << M[k][1] << "  " << M[k][2] << "  " << M[k][3] << endl;
		}
	}
	return 0;
}
