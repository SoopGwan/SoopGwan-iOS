import SwiftUI
import Service
import Combine

final class ArchiveDetailViewModel: BaseViewModel {
    private let id: Int = 0
    private let level: Int = 0
    private let date: String = ""

    @Published var list: [ArciveDetailEntity] = [
        .init(title: "일어나서 물 먹기", content: "습관을 실천하지 못했어요"),
        .init(title: "잠 일찍 자기.", content: "습관을 2번 실천했어요"),
        .init(title: "책 하루 10장 읽기.", content: "습관을 모두 실천했어요"),
        .init(title: "10분간 명상하기.", content: "습관을 1번 실천했어요"),
        .init(title: "숙제 밀리지 않기.", content: "습관을 모두 실천했어요"),
        .init(title: "운동 30분 이상 하기.", content: "습관을 6번 실천했어요"),
        .init(title: "기숙사 방 청소 하기.", content: "습관을 3번 실천했어요")
    ]
    @Published var detailMessage = """
        일주일 동안 빠짐없이 실천한 습관 1개
        한번도 실천하지 않은 습관 2개
        화이팅입니다.
        """
    func onAppear(id: Int, level: Int, date: String) {

    }
}
