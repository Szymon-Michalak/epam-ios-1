enum CalculatorToken {
    case number(Double)
    case operatorSymbol(Operator)
}

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"

    var precedence: Int {
        switch self {
        case .add, .subtract: return 1
        case .multiply, .divide: return 2
        }
    }
}

struct CalculatorEngine {
    func evaluate(_ tokens: [CalculatorToken]) throws(MathError) -> Double? {
        let postfix = convertToPostfix(tokens)
        return try evaluatePostfix(postfix)
    }

    private func convertToPostfix(_ tokens: [CalculatorToken]) -> [CalculatorToken] {
        var output: [CalculatorToken] = []
        var stack: [Operator] = []

        for token in tokens {
            switch token {
            case .number:
                output.append(token)
            case .operatorSymbol(let op):
                while let last = stack.last, last.precedence >= op.precedence {
                    output.append(.operatorSymbol(stack.removeLast()))
                }
                stack.append(op)
            }
        }

        while let remaining = stack.popLast() {
            output.append(.operatorSymbol(remaining))
        }

        return output
    }

    private func evaluatePostfix(_ tokens: [CalculatorToken]) throws(MathError) -> Double? {
        var stack: [Double] = []

        for token in tokens {
            switch token {
            case .number(let value):
                guard value.isFinite else { throw .tooLargeNumber(value) }
                stack.append(value)

            case .operatorSymbol(let op):
                guard stack.count >= 2 else { throw .notEnoughOperands }
                let rhs = stack.popLast()!
                let lhs = stack.popLast()!

                let result: Double
                switch op {
                case .add: result = lhs + rhs
                case .subtract: result = lhs - rhs
                case .multiply: result = lhs * rhs
                case .divide:
                    if rhs == 0 { throw .divisionByZero }
                    result = lhs / rhs
                }

                guard result.isFinite else { throw .tooLargeNumber(result) }
                stack.append(result)
            }
        }

        if stack.count != 1 {
            throw .invalidTokenSequence
        }

        return stack.first
    }
}

enum MathError: Error, CustomStringConvertible {
    case divisionByZero
    case unknown
    case notEnoughOperands
    case tooLargeNumber(Double)
    case invalidTokenSequence

    var description: String {
        switch self {
        case .divisionByZero:
            return "Division by zero is not allowed."
        case .unknown:
            return "An unknown error occurred during evaluation."
        case .notEnoughOperands:
            return "Not enough operands to perform operation."
        case .tooLargeNumber(let value):
            return "The number \(value) is too large to handle."
        case .invalidTokenSequence:
            return "The expression contains an invalid token sequence."
        }
    }
}

let expression: [CalculatorToken] = [
    .number(5),
    .operatorSymbol(.divide),
    .number(0),
    .operatorSymbol(.add),
    .number(2)
]

let engine = CalculatorEngine()

do {
    let result = try engine.evaluate(expression)
    print("Result: \(result ?? 0)")
} catch let error {
    print("Error: \(error.description)")
}
