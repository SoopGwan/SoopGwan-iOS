import Foundation

public struct SignUpRequestDTO: Codable {
    let phoneNumber: String
    let accountId: String
    let password: String
}
