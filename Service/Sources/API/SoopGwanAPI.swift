import Foundation
import Moya

public protocol SoopGwanAPI: TargetType, JwtAuthorizable {
    var domain: SoopGwanDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: SoopGwanError] { get }
}

public extension SoopGwanAPI {
    var baseURL: URL {
        URL(string: "http://172.20.10.8:8080")!
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
