import Combine
import Foundation

public protocol RemoteUserDataSource {
    func signin(req: SignInRequestDTO) -> AnyPublisher<Void, SoopGwanError>
    func signup(req: SignUpRequestDTO) -> AnyPublisher<Void, SoopGwanError>
    func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, SoopGwanError>
    func checkAccountIDIsExist(accountID: String) -> AnyPublisher<Void, SoopGwanError>
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, SoopGwanError>
}
