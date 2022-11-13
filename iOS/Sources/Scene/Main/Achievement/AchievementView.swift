import SwiftUI

struct AchievementView: View {
    @StateObject var viewModel = AchievementViewModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 13)
                Text("Achievement")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color("3D8361"))

                ScrollView(.vertical) {
                    ForEach(viewModel.list, id: \.self) { content in
                        
                    }
                    AchievementCellView(
                        title: <#T##String#>,
                        content: <#T##String#>)
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
