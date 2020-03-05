//
//  ReposViewController.swift
//  MVVM_Rx
//
//  Created by Amr Abdelaal on 04.03.20.
//  Copyright © 2020 Amr Abdelaal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ReposViewController: UIViewController {
    
    // MARK:- IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    private var viewModel: ReposViewModel?
    private let disposeBag = DisposeBag()
    private let throttleIntervalInMilliseconds = 700
}

//MARK:- View Lifecycle
extension ReposViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ReposViewModel(dataService: DataService())
        self.setupTableViewBinding()
        self.setupSearchBarObserver()
    }
}

//MARK: - Rx Setup
private extension ReposViewController {
    func setupTableViewBinding() {
        viewModel?.repos
            .bind(to: tableView
                .rx
                .items(cellIdentifier: RepoTableViewCell.Identifier,
                       cellType: RepoTableViewCell.self)) {
                        row, repo, cell in
                        cell.repoName.text = repo.fullName
                        cell.lastUpdate.text = repo.updatedAt
        }
        .disposed(by: disposeBag)
    }
    
    func setupSearchBarObserver() {
        searchBar
            .rx
            .text
            .observeOn(MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .throttle(.milliseconds(throttleIntervalInMilliseconds), scheduler: MainScheduler.instance)
            .subscribe(onNext: {[unowned self] in
                self.viewModel?.getRepos(by: $0 ?? "")
            })
            .disposed(by: disposeBag)
        
    }
}

