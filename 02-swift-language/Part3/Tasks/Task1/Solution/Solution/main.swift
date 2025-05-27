/// Task 1: Library Management System
///
///
/// This task involves designing a simple Library Management System to practice:
/// - Protocols
/// - Extensions
/// - Optional Chaining
/// - Error Handling
///
/// ### Steps:
///
/// 1. **Define a `Borrowable` protocol** with:
///    - Properties:
///      - `borrowDate: Date?` — Optional date when the item was borrowed
///      - `returnDate: Date?` — Optional expected return date
///      - `isBorrowed: Bool` — Indicates current borrow status
///    - Method:
///      - `checkIn()` — Handles item return, resets borrow state
///
/// 2. **Provide a default implementation** of `Borrowable` via extension:
///    - `isOverdue() -> Bool` — Returns true if the item is overdue
///    - `checkIn()` — Resets `borrowDate`, `returnDate`, and `isBorrowed`
///
/// 3. **Create Classes**:
///    - `Item` class (base):
///      - Properties: `id: String`, `title: String`, `author: String`
///    - `Book` class (subclass):
///      - Inherits from `Item`
///      - Conforms to `Borrowable`
///
/// 4. **Define an `enum LibraryError`** with cases:
///    - `itemNotFound` — Item with specified ID doesn't exist
///    - `itemNotBorrowable` — Item doesn't conform to `Borrowable`
///    - `alreadyBorrowed` — Item is already checked out
///
/// 5. **Create a `Library` class** to manage items:
///    - Property: Dictionary of items keyed by ID
///    - `addBook(_:)` — Adds a `Book` to the collection
///    - `borrowItem(by:) throws -> Item` — Borrows an item by ID:
///      - Use optional chaining to handle item lookup and borrowable conformance
///      - Use `throws` for appropriate error handling (e.g. item not found, already borrowed)
///
/// 6. **Apply Optional Chaining**:
///    - In `borrowItem(by:)`, safely unwrap and verify protocol conformance with minimal risk of runtime errors
///
///

import Foundation

protocol Borrowable: AnyObject {
    var borrowDate: Date? { get set }
    var returnDate: Date? { get set }
    var isBorrowed: Bool { get set }

    func checkIn()
}

extension Borrowable {
    func isOverdue() -> Bool {
        guard let returnDate else { return false }
        return returnDate.timeIntervalSinceNow < 0
    }

    func checkIn() {
        borrowDate = nil
        returnDate = nil
        isBorrowed = false
    }
}

class Item {
    let id: String
    let title: String
    let author: String

    init(id: String, title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
}

class Book: Item, Borrowable {
    var borrowDate: Date?
    var returnDate: Date?
    var isBorrowed: Bool = false
}

enum LibraryError: Error {
    case itemNotFound
    case itemNotBorrowable
    case alreadyBorrowed
}

class Library {
    var items: [String: Item]

    init(items: [String : Item]) {
        self.items = items
    }

    @discardableResult
    func addBook(_ book: Book) -> Bool {
        if items[book.id] != nil { return false }
        items[book.id] = book
        return true
    }

    func borrowItem(by id: String) throws(LibraryError) -> Item {
        guard let item = items[id] else {
            throw .itemNotFound
        }
        guard var borrowable = item as? Borrowable else {
            throw .itemNotBorrowable
        }
        if borrowable.isBorrowed {
            throw .alreadyBorrowed
        }

        borrowable.isBorrowed = true
        borrowable.borrowDate = Date()
        borrowable.returnDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())

        return item
    }
}

// Create a few books
let book1 = Book(id: "001", title: "1984", author: "George Orwell")
let book2 = Book(id: "002", title: "Brave New World", author: "Aldous Huxley")
let book3 = Book(id: "003", title: "Fahrenheit 451", author: "Ray Bradbury")

// Initialize library
let library = Library(items: [:])

// Add books
library.addBook(book1)
library.addBook(book2)
library.addBook(book3)

// Try borrowing book1 (available)
do {
    let item = try library.borrowItem(by: "001")
    print("✅ Borrowed: \(item.title)")
} catch {
    print("❌ Failed to borrow book1: \(error)")
}

// Try borrowing book3 (already borrowed)
do {
    let item = try library.borrowItem(by: "003")
    print("✅ Borrowed: \(item.title)")
} catch {
    print("❌ Failed to borrow book3: \(error)")
}

// Try borrowing non-existent book
do {
    let item = try library.borrowItem(by: "999")
    print("✅ Borrowed: \(item.title)")
} catch {
    print("❌ Failed to borrow book999: \(error)")
}

// Create a book and library
let book = Book(id: "007", title: "The Pragmatic Programmer", author: "Andy Hunt")
let library2 = Library(items: [:])
library2.addBook(book)

// Check initial state
print("📖 Initial isBorrowed: \(book.isBorrowed)")

// Borrow it
do {
    let borrowedItem = try library2.borrowItem(by: "007")
    print("✅ Borrowed: \(borrowedItem.title)")
} catch {
    print("❌ Failed to borrow: \(error)")
}

// Check state again
print("📚 After borrowing, isBorrowed: \(book.isBorrowed)")
