import Combine
import Service

final class IDAndPhoneNumBerViewModel: BaseViewModel {
    @Published var id = ""
    @Published var phoneNumber  = ""
    @Published var isShowingToast = false
    @Published var isSuccessNext = false
    var isNextEnabled: Bool {
        !id.isEmpty && !phoneNumber.isEmpty
    }

    private let remoteUserDataSourceImpl = RemoteUserDataSourceImpl()

    func nextButtonDidTap() {
        guard isNextEnabled else { return }
        addCancellable(
            remoteUserDataSourceImpl
                .checkAccountIDIsExist(accountID: id)
        ) { [weak self] _ in
            self?.isSuccessNext = true
        } onReceiveError: { [weak self] _ in
            self?.isShowingToast = true
        }

    }

}
