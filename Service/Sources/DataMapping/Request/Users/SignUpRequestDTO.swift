import Foundation

public struct SignUpRequestDTO: Codable {
    let phoneNumber: String
    let accountId: String
    let password: String

    enum CondingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case accountId = "account_id"
        case password
    }
}
