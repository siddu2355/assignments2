/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class BankingSync {

    public static void main(String args[]) {

        Account acc = new Account(100);

        Thread john = new Thread(new Customer("John", 50, acc));
        Thread jim = new Thread(new Customer("Jim", 100, acc));

        john.start();
        jim.start();
    }
}

class Account {

    int balance;

    public Account(int balance) {
        this.balance = balance;
    }

    public int getBalance(Customer c) {
        System.out.format("%s gets the balance: Current balance is %d%n", c.name, balance);
        return balance;
    }

    public void setBalance(Customer c, int newBalance) {
        System.out.format("%s sets the balance: Old balance is %d%n", c.name, balance);
        balance = newBalance;
        System.out.format("%s sets the balance: New balance is %d%n", c.name, balance);
    }

    public synchronized void updateBalance(Customer c, int amount) {
        System.out.format("%s updates the balance%n", c.name);
        this.setBalance(c, this.getBalance(c) + amount);
    }

}

class Customer implements Runnable {

    String name;
    int amount;
    Account acc;

    public Customer(String name, int amount, Account acc) {
        this.name = name;
        this.amount = amount;
        this.acc = acc;
    }

    public void run() {
        acc.updateBalance(this, amount);
    }
}