//
//  Repo.swift
//  MVVM_Rx
//
//  Created by Amr Abdelaal on 05.03.20.
//  Copyright © 2020 Amr Abdelaal. All rights reserved.
//

import Foundation

class ReposItems: Codable {
    let items: [Repo]
}

class Repo: Codable {
    let id: Int
    let node_id: String
    let name: String
    let full_name: String
    let html_url: String
    let fork: Bool
    let updated_at: String
}
