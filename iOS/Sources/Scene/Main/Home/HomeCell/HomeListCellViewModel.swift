//
//  HomeListCellViewModel.swift
//  SoopGwan
//
//  Created by 김대희 on 2022/11/21.
//  Copyright © 2022 com.SoopGwan. All rights reserved.
//

import SwiftUI
import Combine

final class HomeListCellViewModel: BaseViewModel {
    func fatchHabitStatus(_ id: Int) {
        addCancellable(
            remoteHabitDataSourceImpl
                .checkHabitIsSucceed(id: id)
        ) { _ in
        }
    }
}
