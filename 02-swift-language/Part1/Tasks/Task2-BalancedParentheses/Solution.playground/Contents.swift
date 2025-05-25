/// Task 2: BalancedParentheses
///
/// Write a function `isBalancedParentheses(input: String) -> Bool` that returns `true`
/// if the parentheses in the input string are balanced, and `false` otherwise.
///
/// - Only parentheses `()` are considered; ignore other brackets or characters.
/// - The input string may contain multiple lines.
/// - Examples:
///   - `"(())"` is balanced
///   - `"(()"` is not balanced
///
/// Provide a link to your repository with the implementation and the path to the files.
///


/// Initial solution
public func isBalancedParentheses(input: String) -> Bool {
    let opening: Character = "("
    let closing: Character = ")"

    var balance = 0

    for char in input {
        switch char {
        case opening:
            balance += 1
        case closing:
            if balance == 0 { return false }
            balance -= 1
        default:
            continue
        }
    }

    return balance == 0
}

/// More robust and flexible solution
struct BalanceValidator<Element: Hashable> {
    private let opening: Set<Element>
    private let closing: [Element: Element]

    init(mapping: [Element: Element]) {
        self.opening = Set(mapping.keys)
        self.closing = Dictionary(uniqueKeysWithValues: mapping.map { ($1, $0) })
    }

    func isValid<S: Sequence>(_ sequence: S) -> Bool where S.Element == Element {
        var stack: [Element] = []

        for char in sequence {
            if opening.contains(char) {
                stack.append(char)
            } else if let match = closing[char] {
                guard let last = stack.popLast(), last == match else { return false }
            }
        }
        return stack.isEmpty
    }
}

/// Test cases
let testCases: [(input: String, expected: Bool)] = [
    ("()", true),
    ("(())", true),
    ("(()", false),
    (")(", false),
    ("", true),
    ("(((())))", true),
    ("((())(()))", true),
    ("(()()))", false),
    ("(()\n())", true), // multiline
    ("hello (world)", true),
    ("hello )world(", false),
    ("(🙂🙂🙂)", true), // emojis inside parentheses
    ("(👩‍💻)", true),   // complex emoji (multiple scalars)
    ("This is (a test 😄)", true),
    ("This is a ) broken ( string", false),
    ("((((((((()))))))))", true),
    ("((((((((())))))))", false),
    ("(((((((((()))))))))))", false),
    ("(a(b(c)d)e)", true),
    ("(()(())())", true)
]

/// Test isBalancedParentheses(input:)
for (index, testCase) in testCases.enumerated() {
    let result = isBalancedParentheses(input: testCase.input)
    print("Test \(index + 1): \(result == testCase.expected ? "✅" : "❌") - Input: \(testCase.input)")
}

/// Test BalanceValidator.isValid(_:)
print("###########################################")
let mapping: [Character: Character] = ["(": ")"]
let parenthesesValidator = BalanceValidator(mapping: mapping)
for (index, testCase) in testCases.enumerated() {
    let result = parenthesesValidator.isValid(testCase.input)
    print("Test \(index + 1): \(result == testCase.expected ? "✅" : "❌") - Input: \(testCase.input)")
}
