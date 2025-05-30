//
//  CalculatorViewController.swift
//  CalculatorTask-UIKit-EpamInternship
//
//  Created by Szymon Michalak on 27/05/2025.
//
//  Description:
//  This file contains both UI and logic for the simple calculator app
//

import UIKit

final class CalculatorViewController: UIViewController {

    private let calculatorView = CalculatorView()
    private let inputHandler = CalculatorInputHandler()

    override func loadView() {
        self.view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        for button in calculatorView.buttons.keys {
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        guard let type = calculatorView.buttons[sender] else { return }

        switch type {
        case .digit(let digit): inputHandler.handleDigit(digit)
        case .dot: inputHandler.handleDot()
        case .negate: inputHandler.handleNegate()
        case .operator(let op): inputHandler.handleOperator(op)
        case .equal: inputHandler.handleEqual()
        case .clear: inputHandler.handleClear()
        }

        calculatorView.displayLabel.text = inputHandler.displayText
        calculatorView.expressionLabel.text = inputHandler.expressionText
    }
}

enum Layout {
    static let margin: CGFloat = 20
    static let spacing: CGFloat = 10
    static let buttonSize: CGFloat = 80
    static let topMargin: CGFloat = 60
    static let buttonTop: CGFloat = 200
    static let contentWidth: CGFloat = 340
}

final class CalculatorView: UIView {

    let expressionLabel = UILabel()
    let displayLabel = UILabel()
    var buttons: [UIButton: CalculatorButton] = [:]

    private let buttonGrid: [[CalculatorButton]] = [
        [.digit(7), .digit(8), .digit(9), .operator(.divide)],
        [.digit(4), .digit(5), .digit(6), .operator(.multiply)],
        [.digit(1), .digit(2), .digit(3), .operator(.subtract)],
        [.digit(0), .clear, .equal, .operator(.add)],
        [.dot, .negate]
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
        setupButtons()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setupLabels() {
        expressionLabel.frame = CGRect(
            x: Layout.margin,
            y: Layout.topMargin,
            width: Layout.contentWidth,
            height: 40
        )
        expressionLabel.font = UIFont.systemFont(ofSize: 22)
        expressionLabel.textColor = .gray
        expressionLabel.textAlignment = .right
        addSubview(expressionLabel)

        displayLabel.frame = CGRect(
            x: Layout.margin,
            y: Layout.topMargin + 40,
            width: Layout.contentWidth,
            height: 80
        )
        displayLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 40, weight: .medium)
        displayLabel.textColor = .black
        displayLabel.textAlignment = .right
        addSubview(displayLabel)
    }

    private func setupButtons() {
        for (rowIndex, row) in buttonGrid.enumerated() {
            for (colIndex, type) in row.enumerated() {
                let x = Layout.margin + CGFloat(colIndex) * (Layout.buttonSize + Layout.spacing)
                let y = Layout.buttonTop + CGFloat(rowIndex) * (Layout.buttonSize + Layout.spacing)

                let button = CalculatorButtonFactory.makeButton(for: type, frame: CGRect(
                    x: x, y: y, width: Layout.buttonSize, height: Layout.buttonSize
                ))
                addSubview(button)
                buttons[button] = type
            }
        }
    }
}

enum CalculatorButtonFactory {
    static func makeButton(for type: CalculatorButton, frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(type.title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = type.isOperator ? .systemOrange : .darkGray
        button.layer.cornerRadius = frame.width / 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return button
    }
}

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

enum MathError: Error, CustomStringConvertible {
    case divisionByZero
    case unknown
    case notEnoughOperands
    case tooManyDigits
    case invalidTokenSequence

    var description: String {
        switch self {
        case .divisionByZero: return "Division by zero"
        case .unknown: return "Unknown error"
        case .notEnoughOperands: return "Too few operands"
        case .tooManyDigits: return "Too many digits"
        case .invalidTokenSequence: return "Invalid expression"
        }
    }
}

// Using Shunting Yard Algorithm
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

                stack.append(result)
            }
        }

        if stack.count != 1 {
            throw .invalidTokenSequence
        }

        return stack.first
    }
}

enum CalculatorButton {
    case digit(Int)
    case dot
    case `operator`(Operator)
    case equal
    case negate
    case clear

