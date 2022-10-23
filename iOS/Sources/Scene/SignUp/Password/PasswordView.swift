import SwiftUI

struct PasswordView: View {
    @State var password: String = ""
    @State var verifyPassword: String = ""

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
            AuthTextField("비밀번호", isSecret: true, text: $password)
                .padding(.bottom, 24)
            AuthTextField("비밀번호 확인", isSecret: true, text: $verifyPassword)
            Spacer()
            AuthButton(title: "회원가입", action: { })
        }
        .padding(.horizontal, 24)
        .setBackbutton()
        .hideKeyboard()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
