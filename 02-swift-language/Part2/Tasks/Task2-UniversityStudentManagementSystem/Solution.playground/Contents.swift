/// Task 2: University Student Management System
///
/// ### Steps to Implement:
///
/// 1. **Create a `Person` base class** with:
///    - Properties: `name: String`, `age: Int`
///    - A designated initializer
///    - A failable initializer (fails if age < 16)
///
/// 2. **Create a `Student` subclass** of `Person` with:
///    - Additional properties: `studentID: String`, `major: String`
///    - A required initializer
///    - A convenience initializer
///
/// 3. **Create a `Professor` subclass** of `Person` with:
///    - Additional property: `faculty: String`
///    - A custom initializer that calls the superclass initializer
///
/// 4. **Create a `University` struct** with:
///    - Properties: `name: String`, `location: String`
///    - Utilizes the default memberwise initializer provided by Swift
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
}

class Student: Person {
    var studentID: String
    var major: String

    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
    }

    convenience init(name: String, age: Int, studentID: String) {
        self.init(name: name, age: age, studentID: studentID, major: "Computer Science")
    }
}

class Professor: Person {
    var faculty: String

    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
    }
}

struct University {
    let name: String
    let location: String
}
