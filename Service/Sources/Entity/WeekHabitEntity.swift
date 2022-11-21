import Foundation

public struct WeekHabitEntity: Equatable, Hashable {
    public let id: Int
    public let title: String
    public let successStatus: Bool
    public let habitCount: Int

    public init(
        id: Int,
        title: String,
        successStatus: Bool,
        habitCount: Int
    ) {
        self.id = id
        self.title = title
        self.successStatus = successStatus
        self.habitCount = habitCount
    }
}
