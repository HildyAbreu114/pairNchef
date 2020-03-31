//
//  RecipeDetailViewController.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/28/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    //MARK: VARIABLES
    
    var detail : RecipeInfo!{
        didSet{
            loadDetailData()
        }
    }
    
    
    var stepper: UIStepper!


    
    
    //MARK: UI OBJECTS
    
    lazy var recipeLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont (name: "optima-bold", size: 30)
        nameLabel.text = "Name"
        nameLabel.textAlignment = .center
        nameLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        nameLabel.layer.borderWidth = 2
        nameLabel.layer.borderColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
        nameLabel.backgroundColor = #colorLiteral(red: 1, green: 0.8937508464, blue: 0.8871408105, alpha: 1)
        nameLabel.alpha = 0.6
        return nameLabel
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        view.alpha = 0.5
        return view
    }()
    
    lazy var recipeImage: UIImageView = {
       let cellImage = UIImageView()
           cellImage.contentMode = .scaleAspectFill
           cellImage.clipsToBounds = true
           cellImage.layer.borderWidth = 2
           cellImage.layer.borderColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
           cellImage.layer.cornerRadius = 20
//           cellImage.backgroundColor = .clear
          return cellImage
       }()
    
    lazy var stepperLabel: UILabel = {
        let stepperValue = UILabel()
        stepperValue.textAlignment = .center
        stepperValue.text = "0"
        stepperValue.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        stepperValue.alpha = 0.4
        stepperValue.layer.cornerRadius = 20
        stepperValue.backgroundColor = #colorLiteral(red: 1, green: 0.8937508464, blue: 0.8871408105, alpha: 1)
        return stepperValue
    }()
    

    
    lazy var addToCartButton: UIButton = {
        let addCartButton = UIButton()
        addCartButton.setTitle("Add recipe to cart",for: .normal)
        addCartButton.titleLabel?.font = UIFont (name: "optima-bold", size: 18 )
        addCartButton.setTitleColor(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), for: .normal)
        addCartButton.titleLabel?.textAlignment = .center
        addCartButton.backgroundColor = #colorLiteral(red: 1, green: 0.8978595138, blue: 0.891151607, alpha: 1)
        addCartButton.alpha = 0.4
        addCartButton.layer.cornerRadius = 20
        addCartButton.layer.borderWidth = 2
        addCartButton.layer.borderColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
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
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.layer.cornerRadius = 20
        backgroundImage.image = #imageLiteral(resourceName: "2")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
    backgroundImage.backgroundColor = .white
        return backgroundImage
    }()
    
    //MARK: FUNCTIONS
    
//    func stepper() {
//        stepper = UIStepper()
//        stepper.frame = CGRect
//    }
    
    
    
    
     //MARK: LIFECYCLE
        
        override func viewDidLoad() {
            super.viewDidLoad()
            addSubView()
           
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            contentViewConstraints()
            recipeNameLabelConstraint()
            recipeImageConstraints()
            stepperLabelConstraints()
            addToCartButtonConstraints()
            goToCartConstraints()
        }
        
      //MARK: PRIVATE FUNCTIONS
    
        private func addSubView() {
            view.addSubview(backgroundImageView)
            view.addSubview(contentView)
            contentView.addSubview(recipeLabel)
            contentView.addSubview(recipeImage)
            view.addSubview(stepperLabel)
            view.addSubview(addToCartButton)
            view.addSubview(goToCartButton)
    }
   
    
    //    func stepper() {
    //        stepper = UIStepper()
    //        stepper.frame = CGRect
    //    }
    
    private func loadDetailData() {
        self.recipeLabel.text = detail.title
        let imageString = "https://spoonacular.com/recipeImages/\(detail.image)"
        recipeImage.kf.setImage(with: URL(string: imageString))
        
    }
    
    
    //MARK: CONSTRAINTS
    
    func recipeNameLabelConstraint() {
        recipeLabel.anchors(top: contentView.topAnchor, bottom: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,paddingTop: 13, height: 35 )
    }

    func contentViewConstraints() {
        contentView.anchors(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 120, paddingBottom: 240, paddingLeft: 15, paddingRight: 15)
    }

    func recipeImageConstraints() {
        recipeImage.anchors(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 100, paddingBottom: 120, paddingLeft: 50, paddingRight: 50)
    }
   
//    func stepperConstraints() {
//
//    }
    
    func stepperLabelConstraints() {
        stepperLabel.anchors(top: recipeImage.bottomAnchor, right: contentView.rightAnchor, paddingTop: 47, paddingBottom: 50, paddingLeft: 150,paddingRight: 40, width: 65, height:25)
    }
    
    func goToCartConstraints() {
        goToCartButton.anchors(top: recipeLabel.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingBottom: 15, paddingLeft: 160, paddingRight: 15, width: 45, height: 45)
    }
    
    func addToCartButtonConstraints() {
        addToCartButton.anchors(top: contentView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingBottom: 30, paddingLeft: 30, paddingRight: 30, height: 35)
    }
    
    
}
