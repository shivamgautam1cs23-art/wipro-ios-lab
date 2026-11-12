
import UIKit

class ViewController: UIViewController {

    // MARK: - UI Components

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Background Task Demo"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Ready to start"
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Operation", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()

    // Prevent duplicate submissions

    private var isLoading = false

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupUI()

        print("App UI loaded | Main Thread: \(Thread.isMainThread)")
    }

    // MARK: - Setup UI

    private func setupUI() {

        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            statusLabel,
            activityIndicator,
            startButton
        ])

        stack.axis = .vertical
        stack.spacing = 25
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([

            stack.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),

            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 30
            ),

            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -30
            ),

            startButton.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])

        startButton.addTarget(
            self,
            action: #selector(startOperation),
            for: .touchUpInside
        )
    }

    // MARK: - Start Operation

    @objc private func startOperation() {

        // Prevent duplicate button clicks

        guard !isLoading else {
            print("Duplicate request ignored")
            return
        }

        isLoading = true

        print("Operation started | Main Thread: \(Thread.isMainThread)")

        // Update UI on main thread

        statusLabel.text = "Processing..."
        startButton.isEnabled = false
        startButton.alpha = 0.5
        activityIndicator.startAnimating()

        // Background operation using GCD

        DispatchQueue.global(qos: .userInitiated).asyncAfter(
            deadline: .now() + 4
        ) {

            // This code runs after 4 seconds on a background queue

            dispatchPrecondition(condition: .notOnQueue(.main))

            print("Background operation started")
            print("Background Thread: \(Thread.isMainThread)")

            // Simulate processing result

            let result = "Data fetched successfully!"

            print("Background operation completed")

            // Return to main queue for UI updates

            DispatchQueue.main.async {

                dispatchPrecondition(condition: .onQueue(.main))

                print("UI update on Main Thread: \(Thread.isMainThread)")

                self.statusLabel.text = result

                self.activityIndicator.stopAnimating()

                self.startButton.isEnabled = true
                self.startButton.alpha = 1.0

                self.isLoading = false

                print("Operation finished")
            }
        }
    }
}
