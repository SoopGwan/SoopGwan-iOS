import SwiftUI

struct TabbarView: View {
    let mainView: HomeView
    let achievementView: AchievementView
    let archiveView: ArchiveView
    let settingView: SettingView

    var body: some View {
        TabView {
            mainView
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                        Text("홈")
                            .font(.system(size: 10, weight: .medium))
                    }
                }
            achievementView
                .tabItem {
                    VStack {
                        Image(systemName: "medal.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                        Text("업적")
                            .font(.system(size: 10, weight: .medium))
                    }
                }
            archiveView
                .tabItem {
                    VStack {
                        Image(systemName: "archivebox.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                        Text("아카이브")
                            .font(.system(size: 10, weight: .medium))
                    }
                }
            settingView
                .tabItem {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                        Text("설정")
                            .font(.system(size: 10, weight: .medium))
                    }
                }
        }
        .accentColor(Color("66A865"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(
            mainView: HomeView(),
            achievementView: AchievementView(),
            archiveView: ArchiveView(),
            settingView: SettingView()
        )
    }
}
