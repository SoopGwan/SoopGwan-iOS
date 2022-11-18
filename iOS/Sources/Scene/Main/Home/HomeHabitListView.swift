import SwiftUI

struct HomeHabitListView: View {
    @State var id: Int
    @State var title: String
    @State var successStatus: Bool

    init(
        id: Int,
        title: String,
        successStatus: Bool
    ) {
        self.id = id
        self.title = title
        self.successStatus =  successStatus
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 15, weight: .bold))
            Spacer()

            CheckBok(isOn: $successStatus)
        }
        .padding(.horizontal, 12)
        .frame(height: 40)
    }
}
