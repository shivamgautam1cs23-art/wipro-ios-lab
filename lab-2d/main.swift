
import Foundation


enum ValidationError: Error {
    case emptyName
    case invalidMark
    case invalidID
}



struct Student {
    let id: Int
    let name: String
    let mark: Double
}



func registerStudent(id: Int, name: String, mark: Double) throws -> Student {

    
    if name.trimmingCharacters(in: .whitespaces).isEmpty {
        throw ValidationError.emptyName
    }

    
    if id <= 0 {
        throw ValidationError.invalidID
    }

   
    if mark < 0 || mark > 100 {
        throw ValidationError.invalidMark
    }

   
    return Student(id: id, name: name, mark: mark)
}



func displayRegistration(id: Int, name: String, mark: Double) {

    do {
        let student = try registerStudent(
            id: id,
            name: name,
            mark: mark
        )

        print("Registration Successful!")
        print("Student ID: \(student.id)")
        print("Student Name: \(student.name)")
        print("Student Mark: \(student.mark)")

    } catch ValidationError.emptyName {
        print("Error: Student name cannot be empty.")

    } catch ValidationError.invalidID {
        print("Error: Student ID must be greater than zero.")

    } catch ValidationError.invalidMark {
        print("Error: Marks must be between 0 and 100.")

    } catch {
        print("Unexpected error: \(error.localizedDescription)")
    }
}


print("----- Test Case 1 -----")
displayRegistration(id: 101, name: "Shivam", mark: 85)

print("\n----- Test Case 2 -----")
displayRegistration(id: 102, name: "", mark: 75)

print("\n----- Test Case 3 -----")
displayRegistration(id: 0, name: "Rahul", mark: 80)

print("\n----- Test Case 4 -----")
displayRegistration(id: 103, name: "Aman", mark: 120)

print("\n----- Test Case 5 -----")
displayRegistration(id: 104, name: "Priya", mark: 0)



func registerStudentOptional(
    id: Int,
    name: String,
    mark: Double
) -> Student? {

    guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
          id > 0,
          mark >= 0 && mark <= 100 else {
        return nil
    }

    return Student(id: id, name: name, mark: mark)
}




func registerStudentResult(
    id: Int,
    name: String,
    mark: Double
) -> Result<Student, ValidationError> {

    do {
        let student = try registerStudent(
            id: id,
            name: name,
            mark: mark
        )

        return .success(student)

    } catch let error as ValidationError {
        return .failure(error)

    } catch {
        return .failure(.invalidID)
    }
}


let result = registerStudentResult(
    id: 105,
    name: "Rohit",
    mark: 90
)

switch result {
case .success(let student):
    print("\nResult: Registration successful for \(student.name)")

case .failure(let error):
    switch error {
    case .emptyName:
        print("\nResult: Name cannot be empty.")
    case .invalidID:
        print("\nResult: Invalid student ID.")
    case .invalidMark:
        print("\nResult: Invalid marks.")
    }
}
