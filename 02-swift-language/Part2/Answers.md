# Answers – Self-Control Questions (Swift Basics – Part 2)

---

## 🧱 Structures and Classes

**Q: What is the difference between a struct and a class?**  
- Structs are **value types**; classes are **reference types**.
- Structs do **not support inheritance**; classes do.
- Structs get **memberwise initializers** by default.

**Q: How do structures and classes handle memory differently?**  
- Structs are **copied** when assigned or passed; each has its own memory.
- Classes are **referenced**; multiple variables can point to the same instance in memory.

**Q: When should you use a struct instead of a class, and vice versa?**  
- Use **structs** for lightweight, immutable, and independent data.
- Use **classes** when you need identity, shared state, or inheritance.

**Q: What does it mean that structures are value types and classes are reference types?**  
- Value types are **copied** on assignment.
- Reference types are **shared** and can be mutated through any reference.

**Q: How do you define a struct and a class?**
```swift
struct Point {
    var x: Int
    var y: Int
}

class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
}
````

**Q: What is a mutating method, and when do you need it in a struct?**

* A `mutating` method allows a struct to modify its own properties.

**Q: Can structs conform to protocols? If so, how?**

* Yes. Structs can adopt and conform to protocols like any other type:

```swift
struct Dog: CustomStringConvertible {
    var description: String { "A dog" }
}
```

**Q: What is memberwise initialization in structs?**

* Swift automatically provides an initializer for all stored properties unless you define one manually.

**Q: How does Swift handle inheritance with structs and classes?**

* **Only classes** support inheritance.
* Structs support **protocol conformance**, but not subclassing.

---

## 🧬 Properties

**Q: What are stored properties and computed properties?**

* **Stored**: hold actual values.
* **Computed**: calculate a value dynamically.

**Q: What is the difference between `let` and `var` properties in a struct?**

* `let` is immutable; its value can’t change.
* `var` is mutable if the instance is declared with `var`.

**Q: What are lazy properties, and when would you use them?**

* Initialized only on first access.
* Useful when initialization is expensive or depends on external state.

**Q: What are property observers, and how do `willSet` and `didSet` work?**

```swift
var score: Int = 0 {
    willSet { print("New value is \(newValue)") }
    didSet { print("Old value was \(oldValue)") }
}
```

**Q: Can computed properties have property observers? Why or why not?**

* No. Computed properties don’t store values, so there’s nothing to observe.

**Q: What is the difference between `static` and `class` properties?**

* Both define type-level properties.
* `class` allows **overriding in subclasses**, `static` does not.

---

## 🔁 Methods

**Q: What is the difference between instance methods and type methods?**

* Instance methods operate on specific instances.
* Type methods (marked with `static` or `class`) operate on the type itself.

**Q: How do you define a method in Swift?**

```swift
func greet() {
    print("Hello")
}
```

**Q: What is a mutating method, and why is it required in a struct?**

* Allows a struct to modify its own properties. Structs are value types, so mutation must be explicit.

**Q: Can structs have class (type) methods? If so, how?**

```swift
struct Tool {
    static func info() {
        print("Static method in a struct")
    }
}
```

**Q: How do `self` and `Self` differ in method definitions?**

* `self`: the current instance.
* `Self`: the type (class or struct) itself, often used in return types or generics.

**Q: What is method overloading, and how does it work in Swift?**

* Multiple methods with the same name but different parameters:

```swift
func printValue(_ val: Int) {}
func printValue(_ val: String) {}
```

**Q: What are default parameter values, and how are they useful?**

```swift
func greet(name: String = "Guest") {
    print("Hello, \(name)")
}
```

**Q: Can methods return multiple values? If so, how?**

* Yes, using tuples:

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) { ... }
```

---

## 🧬 Inheritance

**Q: What is inheritance, and how does it work in Swift?**

* A class can inherit properties and methods from another class using `class Subclass: Superclass`.

**Q: How does method overriding work in Swift?**

```swift
class Parent {
    func speak() {}
}

class Child: Parent {
    override func speak() {}
}
```

**Q: What is the `super` keyword, and how is it used?**

* Calls a method or property on the superclass:

```swift
override func speak() {
    super.speak()
    print("Child speaking")
}
```

**Q: How do you prevent a class from being subclassed?**

* Use `final class`.

**Q: Can a subclass access private properties or methods of a superclass?**

* No. Use `fileprivate` or `internal` for limited access.

**Q: What are `final` methods and `final` classes, and when should they be used?**

* Prevent further subclassing or overriding; improves safety and performance.

**Q: How does Swift handle multiple inheritance?**

* **Not supported**. Swift uses protocol conformance to achieve similar behavior.

**Q: What is polymorphism, and how does it apply to Swift classes?**

* The ability to treat subclass instances as instances of their superclass or protocol.

---

## 🧩 Initialization

**Q: What is an initializer in Swift?**

* A method (`init`) used to set up an instance with initial values.

**Q: How does Swift enforce that all properties must be initialized?**

* Compiler ensures all stored properties are initialized before `init` completes.

**Q: What is the difference between a designated and a convenience initializer?**

* **Designated**: primary initializer.
* **Convenience**: secondary, must call another initializer using `self.init`.

**Q: What are failable initializers, and when should you use them?**

```swift
init?(string: String) {
    if string.isEmpty { return nil }
    self.value = string
}
```

**Q: How do default values in property declarations affect initializers?**

* Reduce the need for manual initialization in `init`.

**Q: What is a required initializer, and when is it useful?**

* Ensures all subclasses implement the initializer:

```swift
required init() { ... }
```

**Q: What is `init?` vs `init!`, and when should each be used?**

* `init?`: returns optional, fails gracefully.
* `init!`: implicitly unwrapped, can crash if initialization fails.

**Q: How do subclasses handle initialization when inheriting from a superclass?**

* Must call a designated initializer from the superclass (`super.init(...)`).

**Q: Can structs have custom initializers? If so, how?**

* Yes. You can override the default memberwise initializer with a custom `init`.

---

## ♻️ Deinitialization

**Q: What is a deinitializer (`deinit`), and when is it called?**

* Called **automatically** before a class instance is deallocated.

**Q: Can a struct have a deinitializer? Why or why not?**

* No. Structs are value types and don’t manage resources that need cleanup.

**Q: What is the purpose of `deinit`, and how does it help manage resources?**

* Frees up memory or performs cleanup like closing files, removing observers, etc.

**Q: Can a class call its `deinit` method manually?**

* No. Only the system calls `deinit` when the object is deallocated.

**Q: How does `deinit` work in an inheritance chain?**

* Swift automatically calls `deinit` **from child to parent** up the chain.
