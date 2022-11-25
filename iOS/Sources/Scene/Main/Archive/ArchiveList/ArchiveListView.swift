import SwiftUI
import Service

struct ArchiveListView: View {
    @StateObject var viewModel = ArchiveListViewModel()
    @State private var showModal = false

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                    .frame(height: 66)

                ScrollView(
                    .vertical,
                    showsIndicators: false
                ) {
                    ForEach(viewModel.list, id: \.self) { list in
                        Button {
                            print("\(list)")
                            viewModel.selectList = list
                            self.showModal = true
                        } label: {
                            ArchiveListCellView(
                                content: "\(list.startAt) ~ \(list.endAt)",
                                level: list.level
                            )
                        }
                    }
                }
            }

            HStack {
                Text("Archive")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color("3D8361"))

                Spacer()

                DropdownButton(
                    displayText: $viewModel.yearSelect,
                    options: viewModel.yearOptions,
                    onSelect: { key in
                        viewModel.yearSelect = "\(key)년"
                        viewModel.yearSelectNumber = key
                    }
                )
            }
            .padding(.top, 10)
            .padding(.bottom, 1)

        }
        .onAppear {
            viewModel.onAppear()
        }
        .padding(.horizontal, 20)
        .soopGwanToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .sheet(isPresented: self.$showModal) {
            ArchiveDetailView(
                level: viewModel.selectList.level,
                date: "\(viewModel.selectList.startAt) ~ \(viewModel.selectList.endAt)"
            )
        }
    }
}
