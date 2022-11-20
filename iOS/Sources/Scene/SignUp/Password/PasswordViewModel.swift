import Combine
import Service

final class PasswordViewModel: BaseViewModel {
    @Published var password: String = ""
    @Published var verifyPassword: String = ""
    @Published var isSuccessSignup = false

    var isSignUpEnabled: Bool {
        !password.isEmpty && !verifyPassword.isEmpty
    }

    private let remoteUserDataSourceImpl = RemoteUserDataSourceImpl()

    func signUpButtonPressed(id: String, phoneNumber: String) {
        addCancellable(
            remoteUserDataSourceImpl.signup(
                req: .init(
                    phoneNumber: phoneNumber,
                    accountId: id,
                    password: password
                )
            )
        ) { [weak self] _ in
            self?.isSuccessSignup = true
        }
    }
}
