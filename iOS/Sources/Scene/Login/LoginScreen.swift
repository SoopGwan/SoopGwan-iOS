import SwiftUI

struct LoginScreen: View {
    @State var id: String = ""
    @State var password: String = ""
    @State var isAutoLogin: Bool = false

    var body: some View {
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
                AuthTextField("아이디", isSecret: false, text: $id)
                    .padding(.bottom, 25)
                AuthTextField("비밀번호", isSecret: true, text: $password)
                    .padding(.bottom, 40)
                HStack(alignment: .center) {
                    Button {
                        isAutoLogin.toggle()
                    } label: {
                        Image(systemName: isAutoLogin ? "checkmark.circle.fill" : "checkmark.circle")
                            .resizable()
                            .foregroundColor(Color("66A865"))
                            .frame(width: 24, height: 24)
                    }
                    Text("자동 로그인")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color.gray)
                }
                .padding(.bottom, 30)
            }
            Button {
            } label: {
                Text("로그인")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(Color("66A865"))
                    .cornerRadius(5)
            }
            Spacer()
            HStack(alignment: .bottom, spacing: 3) {
                Spacer()
                Text("아직 회원이 아니신가요?")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
                Button {
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
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
