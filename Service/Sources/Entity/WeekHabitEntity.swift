import Foundation

public struct WeekHabitEntity: Equatable, Hashable {
    public let id: Int
    public let title: String
    public let successStatus: Bool

    public init(
        id: Int,
        title: String,
        successStatus: Bool
    ) {
        self.id = id
        self.title = title
        self.successStatus = successStatus
    }
}
