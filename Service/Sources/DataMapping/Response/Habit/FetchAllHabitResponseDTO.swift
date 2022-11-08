import Foundation

struct FetchAllHabitResponseDTO: Codable {
    let habits: [SingleHabitDTO]
}

struct SingleHabitDTO: Codable {
    let id: Int
    let startAt, endAt: String
    let level: Int

    enum CodingKeys: String, CodingKey {
        case id
        case startAt = "start_at"
        case endAt = "end_at"
        case level
    }
}
