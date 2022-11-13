import SwiftUI

struct AchievementView: View {
    @StateObject var viewModel = AchievementViewModel()
    var body: some View {
        ZStack {
            Button {
                self.isAlertShow = true
            } label: {
                Text("업적 화면입니다.")
            }
                AchievementAlertView {
                    self.isAlertShow.toggle()
                }
            }
        }
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Achievement")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color("3D8361"))
                        Spacer()
                }
                .padding(.top, 10)
                ScrollView(.vertical) {
                    ForEach(viewModel.list, id: \.self) { list in
                        AchievementCellView(
                            title: list.title,
                            content: list.date) {
                                HomeView()
                            }
                    }
                }
            }
                            .padding(.horizontal, 20)
        }
    }
}

struct AchieveView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView()
    }
}
