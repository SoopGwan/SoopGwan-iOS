import SwiftUI

struct AchievementAlertView: View {
    let title: String
    let content: String
    let imageName: String
    var action: () -> Void

    init(
        title: String,
        content: String,
        imageName: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.content = content
        self.imageName = imageName
        self.action = action
    }

    var body: some View {
        ZStack {
            Color.black.opacity(0.44)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.top, 40)

                Text("\(imageName)를 획득했어요!")
                    .foregroundColor(Color(uiColor: .lightGray))
                    .font(.system(size: 12, weight: .medium))
                    .padding(.top, 8)

                Image(imageName)
                    .resizable()
                    .frame(width: 200, height: 200)

                Text(content)
                .font(.system(size: 12, weight: .bold))
                .padding(.top, 20)

                Button(action: action) {
                    Text("닫기")
                        .font(.system(size: 12, weight: .medium))
                }
                .foregroundColor(Color("2F6149"))
                .padding(.vertical, 40)

            }
            .padding(.horizontal, 30)
            .background(Color.white)
            .cornerRadius(32)
            .padding(.horizontal, 39)

        }
    }
}
