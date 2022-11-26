import Foundation

public struct FetchAchievementDTO: Codable {
    public let myAchieveList: [MyAchieveListDTO]

    enum CodingKeys: String, CodingKey {
        case myAchieveList = "my_achieve_list"
    }
}

public struct MyAchieveListDTO: Codable {
    public let title, rarityType, productType, content: String

    enum CodingKeys: String, CodingKey {
        case title
        case rarityType = "rarity_type"
        case productType = "product_type"
        case content
    }
}
