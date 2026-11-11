
import Foundation


struct Student {
    var name: String
    var marks: Int
}

let students = [
    Student(name: "Rahul", marks: 80),
    Student(name: "Aman", marks: 90),
    Student(name: "Priya", marks: 95),
    Student(name: "Shivam", marks: 85)
]


let sortedStudents = students.sorted { (student1, student2) -> Bool in
    return student1.marks > student2.marks
}

print("----- R1: SORTED STUDENTS -----")

for student in sortedStudents {
    print(student.name, "-", student.marks)
}




func performOperation(completion: () -> Void) {
    print("\nOperation started...")

    
    print("Operation is running...")

    
    completion()
}

print("\n----- R2: COMPLETION CLOSURE -----")

performOperation {
    print("Operation completed successfully!")
}




let numbers = [10, 20, 30, 40, 50]


let evenNumbers = numbers.filter {
    $0 % 2 == 0
}

print("\n----- R3: TRAILING CLOSURE -----")
print("Even Numbers:", evenNumbers)


let evenNumbersExplicit = numbers.filter { number in
    return number % 2 == 0
}

print("Even Numbers with explicit names:", evenNumbersExplicit)




func createCounter() -> () -> Int {
    var count = 0


    let counter = {
        count += 1
        return count
    }

    return counter
}

print("\n----- R4: COUNTER CLOSURE -----")

let counter = createCounter()

print("Count:", counter())
print("Count:", counter())
print("Count:", counter())




class StudentManager {
    var studentName = "Shivam"

    var showMessage: (() -> Void)?

    func setupClosure() {
        
        showMessage = { [weak self] in
            guard let self = self else {
                print("StudentManager object no longer exists.")
                return
            }

            print("Welcome,", self.studentName)
        }
    }

    deinit {
        print("StudentManager object is removed from memory.")
    }
}

print("\n----- R5: WEAK SELF -----")

var manager: StudentManager? = StudentManager()

manager?.setupClosure()
manager?.showMessage?()


manager = nil




func retryOperation(maxAttempts: Int, operation: () -> Bool) {
    for attempt in 1...maxAttempts {
        print("\nAttempt:", attempt)

        if operation() {
            print("Operation successful!")
            return
        } else {
            print("Operation failed.")
        }
    }

    print("Operation failed after all attempts.")
}

print("\n----- OPTIONAL: RETRY HELPER -----")

var attemptCount = 0

retryOperation(maxAttempts: 3) {
    attemptCount += 1

    
    return attemptCount == 3
}
