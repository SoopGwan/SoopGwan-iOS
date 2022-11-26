import Foundation
import Moya

public enum AchievementAPI {
    case fetchAchievement
}

extension AchievementAPI: SoopGwanAPI {
    public var domain: SoopGwanDomain {
        .achieve
    }

    public var urlPath: String {
        switch self {
        case .fetchAchievement:
            return "/"
        }
    }

    public var errorMap: [Int: SoopGwanError] {
        switch self {
        case .fetchAchievement:
            return [
                401: .unauthorized,
                404: .notFound,
                500: .serverError
            ]
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchAchievement:
            return .get
        }
    }

    public var task: Moya.Task {
        return .requestPlain
    }

    public var jwtTokenType: JwtTokenType {
        return .accessToken
    }
}
