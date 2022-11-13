import Foundation
import Combine

public protocol RemoteHabitDataSource {
    func createHabit(req: CreateHabitRequestDTO) -> AnyPublisher<Void, SoopGwanError>
    func deleteHabit(id: Int) -> AnyPublisher<Void, SoopGwanError>
    func fetchHabitToWeek() -> AnyPublisher<[WeekHabitEntity], SoopGwanError>
    func checkHabitIsSucceed(id: String) -> AnyPublisher<Void, SoopGwanError>
    func fetchAllHabit() -> AnyPublisher<[ArchiveHabitEntity], SoopGwanError>
    func checkHabitToWeek(req: CheckHabitToWeekRequestDTO) -> AnyPublisher<Void, SoopGwanError>
}