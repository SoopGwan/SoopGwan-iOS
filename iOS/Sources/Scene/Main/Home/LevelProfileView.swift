import SwiftUI

struct LevelProfileView: View {
    @State var level: Int
    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .center) {
                Text(level.levelToTitle())
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("3D8361"))

                Image(level.levelToImageName())
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 8)

                Text(level.levelToContent())
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 320)
        .overlay {
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color("2F6149"), lineWidth: 2)
        }
        .cornerRadius(32, antialiased: true)
        .shadow(color: Color("797F53"), radius: 32, x: 0, y: 4)

    }
}

struct LevelProfileView_Previews: PreviewProvider {
    static var previews: some View {
        LevelProfileView(level: 1)
    }
}
