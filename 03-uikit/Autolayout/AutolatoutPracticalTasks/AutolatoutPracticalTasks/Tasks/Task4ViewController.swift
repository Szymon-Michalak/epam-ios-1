//
//  Task4ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Create a view with two subviews aligned vertically when in Compact width, Regular height mode.
// If the orientation changes to Compact-Compact, same 2 subviews should be aligned horizontally.
// Hou can use iPhone 16 simulator for testing.
final class Task4ViewController: UIViewController {

    private let firstView = UIView()
    private let secondView = UIView()

    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupStyles()
        setupLayout()
        updateStackAxis(for: traitCollection)
        registerForTraitChanges()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 17.0, *) { return }

        if previousTraitCollection?.horizontalSizeClass !=
            traitCollection.horizontalSizeClass {
            updateStackAxis(for: traitCollection)
        }
    }

    private func registerForTraitChanges() {
        if #available(iOS 17.0, *) {
            let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
            registerForTraitChanges(sizeTraits) { (self: Self, previousTraitCollection: UITraitCollection) in
                // TODO: -  Handle the trait change.
                print("Trait collection changed:", self.traitCollection)
                self.updateStackAxis(for: self.traitCollection)
            }
        }
    }

    private func setupHierarchy() {
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)

        view.addSubview(stackView)
    }

    private func setupStyles() {
        firstView.backgroundColor = .red
        secondView.backgroundColor = .blue

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
    }

    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            firstView.widthAnchor.constraint(equalToConstant: 100),
            firstView.heightAnchor.constraint(equalToConstant: 50),

            secondView.widthAnchor.constraint(equalToConstant: 100),
            secondView.heightAnchor.constraint(equalToConstant: 50),

            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }

    private func updateStackAxis(for traitCollection: UITraitCollection) {
        if traitCollection.horizontalSizeClass == .compact &&
            traitCollection.verticalSizeClass == .compact {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
}

//#Preview {
//    Task4ViewController()
//}
