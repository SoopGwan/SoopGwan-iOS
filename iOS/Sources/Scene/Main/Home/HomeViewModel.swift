import Combine
import Service

final class HomeViewModel: BaseViewModel {
    @Published var habitList: [WeekHabitEntity] = [
        .init(id: 0, title: "리치 밥주기", successStatus: true),
        .init(id: 0, title: "아보카도 물주기", successStatus: false),
        .init(id: 0, title: "정해진 시간에 일어나기", successStatus: true),
        .init(id: 0, title: "일어나서 물 마시기", successStatus: false),
        .init(id: 0, title: "리치 밥주기", successStatus: true),
        .init(id: 0, title: "아보카도 물주기", successStatus: false),
        .init(id: 0, title: "정해진 시간에 일어나기", successStatus: true),
        .init(id: 0, title: "일어나서 물 마시기", successStatus: false),
        .init(id: 0, title: "리치 밥주기", successStatus: true),
        .init(id: 0, title: "아보카도 물주기", successStatus: false),
        .init(id: 0, title: "정해진 시간에 일어나기", successStatus: true),
        .init(id: 0, title: "일어나서 물 마시기", successStatus: false),
        .init(id: 0, title: "리치 밥주기", successStatus: true),
        .init(id: 0, title: "아보카도 물주기", successStatus: false),
        .init(id: 0, title: "정해진 시간에 일어나기", successStatus: true),
        .init(id: 0, title: "일어나서 물 마시기", successStatus: false),
        .init(id: 0, title: "리치 밥주기", successStatus: true),
        .init(id: 0, title: "아보카도 물주기", successStatus: false),
        .init(id: 0, title: "정해진 시간에 일어나기", successStatus: true),
        .init(id: 0, title: "일어나서 물 마시기", successStatus: false),
        .init(id: 0, title: "리치 밥주기", successStatus: true),
        .init(id: 0, title: "아보카도 물주기", successStatus: false),
        .init(id: 0, title: "정해진 시간에 일어나기", successStatus: true),
        .init(id: 0, title: "일어나서 물 마시기", successStatus: false),
        .init(id: 0, title: "잠자기 전 책 10페이지 읽기", successStatus: false)
    ]
}
