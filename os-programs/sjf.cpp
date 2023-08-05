#include <bits/stdc++.h>
using namespace std;

struct Process
{
    int pid;
    int bt;
    int at;
    int ct;
    int tat;
};

bool compareArrivalTime(const Process &p1, const Process &p2)
{
    return p1.at < p2.at;
}

bool compareBurstTime(const Process &p1, const Process &p2)
{
    return p1.bt < p2.bt;
}

int main()
{
    srand(time(0));

    int n = 10;
    vector<Process> processes(n);

    for (int i = 0; i < n; ++i)
    {
        processes[i].pid = i + 1;
        processes[i].at = rand() % 10;
        processes[i].bt = 5 + rand() % 16;
    }

    sort(processes.begin(), processes.end(), compareArrivalTime);

    vector<Process> schedule;
    vector<bool> completed(n, false);
    int currentTime = 0;

    while (true)
    {
        int idx = -1;
        long long int minBurstTime = 999999;

        for (int i = 0; i < n; ++i)
        {
            if (!completed[i] && processes[i].at <= currentTime && processes[i].bt < minBurstTime)
            {
                minBurstTime = processes[i].bt;
                idx = i;
            }
        }

        if (idx == -1)
            break;

        schedule.push_back(processes[idx]);
        completed[idx] = true;
        currentTime += processes[idx].bt;
        schedule.back().ct = currentTime;
        schedule.back().tat = currentTime - processes[idx].at;
    }

    cout << "\nProcess\tAT\tBT\tCT\tTAT\n";
    int atat = 0, act = 0;
    for (const Process &p : schedule)
    {
        cout << p.pid << "\t" << p.at << "\t" << p.bt << "\t" << p.ct << "\t" << p.tat << "\n";
        act += p.ct;
        atat += p.tat;
    }
    cout << "Average Turn Around Time: " << (float)atat / (float)n << endl;
    cout << "Average Completion Time: " << (float)act / (float)n << endl;
    return 0;
}
