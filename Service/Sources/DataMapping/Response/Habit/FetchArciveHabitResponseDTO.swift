import Foundation

struct FetchArciveHabitResponseDTO: Codable {
    let habits: [SingleArciveHabitDTO]
}

struct SingleArciveHabitDTO: Codable {
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
