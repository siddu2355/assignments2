#include <bits/stdc++.h>
using namespace std;

class X
{
private:
    int oii, uo, yy;

public:
    int hcf(int a, int b)
    {
        if (b == 0)
        {
            return a;
        }
        return hcf(b, a % b);
    }
    int funny(vector<int> &arr, int x)
    {
        int minimum = INT_MAX;
        int indoxxx = -1;
        for (int i = 0; i < arr.size(); i++)
        {
            if (arr[i] < minimum && hcf(arr[i], x) > 1)
            {
                minimum = arr[i];
                indoxxx = i;
            }
        }

        if (indoxxx == -1)
        {
            indoxxx = min_element(arr.begin(), arr.end()) - arr.begin();
        }

        int answer = arr[indoxxx];
        arr[indoxxx] = INT_MAX;
        return answer;
    }
};

int main()
{
    int t;
    cin >> t;
    X o;
    while (t--)
    {
        int n;
        cin >> n;

        vector<int> arr(n);
        for (int i = 0; i < n; i++)
        {
            cin >> arr[i];
        }

        int q;
        cin >> q;

        for (int i = 0; i < q; i++)
        {
            int rambo;
            cin >> rambo;
            int answer = o.funny(arr, rambo);
            cout << answer << " ";
        }
        cout << endl;
    }

    return 0;
}