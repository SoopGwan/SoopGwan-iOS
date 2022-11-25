import SwiftUI

struct DropdownButton: View {
    private let dropdownCornerRadius: CGFloat = 8.0

    @State var shouldShowDropdown = false
    @Binding var displayText: String
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    let buttonHeight: CGFloat = 36
    var body: some View {
        Button {
            self.shouldShowDropdown.toggle()
        } label: {
            HStack {
                Text(displayText)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("3D8361"))

                Spacer()
                    .frame(width: 8)
                Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down")
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 8)
        .cornerRadius(dropdownCornerRadius)
        .frame(height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color("3D8361"), lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 5)
                    dropdown()
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: dropdownCornerRadius).fill(Color.white)
        )
    }

    @ViewBuilder
    func dropdown() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id: \.self) { option in
                dropdownOptionElement(
                    val: option.val,
                    key: option.key
                )
            }
        }
        .background(Color.white)
        .cornerRadius(dropdownCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color("3D8361"), lineWidth: 1)
        )
    }

    @ViewBuilder
    func dropdownOptionElement(val: String, key: String) -> some View {
        ZStack {
            Color.white

            Button {
                if let onSelect = self.onSelect {
                    onSelect(key)
                    self.shouldShowDropdown.toggle()
                }
            } label: {
                Text(val)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("3D8361"))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }

}
