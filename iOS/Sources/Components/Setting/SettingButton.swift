import SwiftUI

struct SettingButton<Destination>: View where Destination: View {
    let title: String
    let color: Color
    let destination: () -> Destination

    init(
        title: String,
        color: Color = .black,
        destination: @escaping () -> Destination
    ) {
        self.title = title
        self.color = color
        self.destination = destination
    }

    var body: some View {
        NavigationLink(destination: destination) {
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
            }
    }
}
