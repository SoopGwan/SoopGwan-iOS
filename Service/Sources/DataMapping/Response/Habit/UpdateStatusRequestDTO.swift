import Foundation

public struct UpdateStatusRequestDTO: Codable {
    public init(id: Int, status: Int) {
        self.id = id
        self.status = status
    }
    
    public let id, status: Int
}
