import Combine
import Service

final class SignInViewModel: BaseViewModel {
    @Published var id = ""
    @Published var password = ""
    @Published var isOnAutoSignin = true
    @Published var isSuccessSignin = false
    var isSigninEnabled: Bool {
        !id.isEmpty && !password.isEmpty
    }

    private let remoteUserDataSourceImpl = RemoteUserDataSourceImpl()

    func signinButtonDidTap() {
        guard isSigninEnabled else { return }
        print("\(SignInRequestDTO(accountId: id, password: password))")
        addCancellable(
            remoteUserDataSourceImpl.signin(
                req: SignInRequestDTO(
                    accountId: id,
                    password: password
                )
            )
        ) { [weak self] _ in
            self?.isSuccessSignin = true
        }
    }

}
