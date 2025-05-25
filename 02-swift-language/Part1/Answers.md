# Answers

### 1. Why does Swift introduce both `let` and `var`? When should you use each?

- `let` declares a **constant**: once set, the value cannot change.
- `var` declares a **variable**: its value can be changed after initialization.
- **Use `let` by default** for safety and immutability; only use `var` if mutation is required.

---

### 2. Is type annotation necessary in Swift? When is it helpful?

- **Not always necessary** due to type inference.
- Type annotation is helpful when:
  - Clarity is needed (especially with complex or ambiguous types)
  - The type should not change even if the initializer changes
  - Declaring function parameters and return types

Example:
```swift
let score: Int = 100 // Explicit
let name = "Alice"   // Inferred


⸻

3. What are the key differences between arrays, sets, and dictionaries?

Type	Ordered	Duplicates	Access Pattern
Array	✅ Yes	✅ Yes	Index-based (array[0])
Set	❌ No	❌ No	Fast membership test (contains)
Dictionary	❌ No	🔁 Keys must be unique	Key-value access (dict["key"])

	•	Use array for ordered data, set for uniqueness, and dictionary for key-value pairs.

⸻

4. How does Swift handle string mutability? Difference between String and Character?
	•	String is a value type, mutable only when declared with var.
	•	Character represents a single Unicode scalar (like a letter or emoji).
	•	You build String values by combining Character values.

Example:

let char: Character = "A"
var greeting = "Hello"
greeting += " World" // Only possible because it's declared with `var`


⸻

5. What’s the difference between while and repeat-while? When use repeat-while?
	•	while evaluates the condition before entering the loop.
	•	repeat-while evaluates the condition after executing the loop body once.

Use repeat-while when you want the loop to run at least once, such as in input validation or prompting.

⸻

6. How does Swift support function overloading?

Swift allows multiple functions with the same name as long as their parameter types, labels, or return types differ.

Example:

func greet() {
    print("Hello")
}

func greet(name: String) {
    print("Hello, \(name)")
}


⸻

7. How does Swift handle captured values in closures? What happens if a closure strongly captures self?
	•	Swift captures values by reference or value, depending on the context.
	•	If a closure strongly captures self, it can lead to retain cycles in reference types (like classes).
	•	To avoid this, use a capture list:

[weak self] or [unowned self]



Example:

myClosure = { [weak self] in
    self?.doSomething()
}


⸻

8. What’s the difference between raw values and associated values in enums?
	•	Raw values are predefined values (like Int, String) assigned to enum cases.
	•	Associated values allow enum cases to store additional custom data.

Use associated values when enum cases carry context-specific data.

Example:

enum Result {
    case success(data: String)
    case failure(error: Error)
}

This is more powerful than:

enum StatusCode: Int {
    case success = 200
    case failure = 500
}
