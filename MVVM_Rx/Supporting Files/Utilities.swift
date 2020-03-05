//
//  Utilities.swift
//  MVVM_Rx
//
//  Created by Amr Abdelaal on 05.03.20.
//  Copyright © 2020 Amr Abdelaal. All rights reserved.
//

import Foundation

struct Utilities {
    
    // MARK: - Api parts
    enum UrlParts: String {
        case baseUrl = "https://api.github.com/search/repositories?"
        case query = "q="
        case language = "language:"
    }
    
    // MARK: - Generic Error Handling
    enum GenericError: Error {
        case wrongJsonFormat
        case connectionFaild
    }
    
    // MARK: - Helper Methods
    func formateDate(input: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: input) {
            dateFormatter.dateFormat = "dd.MMM.yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
        return input
    }
}
