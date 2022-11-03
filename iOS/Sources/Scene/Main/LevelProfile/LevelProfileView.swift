import SwiftUI

struct LevelProfileView: View {
    var body: some View {
        ZStack {
            Color.white
            HStack {
                Spacer()
                VStack(
                    alignment: .center,
                    spacing: 0
                ) {
                    Text("LV 3")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("3D8361"))
                    Image("")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray)

                }
                Spacer()
            }
        }
        .frame(height: 300)
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
        LevelProfileView()
    }
}
