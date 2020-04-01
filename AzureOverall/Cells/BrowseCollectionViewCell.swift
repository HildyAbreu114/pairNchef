//
//  BrowseCollectionViewCell.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/28/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import UIKit

class BrowseCollectionViewCell: UICollectionViewCell {
    
    //MARK: UI OBJECTS
    
    lazy var nLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont (name: "optima-bold", size: 18)
        nameLabel.text = "name"
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textAlignment = .center
        nameLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        nameLabel.backgroundColor = #colorLiteral(red: 0.9177966714, green: 0.6097382903, blue: 0.5848943591, alpha: 1)
        nameLabel.alpha = 0.5
        return nameLabel
    }()
    
    lazy var image: UIImageView = {
        let cellImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        cellImage.contentMode = .scaleAspectFill
        cellImage.clipsToBounds = true
        cellImage.layer.borderWidth = 2
        cellImage.layer.borderColor = #colorLiteral(red: 1, green: 0.8937508464, blue: 0.8871408105, alpha: 1)
        cellImage.layer.cornerRadius = 20
        cellImage.backgroundColor = .clear
       return cellImage
    }()
    
    lazy var servingSizeLabel: UILabel = {
        let servingLabel = UILabel()
        servingLabel.font = UIFont (name: "optima-bold", size: 16)
        servingLabel.text = "serving"
        servingLabel.textAlignment = .center
        servingLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        servingLabel.backgroundColor = #colorLiteral(red: 0.9213426709, green: 0.6355389357, blue: 0.6106185317, alpha: 1)
        servingLabel.alpha = 0.5
        return servingLabel
    }()
    
    lazy var prepTimeLabel: UILabel = {
        let prepLabel = UILabel()
        prepLabel.font = UIFont (name: "optima-bold", size: 16)
        prepLabel.text = "prep"
        prepLabel.textAlignment = .center
        prepLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        prepLabel.backgroundColor = #colorLiteral(red: 0.9168686271, green: 0.6357840896, blue: 0.6107411981, alpha: 1)
        prepLabel.alpha = 0.5
        return prepLabel
        }()

    
    
    
    
    //MARK: LIFECYCLE
    
    override init(frame:CGRect) {
    super.init(frame:frame)
        imageViewConstraint()
        nLabelConstraint()
        serveLabelConstraint()
        prepLabelConstraint()
    
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: CONSTRAINTS
    
    func imageViewConstraint() {
        self.addSubview(image)
        image.anchors(top: self.topAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 20, paddingBottom: 20, paddingLeft: 20, paddingRight: 20, width: 250, height: 250)
    }

    func nLabelConstraint() {
        image.addSubview(nLabel)
        nLabel.anchors(top: image.topAnchor, left: image.leftAnchor, right: image.rightAnchor, height: 75)
    }
    
    func serveLabelConstraint() {
        image.addSubview(servingSizeLabel)
        servingSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([servingSizeLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 0), servingSizeLabel.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: 0),servingSizeLabel.heightAnchor.constraint(equalToConstant: 75), servingSizeLabel.widthAnchor.constraint(equalToConstant: (image.frame.width/2)-20)])
    }
    
    func prepLabelConstraint() {
        image.addSubview(prepTimeLabel)
        prepTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [prepTimeLabel.trailingAnchor.constraint(equalTo: image.trailingAnchor,constant: 0), prepTimeLabel.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: 0), prepTimeLabel.heightAnchor.constraint(equalToConstant: 75), prepTimeLabel.widthAnchor.constraint(equalToConstant: (image.frame.width/2)-20)])
        
    }
}
