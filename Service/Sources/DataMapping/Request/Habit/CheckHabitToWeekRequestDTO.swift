import Foundation

public struct CheckHabitToWeekRequestDTO: Codable {
    public let id: Int
    public let status: Int

    public init(
        id: Int,
        status: Int
    ) {
        self.id = id
        self.status = status
    }
}
