import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()

    var body: some View {
        NavigationView {
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                Spacer()
                    .frame(height: 172)
                Group {
                    Image("tree")
                        .frame(width: 60, height: 60)
                    HStack(spacing: 3) {
                        Text("삶을 바꾸는 습관,")
                            .font(.system(size: 16, weight: .semibold))
                        Text("SoopGwan")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("3D8361"))
                    }
                    .padding(.bottom, 30)
                    AuthTextField("아이디", isSecret: false, text: $viewModel.id)
                        .padding(.bottom, 25)
                    AuthTextField("비밀번호", isSecret: true, text: $viewModel.password)
                        .padding(.bottom, 40)
                    HStack(alignment: .center) {
                        CheckBok(isOn: $viewModel.isOnAutoSignin)
                        Text("자동 로그인")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color.gray)
                    }
                    .padding(.bottom, 30)
                }
                AuthButton(title: "로그인") {
                    viewModel.signinButtonDidTap()
                }
                Spacer()
                HStack(alignment: .bottom, spacing: 3) {
                    Spacer()
                    Text("아직 회원이 아니신가요?")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    NavigationLink {
                        IDAndPhoneNumBerView()
                    } label: {
                        Text("회원가입")
                            .font(.system(size: 12, weight: .regular))
                            .underline()
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 24)
            .navigationBarTitleDisplayMode(.inline)
        }
        .hideKeyboard()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
