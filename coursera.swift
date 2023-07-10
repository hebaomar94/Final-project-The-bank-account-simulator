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
