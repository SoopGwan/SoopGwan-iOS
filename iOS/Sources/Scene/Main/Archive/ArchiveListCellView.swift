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
                    Text(levelToTitleString(level: level))
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

    func levelToTitleString(level: Int) -> String {
        switch level {
        case 0:
            return "죽순이 죽었어요 ㅜ"
        case 1:
            return "죽순이 성장중이에요!"
        case 2:
            return "죽순이 대나무로 성장했어요!!"
        case 3:
            return "나무가 성장중이에요!"
        case 4:
            return "분재가 나무로 성장했어요!!"
        default:
            return "너 뭐야, 너 뭐한거야"
        }
    }
}
