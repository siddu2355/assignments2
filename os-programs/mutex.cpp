#include <iostream>
#include <conio.h>
#include <dos.h>
#include <time.h>
using namespace std;

int main()
{
    int cs = 0, pro = 0;
    double run = 5;
    char key = 'a';
    time_t t1, t2;

    cout << "Press a key(except q) to enter a process into critical section." << endl;
    cout << "Press q at any time to exit." << endl;
    t1 = time(NULL) - 5;
    while (key != 'q')
    {
        while (!kbhit())
        {
            if (cs != 0)
            {
                t2 = time(NULL);
                if (t2 - t1 > run)
                {
                    cout << "Process", pro - 1;
                    cout << " exits critical section." << endl;
                    cs = 0;
                }
            }
        }
        key = getch();
        if (key != 'q')
        {
            if (cs != 0)
            {
                cout << "Error: Another process is currently executing critical section" << endl;
                cout << " Please wait till its execution is over!" << endl;
            }
            else
            {
                cout << "Process  " << pro << endl;
                cout << " entered critical section" << endl;
                cs = 1;
                pro++;
                t1 = time(NULL);
            }
        }
    }
}
