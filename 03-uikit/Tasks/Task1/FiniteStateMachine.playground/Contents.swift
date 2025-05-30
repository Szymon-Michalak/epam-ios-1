import Foundation

// MARK: - Input States

enum InputState: CustomStringConvertible {
    case start
    case enteringNumber
    case afterOperator
    case afterEqual
    case error

    var description: String {
        switch self {
        case .start: return "Start"
        case .enteringNumber: return "EnteringNumber"
        case .afterOperator: return "AfterOperator"
        case .afterEqual: return "AfterEqual"
        case .error: return "Error"
        }
    }
}

// MARK: - User Actions

enum InputEvent: CustomStringConvertible {
    case digit(Int)
    case dot
    case negate
    case operatorTap(String)
    case equal
    case clear

    var description: String {
        switch self {
        case .digit(let n): return "Digit(\(n))"
        case .dot: return "Dot"
        case .negate: return "Negate"
        case .operatorTap(let op): return "Operator(\(op))"
        case .equal: return "Equal"
        case .clear: return "Clear"
        }
    }
}

// MARK: - Transition Logic

struct CalculatorFSM {

    static func transition(from state: InputState, event: InputEvent) -> InputState {
        switch (state, event) {

        // Reset
        case (_, .clear):
            return .start

        // Starting a number
        case (.start, .digit), (.afterOperator, .digit):
            return .enteringNumber

        // Continue typing a number
        case (.enteringNumber, .digit), (.enteringNumber, .dot):
            return .enteringNumber

        // Negation applies only when entering
        case (.enteringNumber, .negate):
            return .enteringNumber

        // Operator follows a number
        case (.enteringNumber, .operatorTap):
            return .afterOperator

        // Equal after number
        case (.enteringNumber, .equal):
            return .afterEqual

        // Start fresh after equal
        case (.afterEqual, .digit):
            return .enteringNumber

        // Operator right after equal (e.g. 2 = + 3)
        case (.afterEqual, .operatorTap):
            return .afterOperator

        // Invalid: Operator after operator
        case (.afterOperator, .operatorTap),
             (.start, .operatorTap),
             (.afterEqual, .equal),
             (.start, .equal):
            return .error

        default:
            return state
        }
    }
}
