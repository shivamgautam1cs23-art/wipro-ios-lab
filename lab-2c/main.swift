
import Foundation


protocol Displayable {
    var displayInfo: String { get }
}

struct Student: Displayable {
    var name: String
    var marks: Int

    var displayInfo: String {
        return "Student: \(name), Marks: \(marks)"
    }
}


struct Course: Displayable {
    var courseName: String
    var duration: Int

    var displayInfo: String {
        return "Course: \(courseName), Duration: \(duration) months"
    }
}

print("----- R1: PROTOCOL -----")

let student = Student(name: "Shivam", marks: 90)
let course = Course(courseName: "Swift Programming", duration: 3)

print(student.displayInfo)
print(course.displayInfo)




extension String {
    var wordCount: Int {
        let words = self.split(separator: " ")
        return words.count
    }
}

print("\n----- R2: EXTENSION -----")

let message = "Swift is easy to learn"
print("Message:", message)
print("Word Count:", message.wordCount)




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
}

print("\n----- R3: GENERIC STACK -----")

var numberStack = Stack<Int>()

numberStack.push(10)
numberStack.push(20)
numberStack.push(30)

print("Top Element:", numberStack.peek() ?? 0)
print("Removed Element:", numberStack.pop() ?? 0)
print("New Top Element:", numberStack.peek() ?? 0)
print("Is Stack Empty:", numberStack.isEmpty)




func showDetails<T: Displayable>(_ item: T) {
    print(item.displayInfo)
}

print("\n----- R4: PROTOCOL CONSTRAINT -----")


showDetails(student)
showDetails(course)


extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

print("\n----- R5: EXTENSION CHECK -----")

let number = 24
print("Number:", number)
print("Is Even:", number.isEven)




print("\n----- R6: ASSERTIONS -----")

assert(student.displayInfo == "Student: Shivam, Marks: 90")
assert(course.displayInfo == "Course: Swift Programming, Duration: 3 months")

assert(message.wordCount == 5)
assert(number.isEven == true)

var testStack = Stack<Int>()

assert(testStack.isEmpty == true)

testStack.push(100)
testStack.push(200)

assert(testStack.isEmpty == false)
assert(testStack.peek() == 200)
assert(testStack.pop() == 200)
assert(testStack.peek() == 100)

print("All 9 assertions passed successfully!")
