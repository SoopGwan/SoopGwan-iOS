import SwiftUI

struct SetBackButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 18, height: 16)
                    }
                    .foregroundColor(.black)
                    .padding()
                }
            }
    }
}

extension View {
    func setBackbutton() -> some View {
        modifier(SetBackButtonModifier())
    }
}
