//
//  DataService.swift
//  MVVM_Rx
//
//  Created by Amr Abdelaal on 05.03.20.
//  Copyright © 2020 Amr Abdelaal. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    // MARK:- GET Methods
    func getRepos(by language: String, success: @escaping ([Repo]?) -> (), failure: @escaping (Error?) -> ()) {
        let completeUrl = "\(Utilities.UrlParts.baseUrl.rawValue)\(Utilities.UrlParts.query.rawValue)\(Utilities.UrlParts.language.rawValue)\(language)"
        
        AF.request(completeUrl).responseJSON { response in
            if let error = response.error {
                failure(error)
            }
            
            if let data = response.data {
                do {
                    let repos = try JSONDecoder().decode(ReposItems.self, from: data).items
                    success(repos)
                } catch {
                    failure(Utilities.GenericError.wrongJsonFormat)
                }
            } else {
                failure(Utilities.GenericError.connectionFaild)
            }
        }
    }
}
