/// Task 2: Type Casting and Nested Types in a School System
///
/// This task focuses on implementing a school system using:
/// - Nested types
/// - Subscripts
/// - Categorization and access of school personnel
///
/// ### Steps:
///
/// 1. **Define a `School` struct** as the main container for the school system.
///
/// 2. **Create a nested enum `SchoolRole`** inside `School` with the following cases:
///    - `.student`
///    - `.teacher`
///    - `.administrator`
///
/// 3. **Create a nested class `Person`** within `School`:
///    - Properties:
///      - `name: String` — The person’s name
///      - `role: SchoolRole` — The person’s role in the school
///
/// 4. **Implement a subscript in `School`** to retrieve `[Person]` by `SchoolRole`:
///    - Enables accessing filtered groups (e.g., `school[.student]`) efficiently
///
/// 5. **Add a method `addPerson(_:)`** to `School`:
///    - Appends a `Person` to the internal list of people
///
/// 6. **Implement functions**:
///    - `countStudents(_ school: School) -> Int`
///    - `countTeachers(_ school: School) -> Int`
///    - `countAdministrators(_ school: School) -> Int`
///    - Each function uses the subscript to access and count people by their role
///

struct School {

    var people: [Person]

    enum SchoolRole {
        case student
        case teacher
        case administrator
    }

    class Person {
        let name: String
        var role: SchoolRole

        init(name: String, role: SchoolRole) {
            self.name = name
            self.role = role
        }
    }

    subscript(index: SchoolRole) -> [Person] {
        people.filter { $0.role == index }
    }

    @discardableResult
    mutating func addPerson(_ person: Person) -> Bool {
        if !people.contains(person) {
            people.append(person)
            return true
        }
        return false
    }
}

extension School.Person: Equatable {
    static func ==(lhs: School.Person, rhs: School.Person) -> Bool {
        lhs.name == rhs.name && lhs.role == rhs.role
    }
}

func countStudents(_ school: School) -> Int {
    school[.student].count
}

func countTeachers(_ school: School) -> Int {
    school[.teacher].count
}

func countAdministrators(_ school: School) -> Int {
    school[.administrator].count
}


var school = School(people: [])

let alice = School.Person(name: "Alice", role: .student)
let bob = School.Person(name: "Bob", role: .teacher)
let charlie = School.Person(name: "Charlie", role: .administrator)
let daniel = School.Person(name: "Daniel", role: .student)

// Add people
assert(school.addPerson(alice) == true)
assert(school.addPerson(bob) == true)
assert(school.addPerson(charlie) == true)
assert(school.addPerson(daniel) == true)

// Try to add duplicate
let duplicateAlice = School.Person(name: "Alice", role: .student)
assert(school.addPerson(duplicateAlice) == false, "Duplicate name should be rejected")

// Count by role
assert(countStudents(school) == 2, "Should be 2 students")
assert(countTeachers(school) == 1, "Should be 1 teacher")
assert(countAdministrators(school) == 1, "Should be 1 administrator")

// Subscript access
let students = school[.student]
assert(students.map(\.name).sorted() == ["Alice", "Daniel"], "Students should be Alice and Daniel")

let teachers = school[.teacher]
assert(teachers.first?.name == "Bob", "Teacher should be Bob")

print("✅ All school tests passed.")
