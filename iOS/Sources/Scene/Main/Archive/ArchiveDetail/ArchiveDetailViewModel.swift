import SwiftUI
import Service
import Combine

final class ArchiveDetailViewModel: BaseViewModel {
    private let id: Int = 0
    private let level: Int = 0
    private let date: String = ""

    @Published var list: [ArciveDetailEntity] = [
        .init(title: "더미데이터 입니다.", content: "습관을 실천하지 못했어요"),
        .init(title: "더미데이터 입니다.", content: "습관을 실천하지 못했어요"),
        .init(title: "더미데이터 입니다.", content: "습관을 실천하지 못했어요"),
        .init(title: "더미데이터 입니다.", content: "습관을 실천하지 못했어요"),
        .init(title: "더미데이터 입니다.", content: "습관을 실천하지 못했어요"),
        .init(title: "더미데이터 입니다.", content: "습관을 실천하지 못했어요"),
        .init(title: "더미데이터 입니다.", content: "습관을 실천하지 못했어요")
    ]
    @Published var detailMessage = """
        일주일 동안 빠짐없이 실천한 습관 2개
        습관 5개 한번 이상 실천
        습관 1개 한번도 실천하지 않음
        화이팅입니다.
        """
    func onAppear(id: Int, level: Int, date: String) {

    }
}
