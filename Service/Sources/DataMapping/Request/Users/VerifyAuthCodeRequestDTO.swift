import Foundation

public struct VerifyAuthCodeRequestDTO: Codable {
    public let phoneNumber: String
    public let code: String

    public init(
        phoneNumber: String,
        code: String
    ) {
        self.phoneNumber = phoneNumber
        self.code = code
    }
}
