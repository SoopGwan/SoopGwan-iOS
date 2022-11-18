import SwiftUI

struct ArchiveDetailCellView: View {
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
        VStack(alignment: .leading) {
            Spacer()

            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("4A4A4A"))
                .padding(.horizontal, 12)

            Spacer()
                .frame(height: 4)

            Text(content)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(Color("999999"))
                .padding(.horizontal, 12)

            Spacer()

            Color("D9D9D9")
                .frame(height: 1)
        }
        .frame(height: 60)
    }
}
