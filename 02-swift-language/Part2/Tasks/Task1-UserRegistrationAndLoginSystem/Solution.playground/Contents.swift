/// Develops a simple user registration and login system using structures and classes.
///
/// This system demonstrates Swift fundamentals such as properties, methods, initialization,
/// inheritance, and deinitialization. It allows users to register, log in, and be managed by an administrator.
///
/// ### Steps:
///
/// 1. **Define a `User` struct** with the following properties:
///    - `username: String` — Unique identifier for the user.
///    - `email: String` — Required for user identification.
///    - `password: String` — Securely stored (e.g., hashed for simplicity).
///
/// 2. **Create a `UserManager` class** with:
///    - A stored property `users: [String: User]` to hold registered users.
///    - A method `registerUser(username:email:password:) -> Bool` to register new users.
///    - A method `login(username:password:) -> Bool` to verify credentials.
///    - A method `removeUser(username:) -> Bool` to delete users.
///    - A computed property `userCount: Int` that returns the number of registered users.
///
/// 3. **Implement inheritance** by defining an `AdminUser` class that inherits from `UserManager`:
///    - Adds a method `listAllUsers() -> [String]` to return all registered usernames.
///
/// 4. **Use initializers** to properly configure instances upon creation.
///
/// 5. **Use deinitialization** in `AdminUser` to print a message when the instance is deallocated.

struct User {
    let username: String
    let email: String
    let password: String // stored in plaintext for simplicity, in production it would be salted and hashed
}

class UserManager {
    private(set) var users: [String: User]

    var userCount: Int {
        users.count
    }

    init(users: [String : User]) {
        self.users = users
    }

    @discardableResult
    func registerUser(username: String, email: String, password: String) -> Bool {
        if users[username] != nil { return false }

        let newUser = User(username: username, email: email, password: password)
        users[username] = newUser
        return true
    }

    func login(username: String, password: String) -> Bool {
        if let user = users[username] {
            return user.password == password
        }

        return false
    }

    @discardableResult
    func removeUser(username: String) -> Bool {
        guard let _ = users.removeValue(forKey: username) else { return false }
        return true
    }
}

class AdminUser: UserManager {
    deinit {
        print("AdminUser deallocated")
    }

    func listAllUsers() -> [String] {
        users.keys.sorted()
    }
}
