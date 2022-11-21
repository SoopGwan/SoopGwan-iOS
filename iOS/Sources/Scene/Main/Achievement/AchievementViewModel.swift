import Combine
import Service

final class AchievementViewModel: BaseViewModel {
    @Published var list: [AchievementsListEntity] = [
        .init(
            title: "하루에 하나 이상 1달간 습관 실천하기",
            date: "2022-08-24일 달성",
            rarityType: "gradation",
            productType: "alarm_clock"
        ),
        .init(
            title: "오전 12:00에 습관 실천하기",
            date: "2022-05-30일 달성",
            rarityType: "normal",
            productType: "dislike_badge"
        ),
        .init(
            title: "1주 동안 한번도 습관 실천하지 않기",
            date: "2022-02-12 달성",
            rarityType: "color",
            productType: "dislike_badge"
        ),
        .init(
            title: "1일 동안 한번도 습관 실천하지 않기",
            date: "2022-01-31일 달성",
            rarityType: "normal",
            productType: "dislike_badge"
        )
    ]
}
