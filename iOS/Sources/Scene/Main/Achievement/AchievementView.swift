import SwiftUI

struct AchievementView: View {
    @State var isAlertShow: Bool = false

    var body: some View {
        ZStack {
            Button {
                self.isAlertShow = true
            } label: {
                Text("업적 화면입니다.")
            }
            if isAlertShow {
                AchievementAlertView {
                    self.isAlertShow.toggle()
                }
            }
        }
    }
}

struct AchieveView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView()
    }
}
