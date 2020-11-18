//
//  Utility.swift
//  Assignment
//
//  Created by Apple on 18/11/20.
//

import Foundation
import UIKit

final class Utility: NSObject {
   
    static let shareInstance = Utility()
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    
    
    private override init() {
        super.init()
    }
    
    
    func showProgressIndicator( view: UIView)  {
       
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
                activityIndicator.color = UIColor.darkGray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopProgressIndicator() {
        activityIndicator.stopAnimating()
    }
    
    
}
