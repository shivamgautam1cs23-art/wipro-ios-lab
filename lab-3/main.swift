
import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var result: String = "Your result will appear here"

    var body: some View {
        VStack(spacing: 20) {

            Text("Welcome")
                .font(.largeTitle)
                .bold()

            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("Submit") {
                if name.isEmpty {
                    result = "Please enter your name"
                } else {
                    result = "Hello, \(name)!"
                }
            }
            .buttonStyle(.borderedProminent)

            Text(result)
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
    }
}



import UIKit

class ViewController: UIViewController {

    let titleLabel = UILabel()
    let nameTextField = UITextField()
    let submitButton = UIButton(type: .system)
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        
        titleLabel.text = "Welcome"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center

        
        nameTextField.placeholder = "Enter your name"
        nameTextField.borderStyle = .roundedRect

       
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8

        
        resultLabel.text = "Your result will appear here"
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 18)
        resultLabel.textColor = .blue

        
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            nameTextField,
            submitButton,
            resultLabel
        ])

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 30
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -30
            )
        ])

        
        submitButton.addTarget(
            self,
            action: #selector(submitTapped),
            for: .touchUpInside
        )
    }

    @objc func submitTapped() {
        let name = nameTextField.text ?? ""

        if name.isEmpty {
            resultLabel.text = "Please enter your name"
        } else {
            resultLabel.text = "Hello, \(name)!"
        }
    }
}
