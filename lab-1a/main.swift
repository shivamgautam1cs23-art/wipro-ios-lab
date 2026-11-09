
import Foundation

let name = "Shivam Gautam"
let rollNo = 101

var sub1 = 85
var sub2 = 90
var sub3 = 75
var sub4 = 60
var sub5 = 95

var attendance = 85


let total = sub1 + sub2 + sub3 + sub4 + sub5
let average = Double(total) / 5
let percentage = Double(total) / 500 * 100

let passMarks = 40

var result = "Pass"

if sub1 < passMarks || sub2 < passMarks ||
   sub3 < passMarks || sub4 < passMarks ||
   sub5 < passMarks {
    result = "Fail"
}

let a = 10
let b = 5

print("Addition:", a + b)
print("Subtraction:", a - b)
print("Multiplication:", a * b)
print("Division:", a / b)
print("Remainder:", a % b)



print("Equal:", a == b)
print("Not Equal:", a != b)
print("Greater Than:", a > b)
print("Less Than:", a < b)
print("Greater Than or Equal:", a >= b)
print("Less Than or Equal:", a <= b)


let x = 10
let y = 20

print("AND:", x > 5 && y > 10)
print("OR:", x > 15 || y > 10)
print("NOT:", !(x > y))



var number = 10

number += 5
print("After += :", number)

number -= 2
print("After -= :", number)

number *= 2
print("After *= :", number)

number /= 2
print("After /= :", number)


var grade: String? = nil

let finalGrade = grade ?? "Not Assigned"

print("Grade:", finalGrade)


var studentGrade = ""

if result == "Fail" {
    studentGrade = "F"
}
else if percentage >= 90 {
    studentGrade = "A+"
}
else if percentage >= 80 {
    studentGrade = "A"
}
else if percentage >= 70 {
    studentGrade = "B"
}
else if percentage >= 60 {
    studentGrade = "C"
}
else if percentage >= 50 {
    studentGrade = "D"
}
else {
    studentGrade = "F"
}



switch studentGrade {
case "A+":
    print("Excellent")
case "A":
    print("Very Good")
case "B":
    print("Good")
case "C":
    print("Average")
case "D":
    print("Needs Improvement")
default:
    print("Failed")
}


print("\nBoundary Value Testing")


print("Mark 0:", 0 >= 0 && 0 <= 100)
print("Mark 100:", 100 >= 0 && 100 <= 100)
print("Failing Mark 35:", 35 < passMarks)
print("Invalid Mark 110:", 110 >= 0 && 110 <= 100)



print("Valid Attendance:", attendance >= 0 && attendance <= 100)
print("Invalid Attendance 110:", 110 >= 0 && 110 <= 100)
print("Invalid Attendance -5:", -5 >= 0 && -5 <= 100)



print("\n========== STUDENT RESULT ==========")

print("Name:", name)
print("Roll Number:", rollNo)

print("Subject 1:", sub1)
print("Subject 2:", sub2)
print("Subject 3:", sub3)
print("Subject 4:", sub4)
print("Subject 5:", sub5)

print("------------------------------------")

print("Total Marks:", total, "/ 500")
print("Average:", average)
print("Percentage:", percentage, "%")
print("Attendance:", attendance, "%")
print("Grade:", studentGrade)

if result == "Pass" && attendance >= 75 {
    print("Final Result: PASS")
}
else {
    print("Final Result: FAIL")
}

print("====================================")

