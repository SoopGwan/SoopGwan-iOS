import SwiftUI

struct AuthButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color("66A865"))
                .cornerRadius(5)
        }
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(title: "회원가입", action: { })
    }
}
