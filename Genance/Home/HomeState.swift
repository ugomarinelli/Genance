//
//  HomeState.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import Foundation

enum HomeStatus {
    case ready
    case loading
    case done
}

struct HomeState {
    var hasLoaded: Bool
    var stories: [Story]?
    var error: StoryError?
}
