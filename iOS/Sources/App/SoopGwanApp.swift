import SwiftUI

@main
struct SoopGwanApp: App {
    var body: some Scene {
        WindowGroup {
            TabbarView(
                mainView: HomeView(),
                achievementView: AchievementView(),
                archiveView: ArchiveView(),
                settingView: SettingView()
            )
        }
    }
}
