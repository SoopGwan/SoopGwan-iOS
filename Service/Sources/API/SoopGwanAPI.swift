import Foundation
import Moya

public protocol SoopGwanAPI: TargetType, JwtAuthorizable {
    var domain: SoopGwanDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: SoopGwanError] { get }
}

public extension SoopGwanAPI {
    var baseURL: URL {
        URL(string: "https://google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
}

public enum SoopGwanDomain: String {
    case users
    case habit
}

extension SoopGwanDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
