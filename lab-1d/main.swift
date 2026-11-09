
import Foundation



let studentMarks = [
    101: 85,
    102: 90,
    103: 75,
    104: 60,
    105: 95
]



func findMarks(id: Int) -> Int? {

    return studentMarks[id]

}




print("----- IF LET -----")

let marks = findMarks(id: 101)

if let studentMarks = marks {
    print("Student Marks:", studentMarks)
}
else {
    print("Student not found.")
}




print("\n----- GUARD LET -----")

func displayMarks(id: Int) {

    guard let marks = findMarks(id: id) else {
        print("Student ID not found!")
        return
    }

    print("Marks of Student", id, ":", marks)
}

displayMarks(id: 102)
displayMarks(id: 110)


print("\n----- OPTIONAL CHAINING -----")

let studentNames: [Int: String] = [
    101: "Shivam",
    102: "Rahul",
    103: "Aman"
]

let studentName = studentNames[101]?.uppercased()

print("Student Name:", studentName ?? "Name not found")



print("\n----- NIL COALESCING -----")

let unknownMarks = findMarks(id: 110)

let finalMarks = unknownMarks ?? 0

print("Student Marks:", finalMarks)


print("\n----- MISSING DICTIONARY KEY -----")

let searchID = 120

if let marks = studentMarks[searchID] {
    print("Marks:", marks)
}
else {
    print("No student found with ID:", searchID)
}




print("\n----- EMPTY TEXT FIELD -----")

var studentInput = ""

if studentInput.isEmpty {
    print("Please enter a student ID.")
}
else {
    print("Entered Student ID:", studentInput)
}


studentInput = "101"

if studentInput.isEmpty {
    print("Please enter a student ID.")
}
else {
    print("Entered Student ID:", studentInput)
}


print("\n----- SAFE OPTIONAL HANDLING -----")

let safeMarks = findMarks(id: 103)

if let value = safeMarks {
    print("Marks:", value)
}
else {
    print("Marks are unavailable.")
}




print("\n----- STUDENT PROFILE -----")

struct StudentProfile {

    var name: String
    var address: String?
    var phone: String?

}

let profile = StudentProfile(
    name: "Shivam Gautam",
    address: nil,
    phone: "9876543210"
)

print("Name:", profile.name)
print("Address:", profile.address ?? "Address not provided")
print("Phone:", profile.phone ?? "Phone not provided")



Conclusion – Optionals in Swift

In this assignment, I learned how to handle optional values safely in Swift without using force unwrapping.

Optional Return Type: Created a function to search student marks using their ID. The function returns an optional integer.

If Let: Used to safely check and unwrap optional values.

Guard Let: Used to check whether a value exists before continuing program execution.

Optional Chaining: Used to safely access methods and properties of optional values.

Nil-Coalescing Operator: Used to provide a default value when an optional value is nil.

Missing Values: Handled missing dictionary keys and empty text fields without causing program crashes.

Student Profile: Created a StudentProfile structure with a required name and optional address and phone number.

Conclusion: Optionals help prevent unexpected nil values and make Swift programs safer and more reliable.
