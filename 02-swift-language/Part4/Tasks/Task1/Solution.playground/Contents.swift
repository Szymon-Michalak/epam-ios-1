/// Task 1: Generic Stack
///
///
/// This task involves implementing a generic stack data structure in Swift using a type placeholder `T`.
/// The stack should support basic operations such as push, pop, size, and string representation.
///
/// ### Steps:
///
/// 1. **Create a generic class** `Stack<T>`:
///    - Uses a type placeholder `T` to store elements of any type.
///
/// 2. **Implement the following methods**:
///    - `push(_ element: T)` — Adds an element to the top of the stack
///    - `pop() -> T?` — Removes and returns the top element; returns `nil` if empty
///    - `size() -> Int` — Returns the number of elements currently in the stack
///
/// 3. **Add a method** `printStackContents() -> String`:
///    - Returns a string representation of the elements in the stack
///


class Stack<T> {
    private var items: [T] = []

    func push(_ element: T) {
        items.append(element)
    }

    func pop() -> T? {
        items.popLast()
    }

    func size() -> Int {
        items.count
    }

    func printStackContents() -> String {
        items.description
    }
}
