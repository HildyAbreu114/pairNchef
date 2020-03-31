//
//  BrowseRecipeViewController.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/27/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//
import Foundation
import UIKit

class BrowseRecipeViewController: UIViewController {
    
    //MARK: VARIABLES
    
    var recipes  = [RecipeInfo](){
        didSet {
            collectionView.reloadData()
        }
    }
   
    
    
    //    MARK: UI OBJECTS
    
    lazy var searchBar: UISearchBar = {
        let searchRecipe = UISearchBar()
        searchRecipe.isTranslucent = true
        searchRecipe.barTintColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
        searchRecipe.alpha = 0.7
        searchRecipe.placeholder = "Search for your recipe here!"
        
        return searchRecipe
    }()
    
    lazy var collectionView: UICollectionView = {
        let browseCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        browseCollection.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: "browseCell")
        browseCollection.backgroundColor = .clear
        browseCollection.delegate = self
        browseCollection.dataSource = self
        return browseCollection
    }()
    
     lazy var backgroundImageView: UIImageView = {
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.layer.cornerRadius = 20
            backgroundImage.image = #imageLiteral(resourceName: "4")
            backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        backgroundImage.backgroundColor = .white
            return backgroundImage
        }()



    //MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        searchBarConstraint()
        collectionViewConstraint()
    }
        
    
    // MARK: PRIVATE FUNCTIONS
    
    private func addSubView() {
        view.addSubview(backgroundImageView)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
}
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func loadRecipeData(recipe:String) {
        RecipeAPIClient.manager.getData(recipe: recipe) { (result) in
            switch result {
            case.success(let recipesData):
                DispatchQueue.main.async {
                    self.recipes = recipesData
                }
            case.failure(let error):
                print(error)
                
            }
        }
    }


//MARK: CONSTRAINTS

  func searchBarConstraint() {
    searchBar.anchors(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop:80, paddingLeft: 15, paddingRight: 15, height: 50)
    }


func collectionViewConstraint(){
    collectionView.anchors(top: searchBar.bottomAnchor, bottom: view.bottomAnchor, left:view.leftAnchor, right: view.rightAnchor, paddingBottom: 80, paddingLeft: 15, paddingRight: 15)
    

}
}

//MARK: EXTENSIONS

extension BrowseRecipeViewController: UICollectionViewDelegate {
    
}

extension BrowseRecipeViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "browseCell", for: indexPath) as? BrowseCollectionViewCell else {return UICollectionViewCell()}
        let recipe = recipes[indexPath.row]
        cell.nLabel.text = recipe.title
        cell.servingSizeLabel.text = "Serving Size: \(recipe.servings)"
        cell.prepTimeLabel.text = "Prepare Time: \(recipe.readyInMinutes )"
//        cell.image = recipeCollection?.image
        return cell
    }
}

extension BrowseRecipeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
    let virticalCellCGSize = CGSize(width: 400, height: 400)
    return virticalCellCGSize
  }
   
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     
    return UIEdgeInsets(top: 4.0,left: 4.0,bottom: 4.0,right: 4.0)
  }
}
