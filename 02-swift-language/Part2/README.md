# Swift Basics – Part 2

This module explores essential object-oriented programming concepts in Swift, with a focus on **structures**, **classes**, and their associated behaviors. You'll deepen your understanding of memory management, encapsulation, initialization, and inheritance — all crucial for building scalable and maintainable Swift applications.

---

## 🧠 Overview

- Structures vs Classes
- Properties (stored, computed, lazy, observers)
- Methods (instance, type, overloading, mutating)
- Inheritance and subclassing
- Initialization (designated, convenience, failable)
- Deinitialization

---

## 🎯 Learning Objectives

By the end of this part, you should be able to:

- [x] Differentiate between structures and classes, and choose the appropriate one for a given task
- [x] Use stored and computed properties, property observers, and lazy initialization
- [x] Define and use instance and type methods to encapsulate behavior
- [x] Apply inheritance to promote code reuse and understand method overriding and access control
- [x] Understand the complete lifecycle of a Swift type using initializers and deinitializers

---

## 📎 Self-Learning Resources

### 📌 Structures vs Classes
- [Swift Docs – Classes and Structures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)
- [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
- [Class vs Struct – Medium](https://medium.com/@muhammad.cse11/class-vs-struct-in-swift-dcc7ad6f5a99)

### 📌 Properties
- [Swift Docs – Properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties)
- [Computed Property vs Function](https://www.donnywals.com/deciding-between-a-computed-property-and-a-function-in-swift/)

### 📌 Methods & Subscripts
- [Swift Docs – Methods](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/methods)
- [Swift Docs – Subscripts](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts)

### 📌 Inheritance
- [Swift Docs – Inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance)
- [Mastering Inheritance – Medium](https://medium.com/@sunnygulatiios/mastering-swift-inheritance-a-comprehensive-guide-for-efficient-code-reuse-e27b84833c95)
- [Swift Inheritance – GeeksForGeeks](https://www.geeksforgeeks.org/swift-inheritance/)

### 📌 Initialization
- [Swift Docs – Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization)
- [Initializers in Swift – Medium](https://abhimuralidharan.medium.com/initializers-in-swift-part-1-intro-convenience-and-designated-intializers-9adf5632fb52)
- [Initialization In-Depth – Kodeco](https://www.kodeco.com/1220-swift-tutorial-initialization-in-depth-part-1-2)

### 📌 Deinitialization
- [Swift Docs – Deinitialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/deinitialization)
- [Deinit – TutorialsPoint](https://www.tutorialspoint.com/swift/swift_deinitialization.htm)

---

## ❓ Questions for Self-Control

Questions are grouped by topic. Use these to test your understanding:

### 🧱 Structures and Classes
- What is the difference between a struct and a class?
- How do structures and classes handle memory differently?
- When should you use a struct instead of a class, and vice versa?
- What does it mean that structures are value types and classes are reference types?
- How do you define a struct and a class?
- What is a mutating method, and when do you need it in a struct?
- Can structs conform to protocols? If so, how?
- What is memberwise initialization in structs?
- How does Swift handle inheritance with structs and classes?

### 🧬 Properties
- What are stored properties and computed properties?
- What is the difference between `let` and `var` properties in a struct?
- What are lazy properties, and when would you use them?
- What are property observers, and how do `willSet` and `didSet` work?
- Can computed properties have property observers? Why or why not?
- What is the difference between `static` and `class` properties?

### 🔁 Methods
- What is the difference between instance methods and type methods?
- How do you define a method in Swift?
- What is a mutating method, and why is it required in a struct?
- Can structs have class (type) methods? If so, how?
- How do `self` and `Self` differ in method definitions?
- What is method overloading, and how does it work in Swift?
- What are default parameter values, and how are they useful?
- Can methods return multiple values? If so, how?

### 🧬 Inheritance
- What is inheritance, and how does it work in Swift?
- How does method overriding work in Swift?
- What is the `super` keyword, and how is it used?
- How do you prevent a class from being subclassed?
- Can a subclass access private properties or methods of a superclass?
- What are `final` methods and `final` classes, and when should they be used?
- How does Swift handle multiple inheritance?
- What is polymorphism, and how does it apply to Swift classes?

### 🧩 Initialization
- What is an initializer in Swift?
- How does Swift enforce that all properties must be initialized?
- What is the difference between a designated initializer and a convenience initializer?
- What are failable initializers, and when should you use them?
- How do default values in property declarations affect initializers?
- What is a required initializer, and when is it useful?
- What is `init?` vs `init!`, and when should each be used?
- How do subclasses handle initialization when inheriting from a superclass?
- Can structs have custom initializers? If so, how?

### ♻️ Deinitialization
- What is a deinitializer (`deinit`), and when is it called?
- Can a struct have a deinitializer? Why or why not?
- What is the purpose of `deinit`, and how does it help manage resources?
- Can a class call its `deinit` method manually?
- How does `deinit` work in an inheritance chain?

[Answers](./Answers.md)
---

_This module builds the foundation for robust object modeling in Swift. Mastery here will prepare you for working with SwiftUI, networking models, and beyond._