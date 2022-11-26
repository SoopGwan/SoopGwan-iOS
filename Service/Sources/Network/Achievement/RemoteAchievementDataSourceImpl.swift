import Foundation
import Combine

public final class RemoteAchievementDataSourceImpl: BaseRemoteDataSource<AchievementAPI>, RemoteAchievementDataSource {
    public func fetchAchievement() -> AnyPublisher<[AchieveListEntity], SoopGwanError> {
        request(.fetchAchievement, dto: FetchAchievementDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
