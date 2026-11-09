
import Foundation

class BankAccount {

    private var balance: Double
    let accountHolder: String

    init?(accountHolder: String, initialBalance: Double) {

        if accountHolder.isEmpty || initialBalance < 0 {
            print("Invalid account details!")
            return nil
        }

        self.accountHolder = accountHolder
        self.balance = initialBalance
    }

    func deposit(amount: Double) {

        if amount <= 0 {
            print("Deposit amount must be greater than zero.")
        }
        else {
            balance += amount
            print("Amount deposited:", amount)
        }
    }

    func withdraw(amount: Double) {

        if amount <= 0 {
            print("Withdrawal amount must be greater than zero.")
        }
        else if amount > balance {
            print("Insufficient balance!")
        }
        else {
            balance -= amount
            print("Amount withdrawn:", amount)
        }
    }

    func showBalance() {
        print("Current Balance:", balance)
    }
}



import Foundation

public class AccessDemo {

    private var privateValue = "Private Access"

    fileprivate var fileValue = "Fileprivate Access"

    internal var internalValue = "Internal Access"

    public var publicValue = "Public Access"


    func showPrivateValue() {
        print(privateValue)
    }
}


func showFileValue() {
    let obj = AccessDemo()
    print(obj.fileValue)
}


import Foundation

print("----- BANK ACCOUNT -----")

if let account = BankAccount(
    accountHolder: "Shivam",
    initialBalance: 5000
) {

    print("Account Holder:", account.accountHolder)

    
    account.deposit(amount: 2000)

    
    account.withdraw(amount: 1000)

   
    account.showBalance()


    account.deposit(amount: 0)
    account.deposit(amount: -500)

    
    account.withdraw(amount: -200)
    account.withdraw(amount: 10000)

    
    account.showBalance()
}



print("\n----- INVALID ACCOUNT -----")

let invalidAccount = BankAccount(
    accountHolder: "",
    initialBalance: -1000
)



print("\n----- ACCESS MODIFIERS -----")

let obj = AccessDemo()


obj.showPrivateValue()


showFileValue()


print(obj.internalValue)


print(obj.publicValue)



Access Control in Swift

Swift provides access control to restrict the accessibility of classes, variables, methods and other program elements.

Private: 
Private members can only be accessed within their enclosing declaration and permitted extensions in the same file. In my program, the bank account balance is private so that it cannot be directly modified from outside the class.

Fileprivate: 
Fileprivate members can be accessed anywhere within the same Swift source file. I demonstrated this using the `fileValue` variable in AccessDemo.swift.

Internal:
Internal members can be accessed throughout the same module. It is the default access level in Swift. I demonstrated this using `internalValue`.

Public:
Public members can be accessed from other modules when the module is imported. I demonstrated this using `publicValue`.

Conclusion

In this program, I created a BankAccount class with a private balance and public-facing deposit, withdraw and showBalance operations. I also added validation to prevent invalid deposits, withdrawals and account creation.

Access control helps protect data and prevents unwanted modifications to important information.
