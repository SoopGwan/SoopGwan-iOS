import Foundation

struct FetchHabitToWeekResponseDTO: Codable {
    let habits: [WeekHabitDTO]
    enum CodingKeys: String, CodingKey {
        case habits = "week_habit_element_list"
    }
}

struct WeekHabitDTO: Codable {
    let id: Int
    let title: String
    let successStatus: Bool
    let habitCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case title = "content"
        case successStatus = "success_status"
        case habitCount = "success_count"
    }
}
