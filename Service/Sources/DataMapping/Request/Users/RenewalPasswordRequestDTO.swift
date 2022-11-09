import Foundation

public struct RenewalPasswordRequestDTO: Codable {
    let password: String
    let newPassword: String

    enum CondingKeys: String, CodingKey {
        case password
        case newPassword = "new_password"
    }
}
