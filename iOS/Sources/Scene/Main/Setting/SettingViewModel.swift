import Combine
import Service

final class SettingViewModel: BaseViewModel {
    @Published var isLogOut: Bool = false
    @Published var isLChangePassword: Bool = false
    @Published var isOtherView: Bool = false
}
