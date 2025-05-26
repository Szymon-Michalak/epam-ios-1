/// Task 3: University Student Management System – Extended Version
///
///
/// This task extends the previous University Student Management System to practice:
/// - Stored, computed, and lazy properties
/// - Static properties
/// - Weak references for memory management
/// - All types of initializers
///
/// ### Steps to Implement:
///
/// 1. **Modify the `Person` class**:
///    - Add a computed property `isAdult: Bool` that returns true if `age >= 18`
///    - Add a static property `minAgeForEnrollment = 16`
///    - Add a lazy property `profileDescription` that returns `"\(name) is \(age) years old."`
///
/// 2. **Modify the `Student` subclass**:
///    - Add a static property `studentCount` to track number of students
///    - Add a `weak` reference to an optional `Professor` named `advisor`
///    - Add a computed property `formattedID` that returns `"ID: \(studentID.uppercased())"`
///
/// 3. **Modify the `Professor` subclass**:
///    - Add a static property `professorCount` to track number of professors
///    - Add a computed property `fullTitle` to display a formatted title
///
/// 4. **Modify the `University` struct**:
///    - Add a computed property `description` that describes the university
///


class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init?(name: String, strictAge: Int) {
        guard strictAge >= 16 else { return nil }
        self.name = name
        self.age = strictAge
    }

    var isAdult: Bool {
        age >= 18
    }

    static let minAgeForEnrollment = 16

    lazy var profileDescription: String = "\(name) is \(age) years old."
}

class Student: Person {
    var studentID: String
    var major: String

    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
        Student.studentCount += 1
    }

    convenience init(name: String, age: Int, studentID: String) {
        self.init(name: name, age: age, studentID: studentID, major: "Computer Science")
    }

    deinit {
        if Student.studentCount > 0 { Student.studentCount -= 1 }
    }

    nonisolated(unsafe) static var studentCount: Int = 0

    weak var advisor: Professor?

    var formattedID: String {
        "ID: \(studentID.uppercased())"
    }
}

class Professor: Person {
    var faculty: String

    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
        Professor.professorCount += 1
    }

    deinit {
        if Professor.professorCount > 0 { Professor.professorCount -= 1 }
    }

    nonisolated(unsafe) static var professorCount: Int = 0

    var fullTitle: String {
        "\(name) of \(faculty)"
    }
}

struct University {
    let name: String
    let location: String

    var description: String {
        "\(name) in \(location)"
    }
}
