import Foundation

extension FetchAchievementDTO {
    func toDomain() -> [AchieveListEntity] {
        myAchieveList.map { $0.toDomain() }
    }
}

extension MyAchieveListDTO {
    func toDomain() -> AchieveListEntity {
        AchieveListEntity(
            title: title,
            imageName: rarityType + productType,
            content: content
        )
    }
}
