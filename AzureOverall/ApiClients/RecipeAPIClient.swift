//
//  APIClient.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/29/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import Foundation

struct RecipeAPIClient {
    static let shared = RecipeAPIClient()
    
    func getData(recipe:String, completionHandler:@escaping (Result<[RecipeInfo],AppError>) ->()){
        
        let URLString = "https://api.spoonacular.com/recipes/search?query=\(recipe)&apiKey=\(Secret.spoonacularKey)"
        
        guard let url = URL(string: URLString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkManager.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in

        switch result {
                        case .failure:
                            completionHandler(.failure(.noDataReceived))
                        case .success(let data):
                            do {
                                let recipes = try JSONDecoder().decode([RecipeInfo].self, from: data)
                                completionHandler(.success(recipes))
                            }catch {
                                completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                            }
                        }
                    }
                }
            }
        
