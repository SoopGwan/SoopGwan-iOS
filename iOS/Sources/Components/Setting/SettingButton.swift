import SwiftUI

struct SettingButton: View {
    let title: String
    let color: Color
    let action: () -> Void

    init(
        title: String,
        color: Color = .black,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.color = color
        self.action = action
    }

    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 16, height: 14)
            }
            .padding(.horizontal, 18)
            .foregroundColor(color)
            .frame(height: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.gray, lineWidth: 1)
            }
        })
    }
}
