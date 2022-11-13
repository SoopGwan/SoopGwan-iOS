import Foundation

public struct AchievementsListEntity: Equatable, Hashable {
    public let title: String
    public let date: String
    public let rarityType: String
    public let productType: String

    public init(
        title: String,
        date: String,
        rarityType: String,
        productType: String
    ) {
        self.title = title
        self.date = date
        self.rarityType = rarityType
        self.productType = productType
    }

}
