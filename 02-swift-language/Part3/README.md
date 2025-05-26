# Swift Basics – Part 3

This module introduces advanced Swift programming concepts fundamental to building robust and maintainable iOS applications. It covers handling optional values safely, structured error handling, type casting, and organizing code using nested types and subscripts. You'll also enhance code flexibility using extensions and protocols and explore powerful higher-order functions for transforming and aggregating collections.

---

## 🧠 Topics Covered

- Optionals & Optional Chaining
- Error Handling
- Type Casting
- Nested Types
- Subscripts
- Extensions
- Protocols
- Higher-Order Functions (`map`, `flatMap`, `compactMap`, `reduce`)

---

## 🎯 Learning Objectives

By the end of this module, you should be able to:

- ✅ Master optional types and techniques for safely unwrapping them
- ✅ Apply optional chaining for cleaner access to optional properties and methods
- ✅ Handle errors using `try`, `catch`, `throw`, and optional error propagation
- ✅ Use type casting to safely convert types within a class hierarchy
- ✅ Organize related types with nested type declarations
- ✅ Define and use subscripts to access data elements directly
- ✅ Extend types with new behavior using extensions and protocol extensions
- ✅ Build reusable and flexible APIs using protocols and associated types
- ✅ Transform data collections with higher-order functions (`map`, `flatMap`, etc.)

---

## 📎 Self-Learning Resources

### 📌 Optionals & Optional Chaining
- [Swift Docs – The Basics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
- [Complete Guide to Optionals – Hacking with Swift](https://www.hackingwithswift.com/articles/136/the-complete-guide-to-optionals-in-swift)
- [Optional Chaining – Swift Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/optionalchaining)

### 📌 Error Handling
- [Swift Docs – The Basics (Error Handling)](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)

### 📌 Type Casting
- [Type Casting – Swift Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting)

### 📌 Nested Types
- [Nested Types – Swift Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes)

### 📌 Subscripts
- [Subscripts – Swift Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts)

### 📌 Extensions
- [Extensions – Swift Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)

### 📌 Protocols
- [Protocols – Swift Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)

### 📌 Higher-Order Functions
- [Map, FlatMap, CompactMap – Hacking with Swift](https://www.hackingwithswift.com/articles/205/whats-the-difference-between-map-flatmap-and-compactmap)
- [LinkedIn – Higher Order Functions](https://www.linkedin.com/pulse/higher-order-functions-swift-omkar-raut-nvqqf/)
- [CompactMap Explained – UseYourLoaf](https://useyourloaf.com/blog/replacing-flatmap-with-compactmap/)

---

## ❓ Questions for Self-Control

### 🔍 Optionals
- What are optionals?
- How do you define an optional variable?
- What are the ways to unwrap an optional?
- How does optional chaining work and why is it beneficial?
- What is the difference between optional binding and forced unwrapping?
- Can you do multiple optional bindings in a single line? If so, how?
- What is an implicitly unwrapped optional?
- What should you be cautious of when using forced unwrapping?

### 🔧 Extensions
- What is an extension and what benefits does it provide?
- How do you define an extension?
- What can be added to a type using an extension? Can we add stored properties?
- How do protocol extensions differ from regular extensions?
- Can extensions declare an entity with a higher access level than the type itself?
- Can you override methods of a class in its extension?
- Can we add something to types we don't own?

### 🧬 Protocols
- What is a protocol? How do you define one? Benefits of using it?
- What can we declare in a protocol and how?
- Can protocols inherit from other protocols?
- Can structures, classes, and enums conform to protocols?
- How many protocols can a type implement?
- Can protocols have a default implementation?
- What are associated types?

### ⚠️ Error Handling
- How do you typically handle errors in iOS apps?
- Why is error handling important?
- What is a `do-catch` statement?
- What does the `throws` keyword do?
- What is the `Result` type and how is it used?

### 🔁 Type Casting
- Can you explain the difference between `as`, `as?`, and `as!`?
- What is the purpose of the `is` keyword?
- What should you be cautious of when using force casting (`as!`)?
- Why is type casting important when working with different data types?

### 📦 Nested Types
- What are nested types and what are their benefits?
- How do you declare a nested type within a class or struct?
- How do you access a nested type from outside its enclosing type?
- Can nested types be extended? If so, how?

### 🔢 Subscripts
- What are subscripts and what are the benefits of using them?
- How can you define a subscript?
- What types of parameters can subscripts accept? Can they take multiple parameters?
- Can subscripts return multiple values?

### 🧠 Higher Order Functions
- What are the advantages of using higher-order functions?
- What is the `map` function and what does it do?
- Explain the difference between `flatMap` and `compactMap`.
- How can you use `reduce` to aggregate array elements into a single computed result?
- What do functions like `filter(_:)`, `contains(where:)`, `forEach(_:)`, `sort(by:)`, `first(where:)`, and `last(where:)` do?

[Answers](./Answers.md)


---

This module expands your toolbox as a Swift developer, giving you the functional and protocol-oriented features necessary to build expressive, efficient, and safe Swift code.
