import SwiftUI

struct AchievementAlertView: View {
    var action: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.44)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("하루에 하나 이상 1달간 습관 실천하기")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.top, 40)
                Text("2022-01-01 달성")
                    .foregroundColor(Color(uiColor: .lightGray))
                    .font(.system(size: 12, weight: .medium))
                    .padding(.top, 8)
                Image("test")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("""
                     앗! Premium 금고를 획득했어요!
                     1달간 꾸준히 습관을 실천한다는 것은 정말 대단한 것이에요.
                     자 그럼 이제 금고를 가져가세요.
                     아! 말 안한게 있었네요.  비밀번호는 몰라요.
                """)
                .font(.system(size: 12, weight: .bold))
                .padding(.top, 20)
                Button(action: action) {
                    Text("닫기")
                        .font(.system(size: 12, weight: .medium))
                }
                .foregroundColor(Color("2F6149"))
                .padding(.vertical, 40)
            }
            .frame(width: .infinity)
            .padding(.horizontal, 39)
            .background(Color.white)
            .cornerRadius(32)
        }
    }
}
