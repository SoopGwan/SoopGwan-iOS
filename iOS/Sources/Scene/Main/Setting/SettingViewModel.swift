import Combine
import Service

final class SettingViewModel: BaseViewModel {
    @Published var isLogOut: Bool = false
    @Published var isChangePassword: Bool = false
    @Published var isLuckView: Bool = false
    @Published var isDeveloperView: Bool = false
    @Published var isOpenSourceView: Bool = false
    @Published var isLogOutButtonPressed: Bool = false
}
