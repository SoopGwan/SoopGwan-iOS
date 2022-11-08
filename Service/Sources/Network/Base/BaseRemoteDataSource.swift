import Combine
import CombineMoya
import Foundation
import Moya

public class BaseRemoteDataSource<API: SoopGwanAPI> {
    private let keychain: any Keychain
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 2

    public init(
        keychain: any Keychain,
        provider: MoyaProvider<API>? = nil
    ) {
        self.keychain = keychain

        #if DEBUG
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain), NetworkLoggerPlugin()])
        #else
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain)])
        #endif
    }

    public func request<T: Decodable>(_ api: API, dto: T.Type) -> AnyPublisher<T, SoopGwanError> {
        requestPublisher(api).map(dto, using: decoder)
    }

    public func request(_ api: API) -> AnyPublisher<Void, SoopGwanError> {
        requestPublisher(api)
            .map { _ in return }
            .eraseToAnyPublisher()
    }

    private func requestPublisher(_ api: API) -> AnyPublisher<Response, SoopGwanError> {
        return checkIsApiNeedsAuthorization(api) ?
            authorizedRequest(api) :
            defaultRequest(api)
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) -> AnyPublisher<Response, SoopGwanError> {
        return provider.requestPublisher(api, callbackQueue: .main)
            .retry(maxRetryCount)
            .timeout(45, scheduler: DispatchQueue.main)
            .mapError { api.errorMap[$0.errorCode] ?? .unknown }
            .eraseToAnyPublisher()
    }

    func authorizedRequest(_ api: API) -> AnyPublisher<Response, SoopGwanError> {
        return defaultRequest(api)
    }

    func checkIsApiNeedsAuthorization(_ api: API) -> Bool {
        api.jwtTokenType == .accessToken
    }
}
