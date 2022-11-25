import Foundation
extension FetchArchiveDetailResponseDTO {
    func toDomain() -> DetailHabitEntity {
        return .init(
            habits: habits,
            status: status
        )
    }
}
