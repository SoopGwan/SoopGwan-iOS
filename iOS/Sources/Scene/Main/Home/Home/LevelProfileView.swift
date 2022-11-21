import SwiftUI

struct LevelProfileView: View {
    @Binding var level: Int
    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .center) {
                Spacer()
                    .frame(height: 5)
                Text(level.levelToTitle())
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("3D8361"))

                Image(level.levelToImageName())
                    .resizable()
                    .frame(width: 210, height: 210)
                    .padding(.vertical, 8)

                Text(level.levelToContent())
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 20)

        }
        .overlay {
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color("2F6149"), lineWidth: 4)
        }
        .cornerRadius(32, antialiased: true)

    }
}
