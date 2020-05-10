//
//  HomePresenter.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import Foundation

protocol HomePresenter {
    var userInterface: HomeView? { get set }
    func prepare(_ userInterface: HomeView)
}

class HomePresenterImpl: HomePresenter {

    var userInterface: HomeView?
    var stories: [Story]?
    var error: StoryError?
    var hasLoaded: Bool = false
    
    func prepare(_ userInterface: HomeView) {
        self.userInterface = userInterface
        StoryServiceImpl().fetchStories { [weak self] result in
            switch result {
            case .failure(let error):
                // Show error message
                self?.error = error
            case .success(let stories):
                //Handle Success
                self?.error = nil
                self?.stories = stories
            }
            self?.updateState()
        }
    }
    
    private func updateState() {
        let newState = HomeState(hasLoaded: hasLoaded, stories: stories, error: error)
        userInterface?.update(with: newState)
    }
}
