import SwiftUI

struct IDAndPhoneNumBerView: View {
    @State var id: String = ""
    @State var phoneNumber: String = ""
    @State var buttonPressed: Bool = false

    var isButtonEnabled: Bool {
        !id.isEmpty && !phoneNumber.isEmpty
    }

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

            AuthTextField("아이디", isSecret: false, text: $id)
                .padding(.bottom, 30)

            AuthTextField("전화번호", isSecret: false, text: $phoneNumber)
                .keyboardType(.numberPad)

            Spacer()
            AuthButton(text: "다음") {
                buttonPressed.toggle()
            }
            .disabled(!isButtonEnabled)
        }
        .padding(.horizontal, 24)
        .hideKeyboard()
        .navigate(to: AuthCodeView(id: id, phoneNumber: phoneNumber), when: $buttonPressed)
        .navigationBarTitleDisplayMode(.inline)
    }
}