    var title: String {
        switch self {
        case .digit(let number): return "\(number)"
        case .dot: return "."
        case .operator(let operation): return operation.rawValue
        case .equal: return "="
        case .negate: return "±"
        case .clear: return "C"
        }
    }

    var isOperator: Bool {
        if case .operator = self { return true }
        return false
    }
}

struct InputValidator {
    let maxDigits: Int

    init(maxDigits: Int) {
        self.maxDigits = maxDigits
    }

    func isValidInput(_ input: String) -> Bool {
        let digitsOnly = input.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        return digitsOnly.count <= maxDigits
    }

    func isValidResult(_ result: String) -> Bool {
        let digitsOnly = result.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        return digitsOnly.count <= maxDigits
    }

    func isValidNextDigit(current: String, next: Int) -> Bool {
        // Allow `0` only if current is not already `0` without a dot
        if current == "0" && !current.contains(".") && next == 0 {
            return false
        }
        return true
    }
}

final class CalculatorInputHandler {

    // MARK: - Dependencies
    // Would use protocols in production
    private let validator: InputValidator
    private let engine: CalculatorEngine

    // MARK: - State

    private(set) var currentInput: String = ""
    private(set) var tokens: [CalculatorToken] = []

    private let keepExpressionAfterEquals: Bool

    // MARK: - UI Outputs

    var displayText: String = "0"
    var expressionText: String = ""

    // MARK: - Init

    init(
        validator: InputValidator = InputValidator(maxDigits: 10),
        engine: CalculatorEngine = CalculatorEngine(),
        keepExpressionAfterEquals: Bool = false
    ) {
        self.validator = validator
        self.engine = engine
        self.keepExpressionAfterEquals = keepExpressionAfterEquals
    }

    // MARK: - Button Actions
    func handleDigit(_ n: Int) {
        guard validator.isValidNextDigit(current: currentInput, next: n) else { return }

        let nextInput: String
        if currentInput == "0" && n != 0 && !currentInput.contains(".") {
            nextInput = "\(n)"
        } else {
            nextInput = currentInput + "\(n)"
        }

        guard validator.isValidInput(nextInput) else { return }

        currentInput = nextInput
        displayText = currentInput
        updateExpression()
    }

    func handleDot() {
        if !currentInput.contains(".") {
            let newInput = currentInput.isEmpty ? "0." : currentInput + "."
            if validator.isValidInput(newInput) {
                currentInput = newInput
                displayText = currentInput
                updateExpression()
            }
        }
    }

    func handleNegate() {
        if currentInput.starts(with: "-") {
            currentInput.removeFirst()
        } else if !currentInput.isEmpty {
            currentInput = "-" + currentInput
        }
        displayText = currentInput
        updateExpression()
    }

    func handleOperator(_ op: Operator) {
        if let value = Double(currentInput) {
            tokens.append(.number(value))
            tokens.append(.operatorSymbol(op))
            currentInput = ""
            updateExpression()
        }
    }

    func handleEqual() {
        if let value = Double(currentInput) {
            tokens.append(.number(value))
        }

        do {
            if let result = try engine.evaluate(tokens) {
                let resultString = format(result)

                if validator.isValidResult(resultString) {
                    displayText = resultString
                    currentInput = resultString

                    if keepExpressionAfterEquals {
                        expressionText += " = \(resultString)"
                    } else {
                        expressionText = ""
                    }

                    tokens.removeAll()
                } else {
                    reset(with: MathError.tooManyDigits.description)
                }
            }
        } catch let error {
            reset(with: error.description)
        }
    }

    func handleClear() {
        reset()
    }

    // MARK: - Helpers

    private func reset(with display: String = "0") {
        currentInput = ""
        tokens.removeAll()
        displayText = display
        expressionText = ""
    }

    private func updateExpression() {
        var parts: [String] = tokens.map { token in
            switch token {
            case .number(let value):
                return format(value)
            case .operatorSymbol(let op):
                return op.rawValue
            }
        }

        if !currentInput.isEmpty {
            parts.append(currentInput)
        }

        expressionText = parts.joined(separator: " ")
    }

    private func format(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 9
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = false

        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
