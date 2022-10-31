import SwiftUI

@main
struct SoopGwanApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                mainView: MainView(),
                achievementView: AchievementView(),
                archiveView: ArchiveView(),
                settingView: SettingView()
            )
        }
    }
}
