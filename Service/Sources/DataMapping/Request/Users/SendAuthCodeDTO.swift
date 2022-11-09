import Foundation

public struct SendAuthCodeDTO: Codable {
    let phoneNumber: String

    enum CondingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
    }
}
