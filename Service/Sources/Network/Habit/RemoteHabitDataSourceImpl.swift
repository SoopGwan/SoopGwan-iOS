import Combine

public final class RemoteHabitDataSourceImpl: BaseRemoteDataSource<HabitAPI>, RemoteHabitDataSource {
    public func createHabit(req: CreateHabitRequestDTO) -> AnyPublisher<Void, SoopGwanError> {
        request(.createHabit(req: req))
            .eraseToAnyPublisher()
    }

    public func deleteHabit(id: Int) -> AnyPublisher<Void, SoopGwanError> {
        request(.deleteHabit(id: id))
            .eraseToAnyPublisher()
    }

    public func fetchHabitToWeek() -> AnyPublisher<[WeekHabitEntity], SoopGwanError> {
        request(.fetchHabitToWeek, dto: FetchHabitToWeekResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func checkHabitIsSucceed(id: Int) -> AnyPublisher<Void, SoopGwanError> {
        request(.checkHabitIsSucceed(id: id))
            .eraseToAnyPublisher()
    }

    public func fetchAllHabit() -> AnyPublisher<[ArchiveHabitEntity], SoopGwanError> {
        request(.fetchAllHabit, dto: FetchArchiveHabitResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func checkHabitToWeek(req: CheckHabitToWeekRequestDTO) -> AnyPublisher<Void, SoopGwanError> {
        request(.checkHabitToWeek(req: req))
            .eraseToAnyPublisher()
    }

    public func fetchArciveDetail(startAt: String, endAt: String) -> AnyPublisher<DetailHabitEntity, SoopGwanError> {
        request(.fetchArchiveDetail(startAt: startAt, endAt: endAt), dto: FetchArchiveDetailResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
