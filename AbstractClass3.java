
import java.util.*;

abstract class marks {
    abstract float getPercentage();
}

class A extends marks {
    float a, b, c;
    Scanner s = new Scanner(System.in);

    float getPercentage() {
        a = s.nextFloat();
        b = s.nextFloat();
        c = s.nextFloat();
        float p = (a + b + c) / 3;
        return p;

    }
}

class B extends marks {
    float a, b, c, d;
    Scanner s = new Scanner(System.in);

    float getPercentage() {
        a = s.nextFloat();
        b = s.nextFloat();
        c = s.nextFloat();
        d = s.nextFloat();
        float p = (a + b + c + d) / 4;
        return p;
    }
}

class AbstractClass3 {
    public static void main(String[] args) {
        A a = new A();
        B b = new B();
        float o = a.getPercentage();
        float o1 = b.getPercentage();
        System.out.printf("%.2f\n", o);
        System.out.printf("%.2f", o1);
    }
}