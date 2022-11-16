import SwiftUI

struct ArchiveView: View {
    @StateObject var viewModel = ArchiveViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                    .frame(height: 66)

                ScrollView(.vertical) {
                    ForEach(viewModel.list, id: \.self) { list in
                        Button {
                            print("")
                        } label: {
                            ArciveListCellView(
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
                        viewModel.yearSelect = key
                    }
                )

                DropdownButton(
                    displayText: $viewModel.monthSelect,
                    options: viewModel.monthOptions,
                    onSelect: { key in
                        viewModel.monthSelect = key
                    }
                )
            }
            .padding(.top, 10)

        }
        .padding(.horizontal, 20)

    }
}
