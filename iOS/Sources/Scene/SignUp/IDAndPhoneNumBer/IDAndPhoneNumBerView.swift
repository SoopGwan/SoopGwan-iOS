import SwiftUI

struct IDAndPhoneNumBerView: View {
    @StateObject var viewModel = IDAndPhoneNumBerViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 23)

            Image("tree")
                .frame(width: 60, height: 60)

            HStack(spacing: 3) {
                Text("SoopGwan")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color("3D8361"))

                Text("회원가입")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.bottom, 24)

            AuthTextField("아이디", isSecret: false, text: $viewModel.id)
                .padding(.bottom, 30)

            AuthTextField("전화번호", isSecret: false, text: $viewModel.phoneNumber)
                .keyboardType(.numberPad)

            Spacer()
            AuthButton(text: "다음") {
                viewModel.nextButtonDidTap()
            }
            .disabled(!viewModel.isNextEnabled)
        }
        .padding(.horizontal, 24)
        .hideKeyboard()
        .soopGwanToast(isShowing: $viewModel.isShowingToast, message: "아이디가 중복되었어요.", style: .error)
        .navigate(
            to: AuthCodeView(
                id: viewModel.id,
                phoneNumber: viewModel.phoneNumber
            ),
            when: $viewModel.isSuccessNext
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}
