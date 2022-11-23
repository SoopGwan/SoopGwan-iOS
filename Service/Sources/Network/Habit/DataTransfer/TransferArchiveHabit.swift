import Foundation

extension FetchArchiveHabitResponseDTO {
    func toDomain() -> [ArchiveHabitEntity] {
        habits.map { $0.toDomain() }
    }

}

extension ArciveHabitDTO {
    func toDomain() -> ArchiveHabitEntity {
        ArchiveHabitEntity(
            startAt: startAt,
            endAt: endAt,
            level: level
        )
    }
}
