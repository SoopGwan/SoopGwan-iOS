import SwiftUI

struct IDAndPhoneNumBerView: View {
    @State var id: String = ""
    @State var phoneNumber: String = ""

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
            AuthNavigationLink(title: "다음") {
                AuthCodeView()
            }
        }
        .padding(.horizontal, 24)
        .setBackbutton()
        .hideKeyboard()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        IDAndPhoneNumBerView()
    }
}
