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

    //MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setDelegate()
        view.backgroundColor = .green
    }
    
   //MARK: PRIVATE FUNCTION
    
    private func addSubView() {
        view.addSubview(shoppingCartTableview)
    }
   
    private func setDelegate() {
        shoppingCartTableview.delegate = self
        shoppingCartTableview.dataSource = self
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
        <#code#>
    }
    
       
   }
