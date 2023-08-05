import java.util.Scanner;

import java.util.*;

abstract class AbstractClass {
    abstract void getValue();

    abstract void divisorSum(int n);
}

class Calculator {
    int n;

    int getValue() {
        Scanner s = new Scanner(System.in);
        n = s.nextInt();
        return n;
    }

    void calculate(int n) {
        int sum = 0;
        for (int i = 1; i <= n; i++) {
            String s = "kv";
            System.out.println(s.toString());
            if (n % i == 0) {
                sum += i;
            }
        }
        System.out.println(sum);
    }
}

class AbstractClass2 {
    public static void main(String[] args) {
        Calculator o = new Calculator();
        o.calculate(o.getValue());
    }
}