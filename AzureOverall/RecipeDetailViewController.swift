//
//  RecipeDetailViewController.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/28/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    
    //MARK: UI OBJECTS
    
    lazy var recipeLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont (name: "savoye-bold", size: 24)
        nameLabel.text = "name"
        nameLabel.textAlignment = .center
        nameLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        nameLabel.backgroundColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
        nameLabel.alpha = 0.4
        return nameLabel
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
        view.alpha = 0.3
        return view
    }()
    
    lazy var recipeImage: UIImageView = {
       let cellImage = UIImageView()
           cellImage.contentMode = .scaleAspectFill
           cellImage.clipsToBounds = true
           cellImage.layer.borderWidth = 1
           cellImage.layer.borderColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
           cellImage.layer.cornerRadius = 20
           cellImage.backgroundColor = .clear
          return cellImage
       }()
    
    lazy var stepperLabel: UILabel = {
        let stepperValue = UILabel()
        stepperValue.textAlignment = .center
        stepperValue.backgroundColor = .black
        return stepperValue
    }()
    
    lazy var addToCartButton: UIButton = {
        let addCartButton = UIButton()
        addCartButton.setTitle("Add recipe to cart",for: .normal)
        addCartButton.titleLabel?.font = UIFont (name: "optima-bold", size: 18 )
        addCartButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        addCartButton.titleLabel?.textAlignment = .center
        addCartButton.backgroundColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
        addCartButton.alpha = 0.3
        addCartButton.layer.cornerRadius = 20
        addCartButton.layer.borderWidth = 1
        addCartButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
        return addCartButton
    }()
    lazy var goToCartButton: UIButton = {
        let image = UIImage(named:"shoppingCart3")as UIImage?
        let cartButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        cartButton.setImage(image, for: .normal)
        cartButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        cartButton.addTarget(self, action: Selector("buttonTapped"),for:.touchUpInside)
        return cartButton
    }()
    
    
    
   
   
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   

}
