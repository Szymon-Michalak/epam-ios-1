/// What should be done:
/// - Implement Palindrome Check Using String Manipulation.
/// - Create a function:
///
/// Requirements:
/// - Ignore spaces, punctuation, capitalization, and control characters.
/// - Do not use any third-party libraries or regular expressions.
/// - Do not consider an empty string or a single character as a palindrome.
///

// Initial solution
public func isPalindrome(input: String) -> Bool {
    func isAsciiLetter(_ c: Character) -> Bool {
            c.isLetter && c.isASCII
        }

    let sanitizedInput = input.lowercased().filter(isAsciiLetter)
    guard sanitizedInput.count >= 2 else { return false }

    let reversed = String(sanitizedInput.reversed())

    return sanitizedInput == reversed
}

// More robust and flexible solution
struct PalindromeValidator<Element: Equatable> {
    private let filterFunction: (Element) -> Bool
    private let normalizationFunction: (Element) -> Element
    private let minLength: Int

    init(filterFunction: @escaping (Element) -> Bool, normalizationFunction: @escaping (Element) -> Element, minLength: Int) {
        self.filterFunction = filterFunction
        self.normalizationFunction = normalizationFunction
        self.minLength = minLength
    }

    func isPalindrome<S: Sequence>(_ input: S) -> Bool where S.Element == Element {
        let sanitizedInput = input
            .filter(filterFunction)
            .map(normalizationFunction)

        let sanitized = Array(sanitizedInput)
        guard sanitized.count >= minLength else { return false }

        let reversed = sanitized.reversed()
        return sanitized.elementsEqual(reversed)
    }
}

// Test cases
let palindromeTests: [(input: String, expected: Bool)] = [
    ("racecar", true),
    ("RaceCar", true),
    ("A man a plan a canal Panama", true),
    ("No lemon, no melon", true),
    ("Was it a car or a cat I saw", true),
    ("Never odd or even", true),
    ("Hello, world!", false),
    ("", false),
    ("a", false),
    ("aa", true),
    ("ab", false),
    ("Madam In Eden, I’m Adam", true),
    ("Yo, banana boy!", true),
    ("Eva, can I see bees in a cave?", true),
    ("👩‍💻racecar👩‍💻", true), // emojis ignored
    ("abc cba", true),
    ("Not a palindrome", false),
    ("    ", false),
    ("aa bb aa", true)
]

// Tests of isPalindrome(input:)
for (i, test) in palindromeTests.enumerated() {
    let result = isPalindrome(input: test.input)
    assert(result == test.expected, "❌ Test \(i + 1) failed: '\(test.input)' → Expected: \(test.expected), Got: \(result)")
    print("✅ Test \(i + 1) passed")
}

// Tests of PalindromeValidator.isPalindrome(_:)
print("##########################")
let validator = PalindromeValidator<Character>(
    filterFunction: { $0.isLetter && $0.isASCII },
    normalizationFunction: { Character($0.lowercased()) },
    minLength: 2
)

for (i, test) in palindromeTests.enumerated() {
    let result = validator.isPalindrome(test.input)
    assert(result == test.expected, "❌ Test \(i + 1) failed: '\(test.input)' → Expected: \(test.expected), Got: \(result)")
    print("✅ Test \(i + 1) passed")
}
