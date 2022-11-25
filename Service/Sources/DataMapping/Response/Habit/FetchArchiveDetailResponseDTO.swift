import Foundation

public struct FetchArchiveDetailResponseDTO: Codable {
    public let habits: [DetailHabitDTO]
    public let status: Int
}

public struct DetailHabitDTO: Codable, Hashable, Equatable {
    let title: String
    let count: Int
}
