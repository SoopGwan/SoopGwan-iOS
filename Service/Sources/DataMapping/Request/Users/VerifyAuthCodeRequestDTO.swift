import Foundation

public struct VerifyAuthCodeRequestDTO: Codable {
    let phoneNumber: String
    let code: String

    enum CondingKeys: String, CodingKey {
        case phoneNUmber = "phone_number"
        case code
    }
}
