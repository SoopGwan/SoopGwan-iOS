import Foundation

public struct SendAuthCodeDTO: Codable {
    public init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }

    public let phoneNumber: String
}
