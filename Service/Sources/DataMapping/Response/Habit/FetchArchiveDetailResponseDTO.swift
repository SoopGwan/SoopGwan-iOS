import Foundation

public struct FetchArchiveDetailResponseDTO: Codable {
    public let habits: [DetailHabitDTO]
    public let status: Int
}

public struct DetailHabitDTO: Codable, Hashable, Equatable {
    public let title: String
    public let count: Int

    public init(
        title: String,
        count: Int
    ) {
        self.title = title
        self.count = count
    }
}
