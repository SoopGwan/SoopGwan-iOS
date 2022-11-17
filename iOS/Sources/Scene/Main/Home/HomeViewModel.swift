import Combine
import Service

final class HomeViewModel: BaseViewModel {
    @Published var habitList: [WeekHabitEntity] = [
        .init(id: 0, title: "리치 밥주기", successStatus: true),
        .init(id: 1, title: "아보카도 물주기", successStatus: false),
        .init(id: 2, title: "정해진 시간에 일어나기", successStatus: true),
        .init(id: 3, title: "일어나서 물 마시기", successStatus: false),
        .init(id: 4, title: "리치 밥주기", successStatus: true)
    ]
}
