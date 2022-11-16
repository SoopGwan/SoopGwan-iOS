import Foundation

public struct ArchiveHabitEntity: Hashable, Equatable {
    public init(
        id: Int,
        startAt: String,
        endAt: String,
        level: Int
    ) {
        self.id = id
        self.startAt = startAt
        self.endAt = endAt
        self.level = level
    }

    public let id: Int
    public let startAt, endAt: String
    public let level: Int
}
