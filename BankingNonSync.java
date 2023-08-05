public /*
        * To change this license header, choose License Headers in Project Properties.
        * To change this template file, choose Tools | Templates
        * and open the template in the editor.
        */

/**
 *
 * @author user
 */
class BankingNonSync {

    public static void main(String args[]) {

        Account acc = new Account(100);

        Thread john = new Thread(new Clerk("John", 50, acc));
        Thread jim = new Thread(new Clerk("Jim", 100, acc));

        john.start();
        jim.start();
    }
}

class Account {

    int balance;

    public Account(int balance) {
        this.balance = balance;
    }

    public int getBalance(Clerk c) {

        System.out.println(balance);

        return balance;
    }

    public void setBalance(Clerk c, int newBalance) {
        System.out.format("%s sets the balance: Old balance is %d%n", c.name, balance);
        balance = newBalance;
        System.out.format("%s sets the balance: New balance is %d%n", c.name, balance);
    }

}

class Clerk implements Runnable {

    String name;
    int amount;
    Account acc;

    public Clerk(String name, int amount, Account acc) {
        this.name = name;
        this.amount = amount;
        this.acc = acc;
    }

    public void run() {

        int balance, newBalance;

        balance = acc.getBalance(this);

        newBalance = balance + amount;

        acc.setBalance(this, newBalance);
    }
}
