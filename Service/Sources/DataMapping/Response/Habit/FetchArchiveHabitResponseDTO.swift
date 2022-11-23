import Foundation

struct FetchArchiveHabitResponseDTO: Codable {
    let habits: [ArciveHabitDTO]
}

struct ArciveHabitDTO: Codable {
    let startAt, endAt: String
    let level: Int

    enum CodingKeys: String, CodingKey {
        case startAt = "start_at"
        case endAt = "end_at"
        case level
    }
}
