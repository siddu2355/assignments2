import java.util.*;

abstract class Shape {
    abstract void rectangleArea(int l, int b);

    abstract void squareArea(int s);

    abstract void circleArea(float r);
}

class Area extends Shape {
    void rectangleArea(int l, int b) {
        System.out.println(l * b);
    }

    void squareArea(int s) {
        System.out.println(s * s);
    }

    void circleArea(float r) {
        System.out.printf("%.2f", (22 * r * r) / 7);
    }
}

class AbstractShape {

    public static void main(String ar[]) {
        int a, b, si;
        float r;
        Scanner s = new Scanner(System.in);
        a = s.nextInt();
        b = s.nextInt();
        si = s.nextInt();
        r = s.nextFloat();
        Area o = new Area();
        o.rectangleArea(a, b);
        o.squareArea(si);
        o.circleArea(r);
    }
}
