import SwiftUI

struct PasswordView: View {
    @State var id: String
    @State var phoneNumber: String

    @StateObject var viewModel = PasswordViewModel()

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Spacer()
                .frame(height: 23)
            Image("tree")
                .frame(width: 60, height: 60)
            HStack(spacing: 3) {
                Text("비밀번호 입력")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.bottom, 24)
            AuthTextField("비밀번호", isSecret: true, text: $viewModel.password)
                .padding(.bottom, 24)
            AuthTextField("비밀번호 확인", isSecret: true, text: $viewModel.verifyPassword)
            Spacer()
            AuthButton(text: "회원가입", action: { })
        }
        .padding(.horizontal, 24)
        .setBackbutton()
        .hideKeyboard()
        .navigationBarTitleDisplayMode(.inline)
    }
}
