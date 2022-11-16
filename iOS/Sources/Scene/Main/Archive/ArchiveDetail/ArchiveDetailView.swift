import SwiftUI

struct ArchiveDetailView: View {
    @State private var showModal = false
    @StateObject var viewModel = ArchiveDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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
                .padding(.horizontal, 30)
                .padding(.bottom, 1)

            Text(date)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("999999"))
                .padding(.horizontal, 30)

            Spacer()
                .frame(height: 20)

            HStack {
                Image(level.levelToImageName())
                    .resizable()
                    .frame(width: 120, height: 120)

                Spacer()

                VStack(alignment: .trailing) {
                    Text(level.levelToTitle())
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color("4A4A4A"))
                        .padding(.bottom, 8)

                    Text(viewModel.detailMessage)
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Color("999999"))
                }
                .padding(.trailing, 22)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("2F6149"), lineWidth: 1)
            }
            .padding(.horizontal, 30)

            Spacer()
                .frame(height: 20)

            HStack {
                VStack(alignment: .leading) {
                    Spacer()

                    Text("습관 실천 평가 결과")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color("4A4A4A"))

                    Spacer()
                        .frame(height: 5)

                    Text("기분이 좋아요!")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Color("999999"))

                    Spacer()
                }
                .padding(.leading, 5)

                Spacer()

                Image("Emoji-1")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .padding(.horizontal, 15)
            .frame(height: 70)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("2F6149"), lineWidth: 1)
            }
            .padding(.horizontal, 30)

            Spacer()

            ScrollView(
                .vertical,
                showsIndicators: false
            ) {
                ForEach(viewModel.list, id: \.self) { list in
                    ArchiveDetailCellView(
                        title: list.title,
                        content: list.content
                    )
                    .padding(.horizontal, 30)

                }
            }

            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("아카이브로 돌아가기")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(Color("66A865"))
                    .cornerRadius(5)
            }
            .padding(.horizontal, 24)

        }
        .onAppear {
            viewModel.onAppear(id: id, level: level, date: date)
        }
    }
}
