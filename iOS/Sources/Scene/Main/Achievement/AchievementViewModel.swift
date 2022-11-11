import Combine
import Service

final class AchievementViewModel: BaseViewModel {
    let list: [AchievementsListEntity] = [
        .init(
            title: "1주 동안 한번도 습관 실천하지 않기",
            date: "2022-01-01 달성",
            rarityType: "color",
            productType: "dislike_badge"
        ),
        .init(
            title: "1일 동안 한번도 습관 실천하지 않기",
            date: "2022-02-12일 달성",
            rarityType: "normal",
            productType: "dislike_badge"
        ),
        .init(
            title: "1일 동안 한번도 습관 실천하지 않기",
            date: "2022-02-12일 달성",
            rarityType: "normal",
            productType: "dislike_badge"
        ),
        .init(
            title: "오전 12:00에 습관 실천하기",
            date: "2022-05-05일 달성",
            rarityType: "gradation",
            productType: "alarm_clock"
        ),
    ]
}
