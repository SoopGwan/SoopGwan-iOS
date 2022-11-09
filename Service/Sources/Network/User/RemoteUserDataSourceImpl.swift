import Combine

public final class RemoteUserDataSourceImpl: BaseRemoteDataSource<UserAPI>, RemoteUserDataSource {
    public func signin(req: SignInRequestDTO) -> AnyPublisher<Void, SoopGwanError> {
        request(.signin(req: req))
            .eraseToAnyPublisher()
    }

    public func signup(req: SignUpRequestDTO) -> AnyPublisher<Void, SoopGwanError> {
        request(.signup(req: req))
            .eraseToAnyPublisher()
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, SoopGwanError> {
        request(.verifyAuthCode(req: req))
            .eraseToAnyPublisher()
    }

    public func checkAccountIDIsExist(accountID: String) -> AnyPublisher<Void, SoopGwanError> {
        request(.checkAccountIDIsExist(accountID: accountID))
            .eraseToAnyPublisher()
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, SoopGwanError> {
        request(.renewalPassword(req: req))
            .eraseToAnyPublisher()
    }
}
