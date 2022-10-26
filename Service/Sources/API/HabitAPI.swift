import Foundation
import Moya

public enum HabitAPI {
    case createHabit(content: CreateHabitRequestDTO)
    case deleteHabit(id: Int)
    case fetchHabitToWeek(startAt: String, endAt: String)
    case checkHabitIsSucceed(id: String)
    case fetchAllHabit
    case checkHabitToWeek(req: CheckHabitToWeekRequestDTO)
}

extension HabitAPI: SoopGwanAPI {
    public var domain: SoopGwanDomain {
        .habit
    }
    
    public var urlPath: String {
        switch self {
        case .createHabit:
            return "/"
        case let .deleteHabit(id):
            return "/\(id)"
        case .fetchHabitToWeek:
            return "/week"
        case .checkHabitIsSucceed:
            return "/success/check"
        case .fetchAllHabit:
            return "/"
        case .checkHabitToWeek:
            return "/check"
        }
    }
    
    public var errorMap: [Int : SoopGwanError] {
        switch self {
        case .createHabit, .fetchHabitToWeek, .fetchAllHabit:
            return [
                400: .badRequest,
                500: .serverError
            ]

        case .deleteHabit, .checkHabitIsSucceed, .checkHabitToWeek:
            return [
                400: .badRequest,
                404: .notFound,
                500: .serverError
            ]
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .checkHabitToWeek, .checkHabitIsSucceed:
            return .patch
        case .createHabit:
            return .post
        case .fetchAllHabit, .fetchHabitToWeek:
            return .get
        case .deleteHabit:
            return .delete
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case let .createHabit(content):
            return .requestJSONEncodable(content)
        case let .fetchHabitToWeek(startAt, endAt):
            return .requestParameters(parameters: [
                "start_at": startAt,
                "end_at": endAt
            ], encoding: URLEncoding.queryString)
        case let .checkHabitToWeek(req):
            return .requestJSONEncodable(req)
        default:
            return .requestPlain
        }
    }
    
    public var jwtTokenType: JwtTokenType {
        return .accessToken
    }
}
