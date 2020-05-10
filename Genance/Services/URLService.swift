//
//  URLBuilderService.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import Foundation
import UIKit

enum APIType : String {
    case stories = "posts"
}

protocol URLService {
    func getURL(for apiType: APIType) -> URL
}

class URLServiceImpl: URLService {
    let baseUrl = Environment.baseURL.absoluteString
    
    func getURL(for apiType: APIType) -> URL {
        guard let url = URL(string: baseUrl + apiType.rawValue) else {
            fatalError("API Construction Error")
        }
        return url
    }
}
