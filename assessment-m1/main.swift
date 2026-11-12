
import Foundation


var gradebook: [String: [Int]] = [
    "Shivam": [85, 90, 78],
    "Rahul": [70, 75, 80],
    "Ananya": [95, 92, 98]
]


func calculateAverage(marks: [Int]?) -> Double? {

    guard let marks = marks, !marks.isEmpty else {
        return nil
    }

    let total = marks.reduce(0, +)
    return Double(total) / Double(marks.count)
}


func displayResult(for student: String) {

    guard let marks = gradebook[student] else {
        print("Student not found!")
        return
    }

    guard let average = calculateAverage(marks: marks) else {
        print("Marks are unavailable!")
        return
    }

    let grade: String

    switch average {
    case 90...100:
        grade = "A"
    case 80..<90:
        grade = "B"
    case 70..<80:
        grade = "C"
    case 60..<70:
        grade = "D"
    default:
        grade = "F"
    }

    print("Student: \(student)")
    print("Marks: \(marks)")
    print("Average: \(average)")
    print("Grade: \(grade)")
    print("-------------------")
}

displayResult(for: "Shivam")
displayResult(for: "Rahul")
displayResult(for: "Ananya")
displayResult(for: "Aman")



import Foundation


struct Stack<T> {

    private var items: [T] = []

    
    mutating func push(_ item: T) {
        items.append(item)
    }

    
    mutating func pop() -> T? {
        return items.popLast()
    }

    
    func peek() -> T? {
        return items.last
    }

    
    var isEmpty: Bool {
        return items.isEmpty
    }

    
    func display() {
        print(items)
    }
}


var intStack = Stack<Int>()

intStack.push(10)
intStack.push(20)
intStack.push(30)

print("Integer Stack:")
intStack.display()

print("Popped:", intStack.pop() ?? -1)
print("Top:", intStack.peek() ?? -1)


var stringStack = Stack<String>()

stringStack.push("Swift")
stringStack.push("UIKit")
stringStack.push("SwiftUI")

print("\nString Stack:")
stringStack.display()

print("Popped:", stringStack.pop() ?? "Empty")
print("Top:", stringStack.peek() ?? "Empty")



import Foundation

class Person {

    var name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) is deallocated")
    }
}

class Apartment {

    var address: String
    var tenant: Person?

    init(address: String) {
        self.address = address
    }

    deinit {
        print("Apartment is deallocated")
    }
}

var person: Person? = Person(name: "Shivam")
var apartment: Apartment? =
    Apartment(address: "Mathura")

person?.apartment = apartment
apartment?.tenant = person


person = nil
apartment = nil
