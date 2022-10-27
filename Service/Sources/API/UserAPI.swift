import Moya
import Foundation

public enum UserAPI {
    case signin(content: SignInRequestDTO)
    case signup(content: SignUpRequestDTO)
    case verifyAuthCode(content: VerifyAuthCodeRequestDTO)
    case sendAuthCode(content: SendAuthCodeDTO)
    case checkAccountIDIsExist(accountID: String)
    case renewalPassword(content: RenewalPasswordRequestDTO)
}

extension UserAPI: SoopGwanAPI {
    public var domain: SoopGwanDomain {
        .users
    }

    public var urlPath: String {
        switch self {
        case .signin:
            return "/login"
        case .signup:
            return "/signup"
        case .verifyAuthCode:
            return "/verify"
        case.sendAuthCode:
            return "/send"
        case let .checkAccountIDIsExist(accountID):
            return "/check/\(accountID)"
        case .renewalPassword:
            return "/change"
        }
    }

    public var errorMap: [Int : SoopGwanError] {
        switch self {
        case .signin, .verifyAuthCode:
            return [
                400: .badRequest,
                401: .unauthorized,
                404: .notFound,
                500: .serverError
            ]
        case .signup:
            return [
                400: .badRequest,
                409: .conflict,
                500: .serverError
            ]
        case .sendAuthCode:
            return [
                400: .badRequest,
                429: .toManyRequests,
                500: .serverError
            ]
        case .checkAccountIDIsExist, .renewalPassword:
            return [
                409: .conflict,
                500: .serverError
            ]
        }
    }

    public var method: Moya.Method {
        switch self {
        case .signin, .signup, .verifyAuthCode, .sendAuthCode:
            return .post
        case .checkAccountIDIsExist:
            return .options
        case .renewalPassword:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .signin(content):
            return .requestJSONEncodable(content)
        case let .signup(content):
            return .requestJSONEncodable(content)
        case let .verifyAuthCode(content):
            return .requestJSONEncodable(content)
        case let .sendAuthCode(content):
            return .requestJSONEncodable(content)
        case let .renewalPassword(content):
            return .requestJSONEncodable(content)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .renewalPassword:
            return .accessToken
        default:
            return .none
        }
    }
}
