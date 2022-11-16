//
//  Dropdown.swift
//  SoopGwan
//
//  Created by 김대희 on 2022/11/15.
//  Copyright © 2022 com.SoopGwan. All rights reserved.
//

import SwiftUI

struct Dropdown: View {
    private let dropdownCornerRadius: CGFloat = 8.0

    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownOptionElement(
                        val: option.val,
                        key: option.key,
                        onSelect: self.onSelect
                    )
                }
        }
        }

        .background(Color.white)
        .cornerRadius(dropdownCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color("3D8361"), lineWidth: 1)
        )
    }
}
