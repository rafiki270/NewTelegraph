//
//  BasicViewControllerSubclassMock.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 18/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit

class BasicViewControllerSubclassMock: BasicViewController {
    
    internal var feedbackArray: [String] = []
    
    // MARK: Layout
    
    override func layoutSubviews() {
        feedbackArray.append("layoutSubviews")
    }
    
    // MARK: Configuration
    
    override func configure() {
        feedbackArray.append("configure")
    }
    
    // MARK: Creating elements
    
    override func addSubviews() {
        feedbackArray.append("addSubviews")
    }
    

}
