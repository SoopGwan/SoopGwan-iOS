import Foundation

public struct SignUpRequestDTO: Codable {
    public init(
        phoneNumber: String,
        accountId: String,
        password: String
    ) {
        self.phoneNumber = phoneNumber
        self.accountId = accountId
        self.password = password
    }

    public let phoneNumber: String
    public let accountId: String
    public let password: String
}
