import SwiftUI
import Service
import Combine

final class SelectStatusViewModel: BaseViewModel {
    var selectedEmojiNumber: Int = 0

    @Published var emoji1IsSelected: Bool = false
    @Published var emoji2IsSelected: Bool = false
    @Published var emoji3IsSelected: Bool = false
    @Published var emoji4IsSelected: Bool = false

    @Published var dissmiss: Bool = false

    var isDoneEnabled: Bool {
        selectedEmojiNumber == 0
    }
    func emoji1ButtonPressed() {
        selectedEmojiNumber = 1
        emoji1IsSelected = true
        emoji2IsSelected = false
        emoji3IsSelected = false
        emoji4IsSelected = false
    }
    func emoji2ButtonPressed() {
        selectedEmojiNumber = 2
        emoji1IsSelected = false
        emoji2IsSelected = true
        emoji3IsSelected = false
        emoji4IsSelected = false
    }
    func emoji3ButtonPressed() {
        selectedEmojiNumber = 3
        emoji1IsSelected = false
        emoji2IsSelected = false
        emoji3IsSelected = true
        emoji4IsSelected = false
    }
    func emoji4ButtonPressed() {
        selectedEmojiNumber = 4
        emoji1IsSelected = false
        emoji2IsSelected = false
        emoji3IsSelected = false
        emoji4IsSelected = true
    }

    private let remoteHabitDataSourceImpl = RemoteHabitDataSourceImpl()

    func doneButtonPressed(id: Int, status: Int) {
        print(id, status)
        addCancellable(
            remoteHabitDataSourceImpl
                .updateStatus(
                    req: .init(id: id, status: status)
                )
        ) { [weak self] _ in
            self?.dissmiss = true
        }
    }
}
