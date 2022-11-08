import Foundation

struct FetchHabitToWeekResponseDTO: Codable {
    let habits: [SingleHomeHabitDTO]
}

struct SingleHomeHabitDTO: Codable {
    let id: Int
    let title: String
    let successStatus: Bool

    enum CodingKeys: String, CodingKey {
        case id, title
        case successStatus = "success_status"
    }
}
