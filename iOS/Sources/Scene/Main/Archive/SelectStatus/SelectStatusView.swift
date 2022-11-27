import SwiftUI

struct SelectStatusView: View {
    @StateObject var viewModel = SelectStatusViewModel()

    let startAt: String
    let endAt: String

    init(
        startAt: String,
        endAt: String
    ) {
        self.startAt = startAt
        self.endAt = endAt
    }

    var body: some View {
        VStack(alignment: .center) {
            Text("해당 날짜의 습관 실천을 평가해 주세요.")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color("555555"))
                .padding(.horizontal, 30)
                .padding(.bottom, 1)
                .padding(.top, 20)

            Text("\(startAt) ~ \(endAt)")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("999999"))
                .padding(.horizontal, 30)

            Spacer()

            HStack(spacing: 20) {
                Button {
                    viewModel.emoji1ButtonPressed()
                } label: {
                    Image(viewModel.emoji1IsSelected ? "Emoji-1" : "Emoji-1-dark")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                Button {
                    viewModel.emoji2ButtonPressed()
                } label: {
                    Image(viewModel.emoji2IsSelected ? "Emoji-2" : "Emoji-2-dark")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                Button {
                    viewModel.emoji3ButtonPressed()
                } label: {
                    Image(viewModel.emoji3IsSelected ? "Emoji-3" : "Emoji-3-dark")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                Button {
                    viewModel.emoji4ButtonPressed()
                } label: {
                    Image(viewModel.emoji4IsSelected ? "Emoji-4" : "Emoji-4-dark")
                        .resizable()
                        .frame(width: 70, height: 70)
                }

            }
            .padding(.horizontal, 30)

            Spacer()
            AuthButton(text: "완료") {
            }
            .disabled(viewModel.isDoneEnabled)
            .padding(.bottom, 20)
            .padding(.horizontal, 24)

        }
    }
}
