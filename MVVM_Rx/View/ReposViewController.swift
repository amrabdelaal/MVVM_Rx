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
    var viewModel: ReposViewModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ReposViewModel(dataService: DataService())
        viewModel?.getRepos(by: "swift")
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
    
}

