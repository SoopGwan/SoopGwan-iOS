import SwiftUI

@main
struct SoopGwanApp: App {
    var body: some Scene {
        WindowGroup {
//            SignInView()
            TabbarView(
                mainView: HomeView(),
                achievementView: AchievementView(),
                archiveView: ArchiveListView(),
                settingView: SettingView()
            )
        }
    }
}
