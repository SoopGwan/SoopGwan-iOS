import Foundation
import Moya

public enum HabitAPI {
    case createHabit(req: CreateHabitRequestDTO)
    case deleteHabit(id: Int)
    case fetchHabitToWeek
    case checkHabitIsSucceed(id: Int)
    case fetchAllHabit
    case checkHabitToWeek(req: CheckHabitToWeekRequestDTO)
    case fetchArchiveDetail(startAt: String, endAt: String)
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
        case let .checkHabitIsSucceed(id):
            return "/day/check/\(id)"
        case .fetchAllHabit:
            return "/"
        case .checkHabitToWeek:
            return "/check"
        case .fetchArchiveDetail:
            return "/details"
        }
    }

    public var errorMap: [Int: SoopGwanError] {
        switch self {
        case .createHabit, .fetchHabitToWeek, .fetchAllHabit, .fetchArchiveDetail:
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
        case .fetchAllHabit, .fetchHabitToWeek, .fetchArchiveDetail:
            return .get
        case .deleteHabit:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .createHabit(content):
            return .requestJSONEncodable(content)
        case let .checkHabitToWeek(content):
            return .requestJSONEncodable(content)
        case let .fetchArchiveDetail(startAt, endAt):
            return .requestParameters(parameters: [
                "start_at": startAt,
                "end_at": endAt
            ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        return .accessToken
    }
}
