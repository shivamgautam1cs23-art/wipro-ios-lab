
import Foundation



func calculateMean(numbers: [Double]) -> Double {

    if numbers.isEmpty {
        return 0
    }

    let total = numbers.reduce(0, +)
    return total / Double(numbers.count)
}




func findMaximum(numbers: [Int]) -> Int? {

    return numbers.max()
}




func validateEmail(email: String) -> Bool {

    if email.contains("@") && email.contains(".") {
        return true
    }
    else {
        return false
    }
}




func formatName(name: String) -> String {

    return name
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .capitalized
}




func calculateSquare(number: Int) -> Int {

    return number * number
}




print("----- FUNCTION TESTING -----")

let marks = [80.0, 90.0, 75.0, 85.0]

print("Mean:", calculateMean(numbers: marks))

let numbers = [10, 50, 30, 90, 20]

print("Maximum Number:", findMaximum(numbers: numbers) ?? 0)

print("Valid Email:", validateEmail(email: "shivam@gmail.com"))

print("Formatted Name:", formatName(name: "  shivam gautam  "))

print("Square:", calculateSquare(number: 5))




print("\n----- TRANSACTION OPERATIONS -----")

struct Transaction {

    var title: String
    var amount: Double
    var type: String
    var category: String

}

let transactions = [

    Transaction(title: "Shopping", amount: 2000, type: "Expense", category: "Shopping"),

    Transaction(title: "Salary", amount: 15000, type: "Income", category: "Salary"),

    Transaction(title: "Food", amount: 500, type: "Expense", category: "Food"),

    Transaction(title: "Travel", amount: 1000, type: "Expense", category: "Travel"),

    Transaction(title: "Freelancing", amount: 5000, type: "Income", category: "Income")

]




let expenses = transactions.filter {
    $0.type == "Expense"
}

print("Total Expense Transactions:", expenses.count)




let expenseNames = expenses.map {
    $0.title
}

print("Expense Names:", expenseNames)


let totalExpenses = expenses.reduce(0) {
    $0 + $1.amount
}

print("Total Expenses:", totalExpenses)


print("\n----- STUDENT SORTING -----")

struct Student {

    var name: String
    var marks: Int

}

let students = [

    Student(name: "Rahul", marks: 85),

    Student(name: "Aman", marks: 90),

    Student(name: "Shivam", marks: 85),

    Student(name: "Priya", marks: 95),

    Student(name: "Karan", marks: 85)

]




let sortedStudents = students.sorted {

    if $0.marks == $1.marks {
        return $0.name < $1.name
    }

    return $0.marks > $1.marks
}

for student in sortedStudents {

    print(student.name, "-", student.marks)

}



print("\n----- LOOP BASED EXPENSE CALCULATION -----")

var loopTotal = 0.0

for transaction in transactions {

    if transaction.type == "Expense" {
        loopTotal += transaction.amount
    }

}

print("Total Expenses using Loop:", loopTotal)




print("\n----- HIGHER ORDER FUNCTION -----")

let higherOrderTotal = transactions
    .filter { $0.type == "Expense" }
    .map { $0.amount }
    .reduce(0, +)

print("Total Expenses using Filter, Map and Reduce:", higherOrderTotal)


print("\n----- FINAL REPORT -----")

print("Mean Marks:", calculateMean(numbers: marks))

print("Highest Number:", findMaximum(numbers: numbers) ?? 0)

print("Total Spending:", higherOrderTotal)

print("Student Count:", sortedStudents.count)

