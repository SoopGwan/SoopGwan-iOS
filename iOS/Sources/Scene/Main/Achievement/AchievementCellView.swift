//
//  AchievementCellView.swift
//  SoopGwan
//
//  Created by 김대희 on 2022/11/13.
//  Copyright © 2022 com.SoopGwan. All rights reserved.
//

import SwiftUI

struct AchievementCellView<Destination>: View where Destination: View {
    let title: String
    let content: String
    let destination: () -> Destination

    init(
        title: String,
        content: String,
        destination: @escaping () -> Destination
    ) {
        self.title = title
        self.content = content
        self.destination = destination
    }

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("555555"))

                    Spacer()
                        .frame(height: 4)

                    Text(content)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("999999"))
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .frame(height: 80)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color("2F6149"), lineWidth: 2)
            }
        }
    }
}
