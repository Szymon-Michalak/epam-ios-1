/// Task 2: Opaque and Boxed Protocol Types
///
///
/// This task focuses on protocol-based polymorphism using opaque return types (`some Shape`) to work with different concrete implementations of a `Shape` protocol.
///
/// ### Steps:
///
/// 1. **Define a protocol `Shape`** with the following methods:
///    - `area() -> Double` — Returns the area of the shape
///    - `perimeter() -> Double` — Returns the perimeter of the shape
///
/// 2. **Implement two concrete types** conforming to `Shape`:
///    - `Circle` class — Initialized with radius
///    - `Rectangle` class — Initialized with width and height
///
/// 3. **Implement a function `generateShape() -> some Shape`**:
///    - Returns an opaque type conforming to `Shape`
///    - Internally returns a `Circle` instance with radius = 5
///
/// 4. **Implement a function `calculateShapeDetails(from shape: Shape) -> (area: Double, perimeter: Double)`**:
///    - Takes a shape instance and returns a tuple with its area and perimeter
///



protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}

class Circle: Shape {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        radius * radius * Double.pi
    }

    func perimeter() -> Double {
        (radius + radius) * Double.pi
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func area() -> Double {
        width * height
    }

    func perimeter() -> Double {
        width * 2 + height * 2
    }
}

func generateShape() -> some Shape {
    Circle(radius: 5)
}

func calculateShapeDetails(from shape: Shape) -> (area: Double, perimeter: Double) {
    (shape.area(), shape.perimeter())
}
