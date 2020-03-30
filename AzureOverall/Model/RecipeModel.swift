//
//  RecipeModel.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/29/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import Foundation

// MARK: MODEL
struct Result: Codable {
    let id: Int?
    let title: String?
    let readyInMinutes: Int?
    let servings: Int?
    let image: String?
}
