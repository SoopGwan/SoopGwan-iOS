import Foundation

public struct SignInRequestDTO: Encodable {
    public let accountId: String
    public let password: String

    public init(
        accountId: String,
        password: String
    ) {
        self.accountId = accountId
        self.password = password
    }
}
