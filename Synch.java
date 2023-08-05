
// class Callme {
//     void call(String msg) {
//         System.out.print("[" + msg);
//         try {
//             Thread.sleep(1000);
//         } catch (InterruptedException e) {
//             System.out.println("Interrupted");
//         }
//         System.out.println("]");
//     }
// }

// class Caller implements Runnable {
//     String msg;
//     Callme target;
//     Thread t;

//     public Caller(Callme targ, String s) {
//         target = targ;
//         msg = s;
//         t = new Thread(this);
//         t.start();
//     }

//     public void run() {
//         synchronized (target) {
//             target.call(msg);
//         }
//     }
// }

// class Synch {
//     public static void main(String args[]) {
//         Callme target = new Callme();
//         Caller ob3 = new Caller(target, "World");
//         Caller ob2 = new Caller(target, "Synchronized");
//         Caller ob1 = new Caller(target, "Hello");
//         try {
//             ob3.t.join();
//             ob2.t.join();
//             ob1.t.join();
//         } catch (InterruptedException e) {
//             System.out.println("Interrupted");
//         }
//     }
// }
class Table {
    void printTable(int n) {// method not synchronized
        for (int i = 1; i <= 5; i++) {
            System.out.println(n + i);
            try {
                Thread.sleep(400);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
}

class MyThread1 extends Thread {
    Table t;

    MyThread1(Table t) {
        this.t = t;
    }

    public void run() {
        t.printTable(0);
    }
}

class MyThread2 extends Thread {
    Table t;

    MyThread2(Table t) {
        this.t = t;
    }

    public void run() {
        t.printTable(1);
    }
}

class Synch {
    public static void main(String args[]) {
        Table obj = new Table();// only one object
        Table obj1 = new Table();
        MyThread1 t1 = new MyThread1(obj);
        MyThread2 t2 = new MyThread2(obj1);
        t1.start();
        t2.start();
    }
}