import SwiftUI

struct AchievementView: View {
    @StateObject var viewModel = AchievementViewModel()

    @State var isAlertShow: Bool = false
    @State var alertTitle: String = ""
    @State var alertImageName: String = ""
    @State var alertContent: String = ""

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
                            alertTitle = list.title
                            alertImageName = list.imageName
                            alertContent = list.content

                            withAnimation(Animation.linear) {
                                self.isAlertShow = true
                            }

                        } label: {
                            AchievementCellView(
                                title: list.title,
                                content: "\(list.imageName)를 획득했어요!"
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 20)

            if isAlertShow {
                AchievementAlertView(
                    title: alertTitle,
                    content: alertContent,
                    imageName: alertImageName
                ) {
                    withAnimation(Animation.linear) {
                        self.isAlertShow.toggle()
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct AchieveView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView()
    }
}
