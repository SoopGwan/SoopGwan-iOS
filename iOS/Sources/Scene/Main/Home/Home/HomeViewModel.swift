import Combine
import Service
import SwiftUI

final class HomeViewModel: BaseViewModel {
    @Published var presentAlert = false
    @Published var newHabitTitle: String = ""
    @Published var habitList: [WeekHabitEntity] = []
    @Published var habitLevel: Int = -1

    var totalHabitLevel: Int = 0

    private let remoteHabitDataSourceImpl = RemoteHabitDataSourceImpl()

    func onAppear() {
        addCancellable(
            remoteHabitDataSourceImpl
                .fetchHabitToWeek()
        ) { [weak self] weekHabitList in
            withAnimation {
                self?.habitList = weekHabitList
            }
            self?.totalHabitLevel = 0
            self?.habitList.forEach {
                print($0)
                self?.totalHabitLevel += $0.habitCount
            }
            self?.makehabitLevel()
        }
    }

    func addHabit() {
        if newHabitTitle.isEmpty { return }
        if newHabitTitle.count > 20 { return }

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

    func makehabitLevel() {
        withAnimation {
            // level을 나중에 실제 데이터일 경우 변경할 예정
            print("totalHabitLevel : \(totalHabitLevel)")
            if totalHabitLevel >= 0 && totalHabitLevel < 4 {
                habitLevel = 1
            } else if totalHabitLevel >= 5 && totalHabitLevel < 9 {
                habitLevel = 2
            } else if totalHabitLevel >= 10 && totalHabitLevel < 19 {
                habitLevel = 3
            } else if totalHabitLevel >= 20 && totalHabitLevel < 34 {
                habitLevel = 4
            } else if totalHabitLevel >= 35 {
                habitLevel = 4
            }
        }
    }
}
