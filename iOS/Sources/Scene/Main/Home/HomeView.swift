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
                LevelProfileView(level: 4)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 50)

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
                .padding(.horizontal, 50)

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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
