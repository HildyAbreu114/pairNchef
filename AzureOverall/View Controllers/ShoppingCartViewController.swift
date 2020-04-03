//
//  ShoppingCartViewController.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/29/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    //MARK: VARIABLE
    
    var cartRecipe = [RecipeInfo]()
    
    //MARK: UI OBJECT
    
    lazy var shoppingCartTableview: UITableView = {
    let cartTableView = UITableView()
        cartTableView.register(CartTableViewCell.self, forCellReuseIdentifier: "CartCell")
    return cartTableView
    }()
    
    lazy var background: UIView = {
        let background = UIView()
        background.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        background.alpha = 0.4
        return background
    }()

    //MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setDelegate()
        loadAdded()
        view.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        shoppingCartTVConstraints()
    }
    
   //MARK: PRIVATE FUNCTION
    
    private func addSubView() {
         view.addSubview(background)
         view.addSubview(shoppingCartTableview)
        
    }
   
    private func setDelegate() {
        shoppingCartTableview.delegate = self
        shoppingCartTableview.dataSource = self
    }
    
    private func loadAdded(){
        do {
            let getAdded = try AddToCartPersistenceHelper.manager.getRecipe()
            cartRecipe = getAdded
        } catch {
            return
        }
    }
    
    
    private func loadCartData(recipe:String) {
    RecipeAPIClient.manager.getData(recipe: recipe) { (result) in
        switch result {
        case.success(let recipesData):
            DispatchQueue.main.async {
                self.cartRecipe = recipesData
            }
        case.failure(let error):
            print(error)

        }
    }

}
   
    //MARK: CONSTRAINTS
      
      func shoppingCartTVConstraints() {
          shoppingCartTableview.anchors(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingBottom: 80, paddingLeft: 10, paddingRight: 10)
      }
      
}
//MARK: EXTENSIONS
   
   extension ShoppingCartViewController: UITableViewDelegate {
       
   }
   
extension ShoppingCartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartRecipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartTableViewCell else {return UITableViewCell()}
                let cart = cartRecipe[indexPath.row]
                cell.recipeTitleLabel.text = cart.title
        if let numInCart = cart.numInCart{
            cell.totalAmountLabel.text = "Total amount: \(numInCart)"

            
        }
               let imageString = "https://spoonacular.com/recipeImages/\(cart.image)"
                cell.recipeImage.kf.setImage(with: URL(string: imageString))
                return cell
            }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
        }
    
    
       
   
