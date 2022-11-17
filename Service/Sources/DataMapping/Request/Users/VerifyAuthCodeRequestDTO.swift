import Foundation

public struct VerifyAuthCodeRequestDTO: Codable {
    let phoneNumber: String
    let code: String
}
