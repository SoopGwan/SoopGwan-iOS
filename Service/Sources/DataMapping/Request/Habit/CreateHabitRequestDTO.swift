import Foundation

public struct CreateHabitRequestDTO: Codable {
    public let content: String

    public init(content: String) {
        self.content = content
    }
}
