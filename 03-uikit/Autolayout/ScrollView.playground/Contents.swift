import UIKit
import PlaygroundSupport

final class WorkingScrollViewExampleViewController: UIViewController {

    // MARK: - Views

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()

    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let logInButton = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        configureSubviews()
        setupLayout()
    }

    // MARK: - View Hierarchy & Configuration

    private func setupView() {
        // Scroll and container
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)

        // Stack configuration
        stackView.axis = .vertical
        stackView.spacing = 0 // use customSpacing instead
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // Stack content
        [titleLabel, bodyLabel, usernameField, passwordField, logInButton]
            .forEach { stackView.addArrangedSubview($0) }

        stackView.setCustomSpacing(12, after: titleLabel)
        stackView.setCustomSpacing(40, after: bodyLabel)
        stackView.setCustomSpacing(16, after: passwordField)

        // Disable autoresizing
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureSubviews() {
        titleLabel.text = "Sign In"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.textAlignment = .left

        bodyLabel.text = "Welcome back! Please sign in to your account."
        bodyLabel.numberOfLines = 0
        bodyLabel.textAlignment = .left

        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect

        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true

        logInButton.setTitle("Log In", for: .normal)
    }

    // MARK: - Layout

    private func setupLayout() {
        NSLayoutConstraint.activate([
            // ScrollView pinned to safe area
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            // contentView pinned to scrollView
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            // contentView width = visible width
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            // StackView pinned with margin
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

PlaygroundPage.current.liveView = WorkingScrollViewExampleViewController()
