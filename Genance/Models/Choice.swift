//
//  Choice.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import Foundation

class Choice: NSObject, Decodable {
    var title: String
    var percentage: Int? 
    var votes: Int?
}
