import Foundation

public struct AchievementsListEntity: Equatable {
    let title: String
    let date: String
    let rarityType: String
    let productType: String

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
