import Foundation

struct Task {
    let id: UUID
    var title: String
    var isCompleted: Bool

    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isCompleted = false
    }
}

enum TaskFilter {
    case all
    case pending
    case completed
}
