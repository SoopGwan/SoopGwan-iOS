import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 22)

            Text("SoopGwan")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(Color("3D8361"))
                .padding(.horizontal, 50)

            Spacer()
                .frame(height: 10)

            ScrollView(
                .vertical,
                showsIndicators: false
            ) {
                Spacer()
                    .frame(height: 10)
                LevelProfileView(level: 2)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 50)

                HStack(alignment: .center) {
                    Text("나의 습관")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("4A4A4A"))

                    Spacer()

                    Button {
                        viewModel.presentAlert.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("4A4A4A"))
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.horizontal, 62)
                Color(.black)
                    .frame(height: 1)
                    .padding(.horizontal, 50)

                Spacer()
                    .frame(height: 5)

                ForEach(viewModel.habitList, id: \.self) { list in
                    HomeHabitListView(
                        id: list.id,
                        title: list.title,
                        successStatus: list.successStatus)
                    .padding(.horizontal, 50)
                }
                Spacer()
                    .frame(height: 10)
            }
            .padding(.bottom, 1)

        }
        .alert("습관 생성", isPresented: $viewModel.presentAlert, actions: {
            TextField("습관을 입력해 주세요.", text: $viewModel.newHabitTitle)
            Button("생성", action: {
                viewModel.addHabit()
            })
            Button("취소", role: .cancel, action: {})
        }, message: {
            Text("바꾸고 싶은 습관을 입력해 주세요 😀")
        })
        .soopGwanToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
