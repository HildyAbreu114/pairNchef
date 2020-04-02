//
//  CartTableViewCell.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/31/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    //MARK: UI OBJECTS
    
    lazy var recipeImage : UIImageView = {
        let cartImage = UIImageView()
        cartImage.contentMode = .scaleAspectFill
        cartImage.clipsToBounds = true
        cartImage.layer.cornerRadius = 15
        cartImage.layer.borderColor = #colorLiteral(red: 1, green: 0.8937508464, blue: 0.8871408105, alpha: 1)
        cartImage.layer.borderWidth = 2
        return cartImage
    }()
    
    lazy var totalAmountLabel: UILabel = {
       let totalLabel = UILabel()
        totalLabel.font = UIFont (name: "optima-bold", size: 10)
        totalLabel.text = "serving"
        totalLabel.textAlignment = .center
        totalLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        totalLabel.backgroundColor = #colorLiteral(red: 0.9213426709, green: 0.6355389357, blue: 0.6106185317, alpha: 1)
        totalLabel.alpha = 0.6
        return totalLabel
    }()
    
    lazy var recipeTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont (name: "optima-bold", size: 14)
        titleLabel.text = "serving"
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        titleLabel.backgroundColor = #colorLiteral(red: 0.9213426709, green: 0.6355389357, blue: 0.6106185317, alpha: 1)
        titleLabel.alpha = 0.6
        return titleLabel
    }()
 
    
    
    //MARK: LIFECYCLE
    
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        recipeImageConstraints()
        recipeTitleLabelConstraint()
        totalAmountLabelConstraint()
        
}
required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
   
    //MARK: CONSTRAINTS
    
    func recipeImageConstraints() {
        recipeImage.anchors(top: self.topAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 10, paddingBottom: 10, paddingLeft: 10, paddingRight: 10)
    }
    
    func recipeTitleLabelConstraint() {
           recipeImage.addSubview(recipeTitleLabel)
           recipeTitleLabel.anchors(top: recipeImage.topAnchor, left: recipeImage.leftAnchor, right: recipeImage.rightAnchor, height: 25)
       }
    
    func totalAmountLabelConstraint() {
        recipeImage.addSubview(totalAmountLabel)
               totalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
               
               NSLayoutConstraint.activate(
                   [totalAmountLabel.trailingAnchor.constraint(equalTo: recipeImage.trailingAnchor,constant: 0),
                    totalAmountLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor,constant: 0),
                    totalAmountLabel.bottomAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 0), totalAmountLabel.heightAnchor.constraint(equalToConstant: 75), totalAmountLabel.widthAnchor.constraint(equalToConstant: (recipeImage.frame.width/2)-20)])
               
           }
        

}
