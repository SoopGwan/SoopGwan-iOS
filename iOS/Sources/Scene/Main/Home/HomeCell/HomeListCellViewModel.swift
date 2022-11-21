import SwiftUI
import Combine
import Service

final class HomeListCellViewModel: BaseViewModel {

    private let remoteHabitDataSourceImpl = RemoteHabitDataSourceImpl()
    func fatchHabitStatus(_ id: Int) {
        addCancellable(
            remoteHabitDataSourceImpl
                .checkHabitIsSucceed(id: id)
        ) {}
    }
}
