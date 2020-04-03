//
//  AddToCartPersistenceHelper.swift
//  AzureOverall
//
//  Created by hildy abreu on 4/2/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import Foundation

struct AddToCartPersistenceHelper {
    
    private static var detailRec = [RecipeInfo]()
    
    static let manager = AddToCartPersistenceHelper()
    func save(newRecipe: RecipeInfo) throws {
        try persistenceHelper.save(newElement: newRecipe)
    }
    func getRecipe() throws -> [RecipeInfo] {
        return try persistenceHelper.getObjects()
    }
    func delete(index: Int) throws {
        return try persistenceHelper.deleteAtIndex(index: index)
    }
    
    private let persistenceHelper = PersistenceHelper<RecipeInfo>(fileName: "addsToCart.plist")
    private init() {}
}
