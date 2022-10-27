import Foundation

public struct SignInRequestDTO: Codable {
    let accountId: String
    let password: String
    
    enum CondingKeys: String, CodingKey {
        case accountId = "account_id"
        case password
    }
}
