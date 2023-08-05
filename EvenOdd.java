
class Num implements Runnable {
    int n;
    Thread t;

    Num(int n) {
        this.n = n;
        t = new Thread(this);
        t.start();
    }

    public void run() {
        synchronized (t) {
            for (int i = 0; i < 5; i++) {
                System.out.println(n + 2);
                n += 2;
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException e) {
                    System.out.println("Interrupted");
                }
            }
        }

    }
}

public class EvenOdd {
    public static void main(String args[]) {
        Num ob1 = new Num(-2);
        Num ob2 = new Num(-1);
        try {
            ob1.t.join();
            ob2.t.join();
            System.out.println("lk");
        } catch (InterruptedException e) {
            System.out.println("Interrupted");
        }
    }
}
