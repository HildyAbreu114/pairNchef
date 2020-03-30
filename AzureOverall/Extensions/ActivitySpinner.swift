//
//  ActivitySpinner.swift
//  AzureOverall
//
//  Created by hildy abreu on 3/29/20.
//  Copyright © 2020 hildy abreu. All rights reserved.
//

import Foundation
import UIKit

var activityView:UIView?

extension UIViewController {
   func spinnerAppear() {
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.center = activityView!.center
        activity.startAnimating()
        activityView?.addSubview(activity)
        self.view.addSubview(activityView!)
    }
    
    func spinnerRemove() {
        activityView?.removeFromSuperview()
        activityView = nil
    }
}
