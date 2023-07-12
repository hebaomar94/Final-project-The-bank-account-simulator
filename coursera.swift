class Greet {
    func greeting (){
        print ("Welcome to your virtual bank system. ")
        print("What kind of account would you like to open? ")
    }
    func onboard() {
          print("What kind of account would you like to open?")
          print("1. Debit account")
          print("2. Credit account")
      }
    var accountType = " "
    //Create the bank account type based on user input
    func makeAccount(numberPadKey: Int) {
        print("The selected option is \(numberPadKey).")
        switch numberPadKey {
        case 1:
            accountType = "debit"
        case 2:
            accountType = "credit"
        default:
            print("Invalid input: \(numberPadKey)")
            return
        }
        print("You have opened a \(accountType) account.")
    }
}

//Welcoming customer with a virtual bank system instance
let welcomCustomer = Greet()
welcomCustomer.greeting()
repeat {
    welcomCustomer.onboard()
    let numberPadKey = Int.random(in: 1...3)
    welcomCustomer.makeAccount(numberPadKey: numberPadKey)
} while welcomCustomer.accountType == ""


struct BankAccount {
    //Creating stored properties
    var debitBalance = 0
    var creditBalance = 0
    let creditLimit = 100
    //Creating computed properties
    var  debitBalanceInfo: String{
        "Debit balance: $\(debitBalance)"
    }

    var  availableCredit: Int {
        creditLimit + creditBalance
    }
    
    var creditBalanceInfo: String {
        return "Available credit:\(availableCredit)"
    }
    // Implement the deposit operation for debit and credit bank accounts
    mutating func debitDeposit(_ amount: Int) {
          debitBalance += amount
          print("Debit deposit: $\(amount). \(debitBalanceInfo)")
      }
    
    //Implement the withdrawal operation for debit and credit bank accounts
    mutating func debitWithdraw (_ amount: Int){
        if amount > debitBalance {
            print("Insufficient funds to withdraw $\(amount). \(debitBalanceInfo)")
               } else {
                   debitBalance -= amount
                   print("Debit withdraw: $\(amount). \(debitBalanceInfo)")
               
        }
    }
    
    //Credit deposit

    mutating func creditDeposit (_ amount: Int){
        creditBalance += amount
        print("Credit deposit: $\(amount). \(creditBalanceInfo)")
        if creditBalance == 0 {
                    print("Paid off credit balance.")
                } else if creditBalance > 0 {
                    print("Overpaid credit balance.")
                }
    }
    
    mutating func creditWithdraw (_ amount: Int){
        if amount > availableCredit {
            print ("Insufficient credit to withdraw: \(amount). \(creditBalanceInfo)")
        } else {
            print ("Credit withdraw: \(amount) \(creditBalanceInfo)")
        }
    }
    
    
}
//Create a bank account instance

var bankAccount = BankAccount()
print(bankAccount.debitBalanceInfo)
bankAccount.debitDeposit(100)
bankAccount.debitWithdraw(20)
bankAccount.debitWithdraw(81)
print(bankAccount.creditBalanceInfo)
bankAccount.creditWithdraw(101)
bankAccount.creditWithdraw(100)
bankAccount.creditDeposit(50)
bankAccount.creditDeposit(50)
bankAccount.creditDeposit(100)

