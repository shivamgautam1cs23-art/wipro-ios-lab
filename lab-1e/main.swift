
import Foundation


struct Course {
    var name: String
    var duration: Int
    var fees: Double
}




class CourseManager {

    var courseName: String

    init(courseName: String) {
        self.courseName = courseName
    }

    func displayCourse() {
        print("Course Name:", courseName)
    }
}




print("----- STRUCT COPY -----")

var course1 = Course(
    name: "Swift Programming",
    duration: 3,
    fees: 5000
)

var course2 = course1


course2.name = "Python Programming"
course2.fees = 6000

print("Original Course:", course1.name)
print("Copied Course:", course2.name)

print("Original Fees:", course1.fees)
print("Copied Fees:", course2.fees)




print("\n----- CLASS COPY -----")

var manager1 = CourseManager(courseName: "Swift Programming")

var manager2 = manager1


manager2.courseName = "Python Programming"

print("Manager 1 Course:", manager1.courseName)
print("Manager 2 Course:", manager2.courseName)




print("\n----- TEACHER AND CLASSROOM -----")

class Teacher {

    var name: String

    weak var classroom: Classroom?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Teacher object is released.")
    }
}

class Classroom {

    var roomName: String
    var teacher: Teacher?

    init(roomName: String) {
        self.roomName = roomName
    }

    deinit {
        print("Classroom object is released.")
    }
}

var teacher: Teacher? = Teacher(name: "Rahul")

var classroom: Classroom? = Classroom(roomName: "Room 101")

teacher?.classroom = classroom
classroom?.teacher = teacher

print("Teacher Name:", teacher?.name ?? "Not Available")
print("Classroom Name:", teacher?.classroom?.roomName ?? "Not Available")




print("\n----- STRONG REFERENCE CYCLE -----")

class Student {

    var name: String

    var completion: (() -> Void)?

    init(name: String) {
        self.name = name
        print("Student created:", name)
    }

    deinit {
        print("Student released:", name)
    }

    func startTask() {

        
        completion = { [weak self] in

            guard let self = self else {
                print("Student object no longer exists.")
                return
            }

            print(self.name, "completed the task.")
        }
    }
}

var student: Student? = Student(name: "Shivam")

student?.startTask()


student?.completion?()


student = nil



print("\n----- ARC DEMONSTRATION -----")

class Demo {

    var name: String

    init(name: String) {
        self.name = name
        print(name, "object created.")
    }

    deinit {
        print(name, "object destroyed.")
    }
}

var object1: Demo? = Demo(name: "Demo")

var object2 = object1

print("Two references are pointing to the same object.")

object1 = nil

print("First reference removed.")

object2 = nil

print("Second reference removed.")
