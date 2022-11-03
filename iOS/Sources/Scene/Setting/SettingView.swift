import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 13)
                Text("Settings")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color("3D8361"))

                ScrollView(.vertical) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Daehee님 반가워요!")
                                .font(.system(size: 20, weight: .semibold))
                            Text("오늘 습관을 2회 실천했어요.")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                            Text("지금까지 업적을 4개 달성했어요.")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(height: 104)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color("3D8361"), lineWidth: 1)
                    }

                    SettingButton(title: "비밀번호 변경하기") {
                        MainView()
                    }
                    SettingButton(title: "오픈소스 라이센스") {
                        MainView()
                    }
                    SettingButton(title: "개발자 소개") {
                        MainView()
                    }
                    SettingButton(title: "로그아웃", color: .red) {
                        MainView()
                    }
                    Spacer()

                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
