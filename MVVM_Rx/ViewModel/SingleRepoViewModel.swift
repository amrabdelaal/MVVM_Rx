//
//  SingleRepoViewModel.swift
//  MVVM_Rx
//
//  Created by Amr Abdelaal on 05.03.20.
//  Copyright © 2020 Amr Abdelaal. All rights reserved.
//

import Foundation

class SingleRepoViewModel {
    var fullName: String
    var updatedAt: String
    
    init(with repo: Repo) {
        self.fullName = repo.full_name
        self.updatedAt = Utilities().formateDate(input: repo.updated_at)
    }
}
