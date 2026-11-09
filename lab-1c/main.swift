
import Foundation



var courses = ["Swift", "Python", "Java", "C++", "Web Development"]

print("----- ARRAY OPERATIONS -----")

print("All Courses:", courses)

courses.append("Data Science")
print("After Adding:", courses)


courses.remove(at: 2)
print("After Removing:", courses)


courses.sort()
print("Sorted Courses:", courses)

let filteredCourses = courses.filter {
    $0.lowercased().contains("a")
}
print("Filtered Courses:", filteredCourses)


let searchCourse = "Swift"

if courses.contains(searchCourse) {
    print(searchCourse, "course is available.")
}
else {
    print(searchCourse, "course is not available.")
}



print("\n----- SET OPERATIONS -----")

let studentIDs = [101, 102, 103, 101, 104, 102, 105, 103]

let uniqueIDs = Set(studentIDs)

print("Original Student IDs:", studentIDs)
print("Unique Student IDs:", uniqueIDs.sorted())
print("Unique Student Count:", uniqueIDs.count)



print("\n----- DICTIONARY OPERATIONS -----")

let studentMarks = [
    101: 85,
    102: 92,
    103: 76,
    104: 65,
    105: 95
]


if let topper = studentMarks.max(by: { $0.value < $1.value }) {
    print("Topper ID:", topper.key)
    print("Topper Marks:", topper.value)
}


let threshold = 80

print("Students scoring below", threshold, "marks:")

for (id, marks) in studentMarks {
    if marks < threshold {
        print("Student ID:", id, "Marks:", marks)
    }
}


print("\n----- TASK PRIORITY -----")

enum Priority {
    case low
    case medium
    case high
    case urgent
}

let taskPriority = Priority.high

switch taskPriority {
case .low:
    print("Priority: Low - Complete when free.")
case .medium:
    print("Priority: Medium - Complete soon.")
case .high:
    print("Priority: High - Complete as early as possible.")
case .urgent:
    print("Priority: Urgent - Complete immediately.")
}


print("\n----- API RESULT -----")

enum APIResult {
    case success(String)
    case failure(String)
}

let result = APIResult.success("Data loaded successfully")

switch result {
case .success(let message):
    print("Success:", message)

case .failure(let error):
    print("Error:", error)
}


Conclusion – Swift Collections and Enumerations

In this assignment, I learned how to use different collections and enumerations in Swift.

1. Array: Used to store course names and perform operations like adding, removing, sorting, filtering and searching.

2. Set: Used to remove duplicate student IDs and calculate the total number of unique students.

3. Dictionary: Used to store student IDs with their marks, find the topper and identify students scoring below a particular threshold.

4. Enum: Used to define different task priorities and display suitable messages using a switch statement.

5. Associated Values: Used with an APIResult enum to store success messages and error messages.

Conclusion: Arrays, Sets, Dictionaries and Enums help organize and manage data efficiently in Swift. Each collection has its own purpose depending on the requirements of the program.
