import SwiftUI

struct ArchiveDetailView: View {
    @State private var showModal = false
    @StateObject var viewModel = ArchiveDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    private let level: Int
    private let startAt: String
    private let endAt: String

    init(
        level: Int,
        startAt: String,
        endAt: String
    ) {
        self.level = level
        self.startAt = startAt
        self.endAt = endAt
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

            Text("\(startAt) ~ \(endAt)")
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
                    Text(viewModel.status == 0 ? "여기를 눌러 습관 평가 결과를 입력해 주세요." : "습관 실천 평가 결과")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color("4A4A4A"))

                    Spacer()
                        .frame(height: 5)

                    Text(viewModel.statusDetailMessage)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Color("999999"))

                    Spacer()
                }
                .padding(.leading, 5)

                Spacer()

                Image("Emoji-\(viewModel.status)")
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
                        content: "습관을 \(list.count)번 실천했어요"
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
            viewModel.onAppear(level: level, startAt: startAt, endAt: endAt)
        }
    }
}
