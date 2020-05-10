//
//  ChoicesPresenter.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import Foundation

protocol ChoicesPresenter {
    var userInterface: ChoicesView? { get set }
    func prepare()
    func didSelect(choice: Choice)
}

class ChoicesPresenterImpl: ChoicesPresenter {
    var userInterface: ChoicesView?
    var stories: [Story] = []
    var currentStory: Story?
    var hasAnswered: Bool = false
    
    func prepare() {
        guard let firstStory = stories.first else {
            return
        }
        
        self.currentStory = firstStory
        updateState()
    }
    
    func setCurrentStory() {
        // We can go onto the next one
        if !stories.isEmpty, stories.count > 1 {
            stories.removeFirst()
            currentStory = stories.first
            updateState()
        }
        
        //It is the last one, we fetch the new ones
    }
    
    func updateState() {
        let newState = ChoicesState(story: currentStory, hasAnswered: hasAnswered)
        userInterface?.update(with: newState)
    }
    
    func didSelect(choice: Choice) {
        guard let currentStory = currentStory else {
            return
        }
        
        StoryServiceImpl().save(story: currentStory, completion: { [weak self] result in
            switch result {
            case .failure(let error):
                // Show error message
                print("error saving")
            case .success(let story):
                //Handle Success
                self?.hasAnswered = true
                self?.currentStory = story
                self?.updateState()
            }
        })
    }
    
    
}

