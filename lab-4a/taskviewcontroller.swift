import UIKit

class TaskViewController: UIViewController,
                          UITableViewDataSource,
                          UITableViewDelegate {

    private let taskView = TaskView()
    private var tasks: [Task] = []
    private var filter: TaskFilter = .all

    override func loadView() {
        view = taskView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Task Manager"

        taskView.tableView.dataSource = self
        taskView.tableView.delegate = self

        taskView.addButton.addTarget(
            self,
            action: #selector(addTask),
            for: .touchUpInside
        )
    }

    private var filteredTasks: [Task] {
        switch filter {
        case .all:
            return tasks
        case .pending:
            return tasks.filter { !$0.isCompleted }
        case .completed:
            return tasks.filter { $0.isCompleted }
        }
    }

    @objc private func addTask() {
        let title = taskView.taskField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard !title.isEmpty else { return }

        tasks.append(Task(title: title))

        taskView.taskField.text = ""
        taskView.tableView.reloadData()
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return filteredTasks.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TaskCell",
            for: indexPath
        )

        let task = filteredTasks[indexPath.row]

        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted
            ? .checkmark : .none

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let selectedTask = filteredTasks[indexPath.row]

        guard let index = tasks.firstIndex(
            where: { $0.id == selectedTask.id }
        ) else { return }

        tasks[index].isCompleted.toggle()
        tableView.reloadData()
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        guard editingStyle == .delete else { return }

        let selectedTask = filteredTasks[indexPath.row]

        tasks.removeAll { $0.id == selectedTask.id }

        tableView.reloadData()
    }
}
