import SwiftUI

struct LevelProfileView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(
                alignment: .center,
                spacing: 0
            ) {
                Text("")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("3D8361"))
                Image("")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.gray)
            }
            .frame(width: .infinity, height: 340)
            Spacer()
        }
        .overlay {
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color("2F6149"), lineWidth: 2)
        }
    }
}

struct LevelProfileView_Previews: PreviewProvider {
    static var previews: some View {
        LevelProfileView()
    }
}
