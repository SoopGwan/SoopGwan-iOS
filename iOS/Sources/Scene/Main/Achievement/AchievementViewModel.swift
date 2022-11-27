import Combine
import Service
import SwiftUI

final class AchievementViewModel: BaseViewModel {
    @Published var list: [AchieveListEntity] = []

    private let remoteAchievementDataSourceImpl = RemoteAchievementDataSourceImpl()

    func onAppear() {
        addCancellable(
            remoteAchievementDataSourceImpl
                .fetchAchievement()
        ) { [weak self] list in
            withAnimation {
                self?.list = list
            }
        }
    }
}
