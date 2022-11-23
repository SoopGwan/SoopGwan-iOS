import Moya
import Foundation

public enum UserAPI {
    case signin(req: SignInRequestDTO)
    case signup(req: SignUpRequestDTO)
    case verifyAuthCode(req: VerifyAuthCodeRequestDTO)
    case sendAuthCode(req: SendAuthCodeDTO)
    case checkAccountIDIsExist(accountID: String)
    case renewalPassword(req: RenewalPasswordRequestDTO)
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
            return "/check"
        case .renewalPassword:
            return "/change"
        }
    }

    public var errorMap: [Int: SoopGwanError] {
        switch self {
        case .signin, .verifyAuthCode:
            return [
                400: .badRequest,
                401: .notPassword,
                404: .userNotFound,
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
            return .head
        case .renewalPassword:
            return .patch
        }
    }

    public var task: Moya.Task {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        switch self {
        case let .signin(content):
            return .requestCustomJSONEncodable(content, encoder: encoder)
        case let .signup(content):
            return .requestCustomJSONEncodable(content, encoder: encoder)
        case let .verifyAuthCode(content):
            return .requestCustomJSONEncodable(content, encoder: encoder)
        case let .sendAuthCode(content):
            return .requestCustomJSONEncodable(content, encoder: encoder)
        case let .checkAccountIDIsExist(accountID):
            return .requestParameters(parameters: [
                "account_id": accountID
            ], encoding: URLEncoding.queryString)
        case let .renewalPassword(content):
            return .requestCustomJSONEncodable(content, encoder: encoder)
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
