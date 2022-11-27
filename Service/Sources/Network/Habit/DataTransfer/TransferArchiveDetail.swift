import Foundation
extension FetchArchiveDetailResponseDTO {
    func toDomain() -> DetailHabitEntity {
        return .init(
            habits: habits,
            id: id,
            status: status
        )
    }
}
