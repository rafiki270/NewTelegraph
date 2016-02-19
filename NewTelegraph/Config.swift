//
//  Config.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class Config : NSObject {
    
    internal static let apiUrl: String = "http://s.telegraph.co.uk/tmgmobilepub/articles.json"
    
    
    // MARK: Styles
    
    internal static func configureGlobalInterface() {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            UIApplication.sharedApplication().statusBarStyle = .LightContent
        }
        else {
            UIApplication.sharedApplication().statusBarStyle = .Default
        }
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "TimesNewRomanPS-BoldMT", size: 28)!,
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    }
    
}