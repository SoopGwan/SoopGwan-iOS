import SwiftUI

struct HomeHabitListView: View {
    @State var id: Int
    @State var title: String
    @State var successStatus: Bool
    @StateObject var viewModel = HomeListCellViewModel()

    init(
        id: Int,
        title: String,
        successStatus: Bool
    ) {
        self.id = id
        self.title = title
        self.successStatus =  successStatus
        print(id)
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 15, weight: .bold))
            Spacer()
            Button {
                successStatus = true
                viewModel.fatchHabitStatus(id)
            } label: {
                Image(systemName: successStatus ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(successStatus ? Color("66A865") : .gray)
            }
        }
        .padding(.horizontal, 12)
        .frame(height: 40)
    }
}
