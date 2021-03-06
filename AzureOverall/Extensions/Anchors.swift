
//  Constraints.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/27/20.
//  Copyright © 2020 hildy abreu. All rights reserved.


import Foundation
import UIKit

extension  UIView {
func anchors(top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil){
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
    if let bottom = bottom {
        if let paddingBottom = paddingBottom {
        bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
    }
    if let left = left {
        leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
    }
    if let right = right {
        if let paddingRight = paddingRight{
        rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
    }
    if let top = top {
        topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
    }
    if let width = width {
    widthAnchor.constraint(equalToConstant: width).isActive = true
    }
   if let height = height {
          heightAnchor.constraint(equalToConstant: height).isActive = true
          }
    }
}
