import SwiftUI

struct ArchiveDetailView: View {
    private let id: Int
    private let level: Int
    private let date: String

    @StateObject var viewModel = ArchiveDetailViewModel()
    init(
        id: Int,
        level: Int,
        date: String
    ) {
        self.id = id
        self.level = level
        self.date = date
    }

    var body: some View {
        Text("")
            .onAppear {
                viewModel.onAppear(id: id, level: level, date: date)
            }
    }
}
