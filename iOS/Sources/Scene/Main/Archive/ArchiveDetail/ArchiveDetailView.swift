import SwiftUI

struct ArchiveDetailView: View {
    @State private var showModal = false
    @StateObject var viewModel = ArchiveDetailViewModel()

    private let id: Int
    private let level: Int
    private let date: String

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
        VStack {
            Spacer()
                .frame(height: 32)

            Text(level.levelToContent())
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color("555555"))

            Text(date)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color("999999"))
            Spacer()
                .frame(height: 20)

            HStack {
                Image(level.levelToImageName())
                    .resizable()
                    .frame(width: 120, height: 120)

                Spacer()

                VStack {
                    Text(level.levelToTitle())
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("4A4A4A"))
                        .padding(.bottom, 8)

                    Text(viewModel.detailMessage)
                        .font(.system(size: 8, weight: .medium))
                        .foregroundColor(Color("999999"))
                }
                .padding(.trailing, 22)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("2F6149"), lineWidth: 1)
            }

            Spacer()
        }
        .padding(.horizontal, 30)
        .onAppear {
            viewModel.onAppear(id: id, level: level, date: date)
        }
    }
}
