import Foundation

public struct RenewalPasswordRequestDTO: Codable {
    public let password: String
    public let newPassword: String

    public init(
        password: String,
        newPassword: String
    ) {
        self.password = password
        self.newPassword = newPassword
    }

    enum CondingKeys: String, CodingKey {
        case password
        case newPassword = "new_password"
    }
}
