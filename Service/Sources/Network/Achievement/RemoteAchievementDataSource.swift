import Combine

public protocol RemoteAchievementDataSource {
    func fetchAchievement() -> AnyPublisher<[AchieveListEntity], SoopGwanError>
}
