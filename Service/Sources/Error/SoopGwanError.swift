import Foundation

public enum SoopGwanError: Error {
    // MARK: users
    case badRequest
    case unauthorized
    case notFound
    case conflict
    case toManyRequests
    case serverError
}
