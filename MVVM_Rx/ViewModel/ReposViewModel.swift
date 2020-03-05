//
//  ReposViewModel.swift
//  MVVM_Rx
//
//  Created by Amr Abdelaal on 05.03.20.
//  Copyright © 2020 Amr Abdelaal. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class ReposViewModel {
    // MARK: - Private Variables
    private var dataService: DataService?
    
    // MARK: - Variables
    var repos: BehaviorRelay<[SingleRepoViewModel]> = BehaviorRelay(value: [])
    
    // MARK: - Intialization
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    // MARK: - Methods
    func getRepos(by language: String) {
        self.dataService?.getRepos(by: language, success: { [weak self] (reposResult) in
            if let reposResult = reposResult {
                self?.repos.accept(reposResult.map {SingleRepoViewModel(with: $0)})
            }
        }, failure: { (error) in
          // TODO: UI Handeling error
        })
    }
}
