//
//  StoryService.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import Foundation

enum StoryError: Error {
    case noDataAvailable
    case cannotProcessData
}

protocol StoryService {
    func fetchStories(completion: @escaping(Result<[Story], StoryError>) -> Void)
    func save(story: Story, completion: @escaping(Result<Story, StoryError>) -> Void)
}

class StoryServiceImpl: StoryService {

    let storiesApiUrl = URLServiceImpl().getURL(for: .stories)
    
    // Getting list of stories
    func fetchStories(completion: @escaping(Result<[Story], StoryError>) -> Void) {
        
        var request = URLRequest(url: storiesApiUrl)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                completion(.failure(.noDataAvailable))
                return
            }

           do {
               let stories = try JSONDecoder().decode([Story].self, from: data)
               completion(.success(stories))
           } catch {
              completion(.failure(.cannotProcessData))
           }
        }.resume()
    }
    
    // Saving User Choice
    func save(story: Story, completion: @escaping (Result<Story, StoryError>) -> Void) {
        
        var request = URLRequest(url: storiesApiUrl)
        request.httpMethod = "POST"
    }
    


}
