import Foundation

public struct ArchiveHabitEntity: Hashable, Equatable {
    public init(
        startAt: String,
        endAt: String,
        level: Int
    ) {
        self.startAt = startAt
        self.endAt = endAt
        self.level = level
    }

    public let startAt, endAt: String
    public let level: Int
}
