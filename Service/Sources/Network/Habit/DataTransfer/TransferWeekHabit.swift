import Foundation

extension FetchHabitToWeekResponseDTO {
    func toDomain() -> [WeekHabitEntity] {
        habits.map { $0.toDomain() }
    }
}

extension WeekHabitDTO {
    func toDomain() -> WeekHabitEntity {
        WeekHabitEntity(
            id: id,
            title: title,
            successStatus: successStatus
        )
    }
}
