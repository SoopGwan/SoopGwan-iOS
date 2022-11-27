import SwiftUI
import Service
import Combine

final class ArchiveDetailViewModel: BaseViewModel {
    private let id: Int = 0
    private let level: Int = 0
    private let date: String = ""

    @Published var list: [DetailHabitDTO] = []
    @Published var detailMessage = ""
    @Published var statusDetailMessage: String = ""
    @Published var status: Int = 0
    @Published var statusSheetPresented: Bool = false

    var allDoneCount: Int = 0
    var notDoneCount: Int = 0

    private let remoteHabitDataSourceImpl = RemoteHabitDataSourceImpl()
    func onAppear(level: Int, startAt: String, endAt: String) {
        self.allDoneCount = 0
        self.notDoneCount =  0

        addCancellable(
            remoteHabitDataSourceImpl
                .fetchArciveDetail(
                    startAt: startAt,
                    endAt: endAt
                )
        ) { [weak self] detail in
            withAnimation {
                detail.habits.forEach {
                    if $0.count == 7 { self?.allDoneCount += 1 }
                    if $0.count == 0 { self?.notDoneCount += 1 }
                }

                self?.detailMessage = """
                    일주일 동안 빠짐없이 실천한 습관은 \(self?.allDoneCount ?? 0)개 입니다.
                    습관 \(self?.notDoneCount ?? 0)개는 한번도 실천하지 않았습니다.
                    일주일간 고생 많으셨습니다.
                    화이팅입니다!
                    """

                self?.status = detail.status
                self?.statusDetailMessage = self?.intToStatusDetailMessage(status: detail.status) ?? ""
                self?.list = detail.habits
            }
        }
    }

    func intToStatusDetailMessage(status: Int) -> String {
        switch status {
        case 0:
            return "여기를 눌러 습관을 평가해 주세요."
        case 1:
            return "기분이 좋아요!"
        case 2:
            return "놀라운 기분이에요!"
        case 3:
            return "분노가 차올라요"
        case 4:
            return "기분이 슬퍼요 ㅜ"
        default:
            return "뭔가 잘못되었어요"
        }
    }
}
