import Foundation

public struct DetailHabitEntity: Equatable {
    public let habits: [DetailHabitDTO]
    public let id, status: Int
}
