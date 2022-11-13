import SwiftUI

struct AchievementView: View {
    @StateObject var viewModel = AchievementViewModel()
    @State var isAlertShow: Bool = false

    var body: some View {
        ZStack {
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
                        Button {
                            withAnimation(Animation.linear) {
                                self.isAlertShow = true
                            }

                        } label: {
                            AchievementCellView(
                                title: list.title,
                                content: list.date
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 20)

            if isAlertShow {
                AchievementAlertView {
                    withAnimation(Animation.linear) {
                        self.isAlertShow.toggle()
                    }
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
