import SwiftUI

struct AchievementCellView: View {
    let title: String
    let content: String

    init(
        title: String,
        content: String
    ) {
        self.title = title
        self.content = content
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color("555555"))

                Spacer()
                    .frame(height: 4)

                Text(content)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color("999999"))
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(height: 80)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color("2F6149"), lineWidth: 2)
        }
    }
}
