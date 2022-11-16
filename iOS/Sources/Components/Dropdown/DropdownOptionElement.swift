import SwiftUI

struct DropdownOptionElement: View {
    private let dropdownCornerRadius: CGFloat = 8.0

    var val: String
    var key: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        ZStack {
            Color.white

            Button {
                if let onSelect = self.onSelect {
                    onSelect(self.key)
                }
            } label: {
                Text(self.val)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("3D8361"))
            }
        }
    .padding(.horizontal, 20)
    .padding(.vertical, 5)
    }
}
