import SwiftUI

struct ArchiveListCellView: View {
    let content: String
    let level: Int

    init(
        content: String,
        level: Int
    ) {
        self.content = content
        self.level = level
    }

    var body: some View {
        ZStack {
            Color.white

            HStack {
                VStack(alignment: .leading) {
                    Text(level.levelToContent())
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("555555"))

                    Spacer()
                        .frame(height: 4)

                    Text(content)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("999999"))
                }

                Spacer()

                Image("lv\(level)")
                    .resizable()
                    .frame(width: 50, height: 50 )
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 80)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color("6F6F70"), lineWidth: 1)
        }
    }
}
