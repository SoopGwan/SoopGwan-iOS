import SwiftUI

struct AuthCodeView: View {
    @State var authCode: String = ""
    @State var buttonPressed: Bool = false

    var isButtonEnabled: Bool {
        !authCode.isEmpty
    }

    @State var id: String
    @State var phoneNumber: String

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
                Text("입력하신 전화번호로\n인증번호가 전송되었습니다.")
                    .font(.system(size: 16, weight: .semibold))
            }
            Spacer()
                .frame(minHeight: 30, idealHeight: 95, maxHeight: 95)
            OTPView(text: $authCode)
                .padding(.bottom, 87)
            HStack {
                Spacer()
                VStack {
                    Button {
                    } label: {
                        Text("인증코드 재전송")
                            .font(.system(size: 14, weight: .regular))
                            .padding(.bottom, 22)
                            .foregroundColor(Color("66A865"))
                    }
                    Text("문자로 전송된 인증코드 4자리를 입력해주세요.")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            Spacer()
            AuthButton(text: "다음") {
                buttonPressed.toggle()
            }
            .disabled(!isButtonEnabled)
        }
        .hideKeyboard()
        .navigate(
            to: PasswordView(
                id: id,
                phoneNumber: phoneNumber
            ),
            when: $buttonPressed
        )
        .padding(.horizontal, 24)
    }
}
