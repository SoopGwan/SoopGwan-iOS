import Combine
import Service

final class SignInViewModel: BaseViewModel {
    @Published var id = "0824dh"
    @Published var password = "qwert12345!"

//    @Published var id = ""
//    @Published var password = ""

    @Published var isOnAutoSignin = true
    @Published var isSuccessSignin = false
    @Published var buttonPressed = false
    var isSigninEnabled: Bool {
        !id.isEmpty && !password.isEmpty
    }

    private let remoteUserDataSourceImpl = RemoteUserDataSourceImpl()

    func signinButtonDidTap() {
        guard isSigninEnabled else { return }
        addCancellable(
            remoteUserDataSourceImpl.signin(
                req: SignInRequestDTO(accountId: id, password: password)
            )
        ) { [weak self] _ in
            self?.isSuccessSignin = true
        }
    }

}
