import Combine
import Service
import SwiftUI

final class ArchiveListViewModel: BaseViewModel {
    @Published var yearSelect: String = "2022년"
    @Published var yearSelectNumber: String = "2022"
    @Published var list: [ArchiveHabitEntity] = []

    @Published var selectList: ArchiveHabitEntity = .init(
        startAt: "",
        endAt: "",
        level: 0
    )

    @Published var yearOptions = [
        DropdownOption(
            key: "2022",
            val: "2022년"),
        DropdownOption(
            key: "2021",
            val: "2021년"
        ),
        DropdownOption(
            key: "2020",
            val: "2020년"
        )
    ]

    private let remoteHabitDataSourceImpl = RemoteHabitDataSourceImpl()

    func onAppear() {
        addCancellable(
            remoteHabitDataSourceImpl
                .fetchAllHabit(date: "\(yearSelectNumber)-01-01")
        ) { [weak self] weekHabitList in
            withAnimation {
                self?.list = weekHabitList
            }
        }
    }
}
