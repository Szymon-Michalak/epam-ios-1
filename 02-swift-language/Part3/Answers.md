# Answers – Self-Control Questions (Swift Basics – Part 3)

---

## 🔍 Optionals

**Q: What are optionals?**
Optionals represent a variable that can hold either a value or `nil`. They’re declared using `?` and are used to safely handle the absence of a value.

**Q: How do you define an optional variable?**

```swift
var name: String? = "John"
var age: Int? = nil
```

**Q: What are the ways to unwrap an optional?**

* Optional binding: `if let`, `guard let`
* Nil coalescing: `??`
* Force unwrapping: `!`
* Optional chaining

**Q: How does optional chaining work and why is it beneficial?**
It safely accesses properties/methods of optional values. If any part in the chain is `nil`, the whole chain returns `nil`. It reduces the need for nested `if let`.

**Q: What is the difference between optional binding and forced unwrapping?**

* Optional binding safely checks and unwraps the value.
* Forced unwrapping directly accesses the value and crashes if `nil`.

**Q: Can you do multiple optional bindings in a single line?**
Yes:

```swift
if let a = optionalA, let b = optionalB {
    // use a and b
}
```

**Q: What is an implicitly unwrapped optional?**
An optional declared with `!` that behaves like a normal value but can still be `nil`. Often used in IBOutlets.

```swift
var label: UILabel! = UILabel()
```

**Q: What should you be cautious of when using forced unwrapping?**
Only use when you're certain the optional contains a value. Otherwise, it can cause runtime crashes.

---

## 🔧 Extensions

**Q: What is an extension and what benefits does it provide?**
An extension adds functionality to an existing type without modifying its source. It promotes modularity, clarity, and code reuse.

**Q: How do you define an extension?**

```swift
extension Int {
    var squared: Int { return self * self }
}
```

**Q: What can be added to a type using an extension? Can we add stored properties?**
You can add:

* Computed properties
* Methods
* Initializers (convenience only)
* Subscripts
* Nested types
* Protocol conformance

You **cannot** add stored properties.

**Q: How do protocol extensions differ from regular extensions?**
Protocol extensions add behavior to all conforming types, not just a specific type.

**Q: Can extensions declare an entity with a higher access level than the type itself?**
No, extensions can’t elevate the visibility beyond the original type’s level.

**Q: Can you override methods of a class in its extension?**
No, you can only add methods. Overriding is not allowed in extensions.

**Q: Can we add something to types we don't own?**
Yes, via extensions — but **you can’t** add stored properties.

---

## 🧬 Protocols

**Q: What is a protocol? How do you define one? Benefits of using it?**
A protocol defines a blueprint of methods and properties. Benefits:

* Flexibility
* Abstraction
* Polymorphism

```swift
protocol Drivable {
    func drive()
}
```

**Q: What can we declare in a protocol and how?**
Methods, computed properties, initializers, associated types.

**Q: Can protocol inherit another protocol?**
Yes. Protocols can inherit multiple other protocols.

**Q: Can structures, classes, and enums conform to protocols?**
Yes.

**Q: How many protocols can a type implement?**
Multiple.

**Q: Can protocols have a default implementation?**
Yes, via protocol extensions.

**Q: What are associated types?**
They act as placeholders in a protocol for a concrete type that’s defined by conforming types.

---

## ⚠️ Error Handling

**Q: How do you typically handle errors in iOS apps?**
Using `do-catch`, `try?`, `try!`, or `Result` types.

**Q: Why is error handling important?**
To prevent crashes and allow graceful recovery from failures.

**Q: What is a `do-catch` statement?**
A block that handles `throw`ing functions:

```swift
do {
    try riskyFunction()
} catch {
    print("Error")
}
```

**Q: What does the `throws` keyword do?**
Marks a function that can throw an error.

**Q: What is the `Result` type and how is it used?**
An enum with `.success` and `.failure`. Used for clearer error handling.

```swift
let result: Result<String, Error> = .success("OK")
```

---

## 🔀 Type Casting

**Q: Can you explain the difference between `as`, `as?`, and `as!`?**

* `as`: upcast (always safe)
* `as?`: optional downcast
* `as!`: forced downcast (crashes if fails)

**Q: What is the purpose of the `is` keyword?**
Checks if an instance is of a specific type.

**Q: What should you be cautious of when using force casting (`as!`)?**
Use only when absolutely sure — otherwise, risk of crash.

**Q: Why is type casting important when working with different data types?**
It enables polymorphism and safe conversion between types.

---

## 📆 Nested Types

**Q: What are nested types and what are their benefits?**
Types declared inside other types. Help with code organization, encapsulation, and clarity.

**Q: How do you declare a nested type within a class or structure?**

```swift
struct Game {
    enum Difficulty {
        case easy, hard
    }
}
```

**Q: How do you access a nested type from outside its enclosing type?**
`Game.Difficulty`

**Q: Can nested types be extended? If so, how?**
Yes:

```swift
extension Game.Difficulty {
    func description() -> String { ... }
}
```

---

## 📉 Subscripts

**Q: What are subscripts and what are the benefits of using them?**
Syntax sugar for accessing elements — improves readability and abstraction.

**Q: How can you define a subscript?**

```swift
subscript(index: Int) -> Int {
    return index * 2
}
```

**Q: What types of parameters can subscripts accept? Can they take multiple parameters?**
Yes — any type, and multiple parameters.

**Q: Can subscripts return multiple values?**
Yes, by returning tuples.

---

## 🧠 Higher Order Functions

**Q: What are the advantages of using higher-order functions?**

* Concise syntax
* Reduced boilerplate
* Functional abstraction

**Q: What is the `map` function and what does it do?**
Transforms each element in a collection.

**Q: Explain the difference between `flatMap` and `compactMap`.**

* `flatMap`: flattens nested collections.
* `compactMap`: removes `nil` values while mapping.

**Q: How can you use `reduce` to aggregate array elements into a single computed result?**

```swift
let total = [1, 2, 3].reduce(0, +)
```

**Q: Functions `filter(_)`, `contains(where:)`, `forEach(_)`, `sort(by:)`, `first(where:)`, `last(where:)`**

* `filter`: returns elements matching a condition
* `contains`: checks if any element matches
* `forEach`: performs an action on each element
* `sort`: sorts the array
* `first/last(where:)`: retrieves the first/last matching element

---

*End of answers for Part 3.*
