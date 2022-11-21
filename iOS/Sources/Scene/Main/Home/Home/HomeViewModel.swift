import Combine
import Service

final class HomeViewModel: BaseViewModel {
    @Published var presentAlert = false
    @Published var newHabitTitle: String = ""
    @Published var habitList: [WeekHabitEntity] = []

    private let remoteHabitDataSourceImpl = RemoteHabitDataSourceImpl()

    func onAppear() {
        addCancellable(
            remoteHabitDataSourceImpl
                .fetchHabitToWeek()
        ) { [weak self] weekHabitList in
            self?.habitList = weekHabitList
        }
    }

    func fatchHabitStatus(_ id: Int) {
        addCancellable(
            remoteHabitDataSourceImpl
                .checkHabitIsSucceed(id: id)
        ) { _ in
        }
    }

    func addHabit() {
        addCancellable(
            remoteHabitDataSourceImpl
                .createHabit(
                    req: .init(
                        content: newHabitTitle
                    )
                )
        ) { [weak self] _ in
            self?.onAppear()
        }
    }
}
