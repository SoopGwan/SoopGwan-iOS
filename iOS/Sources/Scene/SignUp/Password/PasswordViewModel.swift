import Combine
import Service

final class PasswordViewModel: BaseViewModel {
    @Published var password: String = ""
    @Published var verifyPassword: String = ""
    @Published var isSuccessSignup = false

    @Published var isSuccessAlert: Bool = false
    @Published var isSuccessMessage: String = ""
    var isSignUpEnabled: Bool {
        !password.isEmpty && !verifyPassword.isEmpty
    }

    private let remoteUserDataSourceImpl = RemoteUserDataSourceImpl()

    func signUpButtonPressed(id: String, phoneNumber: String) {
        print(phoneNumber, id, password)
        addCancellable(
            remoteUserDataSourceImpl.signup(
                req: .init(
                    phoneNumber: phoneNumber,
                    accountId: id,
                    password: password
                )
            )
        ) { [weak self] _ in
            self?.isSuccessAlert.toggle()
            self?.isSuccessMessage = "회원가입이 완료되었습니다."
            self?.isSuccessSignup = true
        }
    }
}
