import SwiftUI

struct SettingView: View {
    @StateObject var viewModel = SettingViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 13)
            Text("Settings")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color("3D8361"))

            ScrollView(.vertical) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("반가워요!")
                            .font(.system(size: 20, weight: .semibold))

                        Text("오늘은 어떤 하루를 보내고 계신가요?")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)

                        Text("더 좋은 삶을 실기 위해 오늘도 힘내세요!")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                    }

                    Spacer()
                }
                .padding(.leading, 20)
                .frame(height: 104)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color("3D8361"), lineWidth: 2)
                }

                SettingButton(title: "비밀번호 변경하기") {
                    viewModel.isChangePassword.toggle()
                }

                SettingButton(title: "오늘의 운세") {
                    viewModel.isLuckView.toggle()
                }

                SettingButton(title: "개발자 소개") {
                    viewModel.isDeveloperView.toggle()
                }

                SettingButton(title: "개인정보 처리방침") {
                    viewModel.isOpenSourceView.toggle()
                }

                SettingButton(title: "로그아웃", color: .red) {
                    viewModel.isLogOut.toggle()
                }

                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .soopGwanToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .sheet(isPresented: $viewModel.isChangePassword) {
            PasswordView(id: "0", phoneNumber: "00")
        }
        .sheet(isPresented: $viewModel.isLuckView) {
            SoopGwanWebView(urlToLoad: "https://www.donga.com/news/List/Culture/unse")
        }
        .sheet(isPresented: $viewModel.isDeveloperView) {
            SoopGwanWebView(urlToLoad: "https://www.craft.do/s/1lKISvML9jQHlJ")
        }
        .sheet(isPresented: $viewModel.isOpenSourceView) {
            SoopGwanWebView(urlToLoad: "https://www.craft.do/s/5HXVrGAgNcOQ31")
        }
        .fullScreenCover(
            isPresented: $viewModel.isLogOutButtonPressed) {
                NavigationView {
                    SignInView(isToast: false)
                }
                .accentColor(.black)
            }
        .alert(isPresented: $viewModel.isLogOut) {
            Alert(
                title: Text("로그아웃"),
                message: Text("로그아웃 하시겠습니까?"),
                primaryButton: .destructive(Text("로그아웃"), action: { viewModel.isLogOutButtonPressed.toggle() }),
                secondaryButton: .cancel(Text("취소")))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
