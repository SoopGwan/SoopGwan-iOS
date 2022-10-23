import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Spacer()
                .frame(height: 22)
            Text("SoopGwan")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(Color("3D8361"))
                .padding(.bottom, 3)
            Text("Home")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color("66A865"))
                .padding(.bottom, 22)
            LevelProfileView()
                .padding(.bottom, 57)
            HStack(alignment: .center) {
                Text("나의 습관")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("4A4A4A"))
                Spacer()
                Button {
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color("4A4A4A"))
                        .padding()
                        .frame(width: 32, height: 32)
                }
            }
            Color(.black)
                .frame(height: 1)
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
