import UIKit

class TaskView: UIView {

    let taskField = UITextField()
    let addButton = UIButton(type: .system)
    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .systemBackground

        taskField.placeholder = "Enter task"
        taskField.borderStyle = .roundedRect

        addButton.setTitle("Add Task", for: .normal)

        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "TaskCell"
        )

        let stack = UIStackView(
            arrangedSubviews: [taskField, addButton, tableView]
        )

        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            stack.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            stack.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            stack.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }
}
